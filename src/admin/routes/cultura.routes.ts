import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth, requirePermission } from '../middleware/auth';
import { audit } from '../middleware/audit';

const router = Router();

// ─── PATRIMONIO INMATERIAL ────────────────────────────────────────────────────

const patrimonioSchema = z.object({
  descripcion:      z.string().max(3000).optional().nullable(),
  ambito:           z.string().max(200).optional().nullable(),
  municipio_nombre: z.string().max(100).optional().nullable(),
});

router.get('/patrimonio', requireAuth, async (req, res) => {
  const search   = String(req.query.q ?? '').trim();
  const municipio = req.query.municipio as string | undefined;
  const limit  = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const where: string[] = [];
  const params: unknown[] = [];
  let p = 0;

  if (search)    { where.push(`unaccent(ambito) ILIKE unaccent($${++p})`); params.push(`%${search}%`); }
  if (municipio) { where.push(`municipio_nombre = $${++p}`); params.push(municipio); }

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT id, municipio_nombre, ambito, descripcion
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

  const result = await pool.query(`SELECT * FROM patrimonio_inmaterial WHERE id = $1`, [id]);
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  res.json({ patrimonio: result.rows[0] });
});

router.patch('/patrimonio/:id',
  requireAuth,
  requirePermission('*', 'cultura.write'),
  async (req, res) => {
    const id = parseInt(req.params.id);
    if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

    const parse = patrimonioSchema.safeParse(req.body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const fields = Object.keys(parse.data);
    if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });

    const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
    const values: unknown[] = [...Object.values(parse.data), id];

    await pool.query(`UPDATE patrimonio_inmaterial SET ${sets} WHERE id = $${values.length}`, values);
    audit(req, { accion: 'update', entidad_tipo: 'patrimonio_inmaterial', entidad_id: String(id), cambios: parse.data });
    res.json({ ok: true });
  }
);

// ─── FIESTAS PATRONALES ───────────────────────────────────────────────────────

const MESES = ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
               'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'] as const;

const fiestaSchema = z.object({
  municipio_nombre: z.string().max(100).optional(),
  mes:              z.number().int().min(1).max(12).optional(),
  fecha_inicio_dia: z.number().int().min(1).max(31).optional().nullable(),
  descripcion:      z.string().max(2000).optional().nullable(),
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
  if (search) { where.push(`unaccent(f.municipio_nombre) ILIKE unaccent($${++p})`); params.push(`%${search}%`); }

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT f.*, m.slug, m.image_url AS municipio_imagen
         FROM fiestas_patronales f
         LEFT JOIN municipalities m ON LOWER(m.name) = LOWER(f.municipio_nombre)
         ${whereClause}
         ORDER BY f.mes, f.fecha_inicio_dia
         LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(`SELECT COUNT(*)::int FROM fiestas_patronales f ${whereClause}`, params),
  ]);

  res.json({ items: rowsQ.rows, total: countQ.rows[0].count, limit, offset, meses: MESES });
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

    const parse = fiestaSchema.safeParse(req.body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const fields = Object.keys(parse.data);
    if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });

    const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
    const values: unknown[] = [...Object.values(parse.data), id];

    await pool.query(`UPDATE fiestas_patronales SET ${sets} WHERE id = $${values.length}`, values);
    audit(req, { accion: 'update', entidad_tipo: 'fiesta_patronal', entidad_id: String(id), cambios: parse.data });
    res.json({ ok: true });
  }
);

export default router;
