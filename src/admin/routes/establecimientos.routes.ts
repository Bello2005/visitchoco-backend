import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth } from '../middleware/auth';
import { audit } from '../middleware/audit';
import { encolarCambio } from '../services/approvalQueue';

const router = Router();

// Whitelist = columnas reales de la tabla establecimientos.
// Claves desconocidas se descartan (strip por defecto de z.object).
const establecimientoSchema = z.object({
  nombre: z.string().min(2).max(200),
  categoria: z.string().min(2).max(100),
  subcategoria: z.string().max(100).nullable(),
  municipio_id: z.number().int().positive().nullable(),
  direccion: z.string().max(500).nullable(),
  rnt: z.string().max(50).nullable(),
  telefono: z.string().max(50).nullable(),
  email: z.string().email().nullable(),
  foto_url: z.string().url().nullable(),
  especialidades: z.array(z.string()),
  activo: z.boolean(),
  verificado: z.boolean(),
  notas_admin: z.string().max(5000).nullable(),
});

// LIST
router.get('/', requireAuth, async (req, res) => {
  const u = req.adminUser!;
  const limit = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);
  const search = String(req.query.q ?? '').trim();
  const categoria = req.query.categoria as string | undefined;
  const municipio_id = req.query.municipio_id ? Number(req.query.municipio_id) : undefined;
  const estado = req.query.estado as string | undefined;
  const reclamado = req.query.reclamado as string | undefined;

  const where: string[] = [];
  const params: unknown[] = [];
  let p = 0;

  if (u.role === 'dueno_negocio') {
    where.push(`reclamado = TRUE AND id IN (
      SELECT establecimiento_id FROM user_establecimientos WHERE user_id = $${++p}
    )`);
    params.push(u.id);
  }

  if (search) {
    where.push(`(unaccent(nombre) ILIKE unaccent($${++p}))`);
    params.push(`%${search}%`);
  }
  if (categoria) { where.push(`categoria = $${++p}`); params.push(categoria); }
  if (municipio_id) { where.push(`municipio_id = $${++p}`); params.push(municipio_id); }
  if (estado === 'activo') where.push(`activo = TRUE`);
  if (estado === 'inactivo') where.push(`activo = FALSE`);
  if (estado === 'verificado') where.push(`verificado = TRUE`);
  if (estado === 'pendiente_verif') where.push(`verificado = FALSE`);
  if (reclamado === 'si') where.push(`reclamado = TRUE`);
  if (reclamado === 'no') where.push(`reclamado = FALSE`);

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT * FROM v_establecimientos_admin ${whereClause}
       ORDER BY updated_at DESC NULLS LAST
       LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(`SELECT COUNT(*)::int FROM v_establecimientos_admin ${whereClause}`, params)
  ]);

  res.json({ items: rowsQ.rows, total: countQ.rows[0].count, limit, offset });
});

// GET ONE
router.get('/:id', requireAuth, async (req, res) => {
  const u = req.adminUser!;
  const { id } = req.params;

  if (u.role === 'dueno_negocio') {
    const owns = await pool.query(
      `SELECT 1 FROM user_establecimientos WHERE user_id = $1 AND establecimiento_id = $2`,
      [u.id, id]
    );
    if (owns.rows.length === 0) return res.status(403).json({ error: 'no_es_tu_negocio' });
  }

  const result = await pool.query(
    `SELECT e.*,
            m.name AS municipio_nombre,
            ST_X(e.ubicacion::geometry) AS lng_coord,
            ST_Y(e.ubicacion::geometry) AS lat_coord
       FROM establecimientos e
       LEFT JOIN municipalities m ON m.id = e.municipio_id
       WHERE e.id = $1::uuid`, [id]
  );
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });

  const mediaQ = await pool.query(
    `SELECT id, url_publica, alt_text, caption, credito, posicion, es_principal
       FROM media_assets
       WHERE entidad_tipo = 'establecimiento' AND entidad_id = $1 AND activo = TRUE
       ORDER BY es_principal DESC, posicion ASC`,
    [id]
  );

  let cambios_pendientes = null;
  if (u.role !== 'dueno_negocio') {
    const cpQ = await pool.query(
      `SELECT id, cambios, solicitado_por, comentario_solicitante, created_at
         FROM approval_queue
        WHERE entidad_tipo = 'establecimiento' AND entidad_id = $1 AND estado = 'pendiente'
        ORDER BY created_at DESC LIMIT 1`,
      [id]
    );
    cambios_pendientes = cpQ.rows[0] ?? null;
  }

  res.json({ establecimiento: result.rows[0], media: mediaQ.rows, cambios_pendientes });
});

// PATCH — dual flow
router.patch('/:id', requireAuth, async (req, res) => {
  const u = req.adminUser!;
  const { id } = req.params;
  const parse = establecimientoSchema.partial().safeParse(req.body);
  if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

  if (u.role === 'dueno_negocio') {
    const owns = await pool.query(
      `SELECT 1 FROM user_establecimientos WHERE user_id = $1 AND establecimiento_id = $2`,
      [u.id, id]
    );
    if (owns.rows.length === 0) return res.status(403).json({ error: 'no_es_tu_negocio' });
  }

  // editor y negocio no escriben directo: sus cambios van a approval_queue.
  if (u.role === 'dueno_negocio' || u.role === 'editor_institucional') {
    const queueId = await encolarCambio({
      entidad_tipo: 'establecimiento',
      entidad_id: id,
      cambios: parse.data as Record<string, unknown>,
      solicitado_por: u.id,
      comentario: (req.body as Record<string, string>).comentario_solicitante ?? null,
    });
    audit(req, { accion: 'change_request', entidad_tipo: 'establecimiento', entidad_id: id, cambios: parse.data });
    return res.json({ ok: true, en_revision: true, queue_id: queueId });
  }

  const fields = Object.keys(parse.data);
  if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });
  const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
  const values: unknown[] = Object.values(parse.data);
  values.push(id);
  values.push(u.email);

  const result = await pool.query(
    `UPDATE establecimientos SET ${sets}, updated_by = $${values.length}
      WHERE id = $${values.length - 1}::uuid RETURNING *`,
    values
  );
  audit(req, { accion: 'update', entidad_tipo: 'establecimiento', entidad_id: id, cambios: parse.data });
  res.json({ ok: true, establecimiento: result.rows[0] });
});

// SOFT DELETE
router.delete('/:id', requireAuth, async (req, res) => {
  if (req.adminUser!.role !== 'super_admin') return res.status(403).json({ error: 'requiere_super_admin' });
  await pool.query(`UPDATE establecimientos SET activo = FALSE WHERE id = $1::uuid`, [req.params.id]);
  audit(req, { accion: 'soft_delete', entidad_tipo: 'establecimiento', entidad_id: req.params.id });
  res.json({ ok: true });
});

export default router;
