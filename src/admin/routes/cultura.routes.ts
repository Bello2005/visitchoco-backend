import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth, requirePermission } from '../middleware/auth';
import { audit } from '../middleware/audit';
import { encolarCambio } from '../services/approvalQueue';

const router = Router();

// ─── PATRIMONIO INMATERIAL ────────────────────────────────────────────────────

const patrimonioSchema = z.object({
  titulo:               z.string().max(300).nullable(),
  subtitulo:            z.string().max(300).nullable(),
  descripcion_corta:    z.string().max(2000).nullable(),
  descripcion_larga:    z.string().max(10000).nullable(),
  tipo:                 z.string().max(100).nullable(),
  ambito:               z.string().max(200).nullable(),
  fecha_declaracion:    z.string().max(100).nullable(),
  organizacion_gestora: z.string().max(300).nullable(),
  fecha_celebracion:    z.string().max(100).nullable(),
  elementos_clave:      z.array(z.string()).nullable(),
  fuente:               z.string().max(500).nullable(),
  municipio_nombre:     z.string().max(100).nullable(),
  activo:               z.boolean(),
  verificado:           z.boolean(),
  notas_admin:          z.string().max(5000).nullable(),
});

router.get('/patrimonio', requireAuth, async (req, res) => {
  const search   = String(req.query.q ?? '').trim();
  const municipio = req.query.municipio as string | undefined;
  const limit  = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const where: string[] = [];
  const params: unknown[] = [];
  let p = 0;

  if (search) {
    where.push(`(unaccent(coalesce(titulo,'')) ILIKE unaccent($${++p})
      OR unaccent(coalesce(ambito,'')) ILIKE unaccent($${p}))`);
    params.push(`%${search}%`);
  }
  if (municipio) { where.push(`municipio_nombre = $${++p}`); params.push(municipio); }

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT id, municipio_nombre, titulo, subtitulo, tipo, ambito,
              descripcion_corta AS descripcion, fecha_celebracion,
              activo, verificado, updated_at
         FROM patrimonio_inmaterial ${whereClause}
         ORDER BY municipio_nombre, id
         LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(`SELECT COUNT(*)::int FROM patrimonio_inmaterial ${whereClause}`, params),
  ]);

  res.json({ items: rowsQ.rows, total: countQ.rows[0].count, limit, offset });
});

router.get('/patrimonio/:id', requireAuth, async (req, res) => {
  const id = parseInt(req.params.id);
  if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

  const result = await pool.query(
    `SELECT *, descripcion_corta AS descripcion FROM patrimonio_inmaterial WHERE id = $1`,
    [id]
  );
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  res.json({ patrimonio: result.rows[0] });
});

router.patch('/patrimonio/:id',
  requireAuth,
  requirePermission('*', 'cultura.write'),
  async (req, res) => {
    const id = parseInt(req.params.id);
    if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

    // El frontend puede mandar `descripcion`: es alias de descripcion_corta.
    const body = { ...(req.body as Record<string, unknown>) };
    if ('descripcion' in body && !('descripcion_corta' in body)) {
      body.descripcion_corta = body.descripcion;
    }

    const parse = patrimonioSchema.partial().safeParse(body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const fields = Object.keys(parse.data);
    if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });

    const u = req.adminUser!;
    if (u.role !== 'super_admin') {
      const queueId = await encolarCambio({
        entidad_tipo: 'patrimonio_inmaterial',
        entidad_id: String(id),
        cambios: parse.data as Record<string, unknown>,
        solicitado_por: u.id,
        comentario: (body as Record<string, string>).comentario_solicitante ?? null,
      });
      audit(req, { accion: 'change_request', entidad_tipo: 'patrimonio_inmaterial', entidad_id: String(id), cambios: parse.data });
      return res.json({ ok: true, en_revision: true, queue_id: queueId });
    }

    const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
    const values: unknown[] = [...Object.values(parse.data), u.email, id];

    await pool.query(
      `UPDATE patrimonio_inmaterial SET ${sets}, updated_by = $${values.length - 1}
        WHERE id = $${values.length}`,
      values
    );
    audit(req, { accion: 'update', entidad_tipo: 'patrimonio_inmaterial', entidad_id: String(id), cambios: parse.data });
    res.json({ ok: true });
  }
);

// ─── FIESTAS PATRONALES ───────────────────────────────────────────────────────

