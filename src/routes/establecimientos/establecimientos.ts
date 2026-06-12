import { Router } from 'express';
import pool from '../../config/db';

const router = Router();

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
      `SELECT e.id, e.nombre, e.categoria, e.subcategoria, e.descripcion,
              e.telefono, e.whatsapp, e.sitio_web, e.direccion,
              e.lat, e.lng, e.rango_precio, e.especialidades, e.horario,
              e.rnt, e.municipio_id,
              m.name AS municipio_nombre,
              (SELECT url_publica FROM media_assets ma
               WHERE ma.entidad_tipo = 'establecimiento'
                 AND ma.entidad_id = e.id::text
                 AND ma.es_principal = TRUE
                 AND ma.activo = TRUE
               LIMIT 1) AS foto_url
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

router.get('/:id', async (req, res) => {
  const result = await pool.query(
    `SELECT e.*,
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
      WHERE e.id = $1::uuid AND e.activo = TRUE AND e.verificado = TRUE`,
    [req.params.id]
  );
  if (result.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  res.json(result.rows[0]);
});

export default router;
