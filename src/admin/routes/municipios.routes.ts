import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth, requirePermission } from '../middleware/auth';
import { audit } from '../middleware/audit';

const router = Router();

const municipioSchema = z.object({
  name:          z.string().min(2).max(100).optional(),
  description:   z.string().max(3000).optional().nullable(),
  main_activity: z.string().max(200).optional().nullable(),
  emoji:         z.string().max(10).optional().nullable(),
  zone:          z.string().max(100).optional().nullable(),
  lat:           z.number().min(-90).max(90).optional().nullable(),
  lon:           z.number().min(-180).max(180).optional().nullable(),
});

// LIST
router.get('/', requireAuth, async (req, res) => {
  const search = String(req.query.q ?? '').trim();
  const zone   = req.query.zone as string | undefined;
  const limit  = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const where: string[] = [];
  const params: unknown[] = [];
  let p = 0;

  if (search) { where.push(`unaccent(m.name) ILIKE unaccent($${++p})`); params.push(`%${search}%`); }
  if (zone)   { where.push(`m.zone = $${++p}`); params.push(zone); }

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT m.id, m.name, m.slug, m.emoji, m.zone, m.main_activity,
              m.lat, m.lon, m.image_url, m.cod_dane, m.updated_at
         FROM municipalities m
         ${whereClause}
         ORDER BY m.name ASC
         LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(`SELECT COUNT(*)::int FROM municipalities m ${whereClause}`, params),
  ]);

  res.json({ items: rowsQ.rows, total: countQ.rows[0].count, limit, offset });
});

// GET ONE
router.get('/:id', requireAuth, async (req, res) => {
  const id = parseInt(req.params.id);
  if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

  const result = await pool.query(
    `SELECT m.*,
            COALESCE(p.count, 0)::int AS population
       FROM municipalities m
       LEFT JOIN population p ON p.cod_dane = m.cod_dane AND p.year = 2026
      WHERE m.id = $1`,
    [id]
  );
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });

  const media = await pool.query(
    `SELECT id, url_publica, alt_text, posicion, es_principal
       FROM media_assets
      WHERE entidad_tipo = 'municipio' AND entidad_id = $1 AND activo = TRUE
      ORDER BY es_principal DESC, posicion ASC`,
    [String(id)]
  );

  res.json({ municipio: result.rows[0], media: media.rows });
});

// PATCH — solo admin/editor, directo
router.patch('/:id',
  requireAuth,
  requirePermission('*', 'municipios.write'),
  async (req, res) => {
    const id = parseInt(req.params.id);
    if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

    const parse = municipioSchema.safeParse(req.body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const fields = Object.keys(parse.data);
    if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });

    const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
    const values: unknown[] = Object.values(parse.data);
    values.push(id);

    const result = await pool.query(
      `UPDATE municipalities SET ${sets}, updated_at = NOW() WHERE id = $${values.length} RETURNING id, name`,
      values
    );

    audit(req, { accion: 'update', entidad_tipo: 'municipio', entidad_id: String(id), cambios: parse.data });
    res.json({ ok: true, municipio: result.rows[0] });
  }
);

export default router;
