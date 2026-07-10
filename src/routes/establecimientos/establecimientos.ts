import { Router, Request, Response } from 'express';
import pool from '../../config/db';

const router = Router();

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

// Columnas públicas del schema real (ver 2026_06: la tabla usa ubicacion geography,
// no lat/lng planas) — NUNCA exponer email, updated_by, activo, verificado,
// notas_admin ni fuente.
const PUBLIC_COLS = `e.id, e.nombre, e.slug, e.categoria, e.subcategoria,
       e.telefono, e.direccion,
       ST_Y(e.ubicacion::geometry) AS lat,
       ST_X(e.ubicacion::geometry) AS lng,
       e.especialidades, e.rnt, e.municipio_id, e.created_at`;

// Foto principal: media subida desde el admin, con fallback a la columna foto_url
const FOTO_URL = `COALESCE(
         (SELECT url_publica FROM media_assets ma
           WHERE ma.entidad_tipo = 'establecimiento'
             AND ma.entidad_id = e.id::text
             AND ma.es_principal = TRUE
             AND ma.activo = TRUE
           LIMIT 1),
         e.foto_url
       ) AS foto_url`;

const DETAIL_QUERY = (whereCol: string) => `
  SELECT ${PUBLIC_COLS},
         ${FOTO_URL},
         m.name AS municipio_nombre,
         (SELECT json_agg(json_build_object(
           'id', ma.id, 'url_publica', ma.url_publica,
           'alt_text', ma.alt_text, 'es_principal', ma.es_principal
         ) ORDER BY ma.es_principal DESC, ma.posicion ASC)
          FROM media_assets ma
          WHERE ma.entidad_tipo = 'establecimiento'
            AND ma.entidad_id = e.id::text
            AND ma.activo = TRUE
         ) AS media
    FROM establecimientos e
    LEFT JOIN municipalities m ON m.id = e.municipio_id
   WHERE ${whereCol} AND e.activo = TRUE AND e.verificado = TRUE`;

// Pública — devuelve establecimientos activos y verificados
router.get('/', async (req, res) => {
  const municipio_id = req.query.municipio_id ? parseInt(req.query.municipio_id as string) : undefined;
  const categoria    = req.query.categoria as string | undefined;
  const q            = String(req.query.q ?? '').trim();
  const limit        = Math.min(Number(req.query.limit ?? 50), 100);
  const offset       = Number(req.query.offset ?? 0);

  const where: string[] = ['e.activo = TRUE', 'e.verificado = TRUE'];
  const params: unknown[] = [];
  let p = 0;

  if (municipio_id) { where.push(`e.municipio_id = $${++p}`); params.push(municipio_id); }
  if (categoria)    { where.push(`e.categoria = $${++p}`);    params.push(categoria); }
  if (q) {
    where.push(`unaccent(e.nombre) ILIKE unaccent($${++p})`);
    params.push(`%${q}%`);
  }

  const whereClause = `WHERE ${where.join(' AND ')}`;

  const [rowsQ, countQ] = await Promise.all([
    pool.query(
      `SELECT ${PUBLIC_COLS},
              ${FOTO_URL},
              m.name AS municipio_nombre
         FROM establecimientos e
         LEFT JOIN municipalities m ON m.id = e.municipio_id
         ${whereClause}
         ORDER BY e.nombre ASC
         LIMIT $${++p} OFFSET $${++p}`,
      [...params, limit, offset]
    ),
    pool.query(`SELECT COUNT(*)::int FROM establecimientos e ${whereClause}`, params),
  ]);

  res.json({ items: rowsQ.rows, total: countQ.rows[0].count, limit, offset });
});

// Declarada ANTES de /:id para que Express no capture "slug" como id
router.get('/slug/:slug', async (req: Request, res: Response) => {
  const result = await pool.query(DETAIL_QUERY('e.slug = $1'), [req.params.slug]);
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  res.json(result.rows[0]);
});

router.get('/:id', async (req: Request, res: Response) => {
  if (!UUID_RE.test(req.params.id)) {
    return res.status(404).json({ error: 'no_encontrado' });
  }
  const result = await pool.query(DETAIL_QUERY('e.id = $1::uuid'), [req.params.id]);
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  res.json(result.rows[0]);
});

export default router;