const fiestaSchema = z.object({
  municipio_nombre:     z.string().max(100),
  corregimiento:        z.string().max(200).nullable(),
  nombre_fiesta:        z.string().max(300).nullable(),
  mes:                  z.number().int().min(1).max(12),
  fechas_texto:         z.string().max(200).nullable(),
  fecha_inicio_dia:     z.number().int().min(1).max(31).nullable(),
  fecha_fin_dia:        z.number().int().min(1).max(31).nullable(),
  descripcion:          z.string().max(5000).nullable(),
  tipo:                 z.string().max(100).nullable(),
  es_principal:         z.boolean(),
  historia_origen:      z.string().max(10000).nullable(),
  actividades:          z.string().max(5000).nullable(),
  elementos_culturales: z.string().max(5000).nullable(),
  juegos_competencias:  z.string().max(5000).nullable(),
  activo:               z.boolean(),
  verificado:           z.boolean(),
  notas_admin:          z.string().max(5000).nullable(),
});

router.get('/fiestas', requireAuth, async (req, res) => {
  const mes    = req.query.mes ? parseInt(req.query.mes as string) : undefined;
  const search = String(req.query.q ?? '').trim();
  const limit  = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const where: string[] = [];
  const params: unknown[] = [];
  let p = 0;

  if (mes)    { where.push(`f.mes = $${++p}`); params.push(mes); }
  if (search) {
    where.push(`(unaccent(f.municipio_nombre) ILIKE unaccent($${++p})
      OR unaccent(coalesce(f.nombre_fiesta,'')) ILIKE unaccent($${p}))`);
    params.push(`%${search}%`);
  }

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ, mesesQ] = await Promise.all([
    pool.query(
      `SELECT f.id, f.municipio_nombre, f.corregimiento, f.nombre_fiesta, f.mes,
              f.fechas_texto, f.fecha_inicio_dia, f.fecha_fin_dia, f.descripcion,
              f.tipo, f.es_principal, f.activo, f.verificado, f.updated_at,
              m.slug, m.image_url AS municipio_imagen
         FROM fiestas_patronales f
         LEFT JOIN municipalities m ON LOWER(m.name) = LOWER(f.municipio_nombre)
         ${whereClause}
         ORDER BY f.mes, f.fecha_inicio_dia
         LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(`SELECT COUNT(*)::int FROM fiestas_patronales f ${whereClause}`, params),
    pool.query(`SELECT DISTINCT mes FROM fiestas_patronales WHERE mes IS NOT NULL ORDER BY mes`),
  ]);

  res.json({
    items: rowsQ.rows,
    total: countQ.rows[0].count,
    limit,
    offset,
    meses: mesesQ.rows.map(r => r.mes),
  });
});

router.get('/fiestas/:id', requireAuth, async (req, res) => {
  const id = parseInt(req.params.id);
  if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

  const result = await pool.query(
    `SELECT f.*, m.slug, m.image_url AS municipio_imagen
       FROM fiestas_patronales f
       LEFT JOIN municipalities m ON LOWER(m.name) = LOWER(f.municipio_nombre)
      WHERE f.id = $1`,
    [id]
  );
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  res.json({ fiesta: result.rows[0] });
});

router.patch('/fiestas/:id',
  requireAuth,
  requirePermission('*', 'cultura.write'),
  async (req, res) => {
    const id = parseInt(req.params.id);
    if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

    const parse = fiestaSchema.partial().safeParse(req.body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const fields = Object.keys(parse.data);
    if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });

    const u = req.adminUser!;
    if (u.role !== 'super_admin') {
      const queueId = await encolarCambio({
        entidad_tipo: 'fiesta_patronal',
        entidad_id: String(id),
        cambios: parse.data as Record<string, unknown>,
        solicitado_por: u.id,
        comentario: (req.body as Record<string, string>).comentario_solicitante ?? null,
      });
      audit(req, { accion: 'change_request', entidad_tipo: 'fiesta_patronal', entidad_id: String(id), cambios: parse.data });
      return res.json({ ok: true, en_revision: true, queue_id: queueId });
    }

    const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
    const values: unknown[] = [...Object.values(parse.data), u.email, id];

    await pool.query(
      `UPDATE fiestas_patronales SET ${sets}, updated_by = $${values.length - 1}
        WHERE id = $${values.length}`,
      values
    );
    audit(req, { accion: 'update', entidad_tipo: 'fiesta_patronal', entidad_id: String(id), cambios: parse.data });
    res.json({ ok: true });
  }
);

export default router;
