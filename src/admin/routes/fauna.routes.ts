import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth, requirePermission } from '../middleware/auth';
import { audit } from '../middleware/audit';

const router = Router();

const faunaSchema = z.object({
  common_name:     z.string().min(2).max(100).optional(),
  scientific_name: z.string().max(150).optional().nullable(),
  description:     z.string().max(3000).optional().nullable(),
  municipality_id: z.number().int().positive().optional().nullable(),
  image_url:       z.string().url().optional().nullable(),
  audio_url:       z.string().url().optional().nullable(),
});

// LIST
router.get('/', requireAuth, async (req, res) => {
  const search        = String(req.query.q ?? '').trim();
  const municipalityId = req.query.municipality_id ? parseInt(req.query.municipality_id as string) : undefined;
  const limit  = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const where: string[] = [];
  const params: unknown[] = [];
  let p = 0;

  if (search) {
    where.push(`(unaccent(a.common_name) ILIKE unaccent($${++p}) OR unaccent(a.scientific_name) ILIKE unaccent($${p}))`);
    params.push(`%${search}%`);
  }
  if (municipalityId) { where.push(`a.municipality_id = $${++p}`); params.push(municipalityId); }

  const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT a.id, a.common_name, a.scientific_name, a.image_url,
              a.municipality_id, m.name AS municipality_name, a.updated_at
         FROM animals a
         LEFT JOIN municipalities m ON m.id = a.municipality_id
         ${whereClause}
         ORDER BY a.common_name ASC
         LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(
      `SELECT COUNT(*)::int FROM animals a ${whereClause}`,
      params
    ),
  ]);

  res.json({ items: rowsQ.rows, total: countQ.rows[0].count, limit, offset });
});

// GET ONE
router.get('/:id', requireAuth, async (req, res) => {
  const id = parseInt(req.params.id);
  if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

  const result = await pool.query(
    `SELECT a.*, m.name AS municipality_name
       FROM animals a
       LEFT JOIN municipalities m ON m.id = a.municipality_id
      WHERE a.id = $1`,
    [id]
  );
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });

  const media = await pool.query(
    `SELECT id, url_publica, alt_text, posicion, es_principal
       FROM media_assets
      WHERE entidad_tipo = 'fauna' AND entidad_id = $1 AND activo = TRUE
      ORDER BY es_principal DESC, posicion ASC`,
    [String(id)]
  );

  res.json({ animal: result.rows[0], media: media.rows });
});

// PATCH
router.patch('/:id',
  requireAuth,
  requirePermission('*', 'fauna.write'),
  async (req, res) => {
    const id = parseInt(req.params.id);
    if (isNaN(id)) return res.status(400).json({ error: 'id_invalido' });

    const parse = faunaSchema.safeParse(req.body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const fields = Object.keys(parse.data);
    if (fields.length === 0) return res.status(400).json({ error: 'sin_cambios' });

    const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
    const values: unknown[] = Object.values(parse.data);
    values.push(id);

    const result = await pool.query(
      `UPDATE animals SET ${sets}, updated_at = NOW() WHERE id = $${values.length} RETURNING id, common_name`,
      values
    );

    audit(req, { accion: 'update', entidad_tipo: 'fauna', entidad_id: String(id), cambios: parse.data });
    res.json({ ok: true, animal: result.rows[0] });
  }
);

export default router;
