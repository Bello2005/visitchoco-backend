import { Router } from 'express';
import pool from '../../config/db';
import { requireAuth } from '../middleware/auth';

const router = Router();

const UMAMI_API = process.env.UMAMI_API_URL;
const UMAMI_KEY = process.env.UMAMI_API_KEY;
const UMAMI_SITE = process.env.UMAMI_WEBSITE_ID;

async function umamiGet(path: string) {
  if (!UMAMI_API || !UMAMI_KEY) return null;
  try {
    const r = await fetch(`${UMAMI_API}${path}`, {
      headers: { 'x-umami-api-key': UMAMI_KEY },
    });
    if (!r.ok) return null;
    return r.json();
  } catch {
    return null;
  }
}

// Dashboard metrics (super admin)
router.get('/dashboard', requireAuth, async (req, res) => {
  const u = req.adminUser!;

  const [negociosQ, porCategoriaQ, pendientesQ, claimsQ, municipiosQ, fiestasQ, patrimonioQ, usersQ] = await Promise.all([
    pool.query(`SELECT COUNT(*)::int FROM establecimientos WHERE activo = TRUE`),
    pool.query(
      `SELECT categoria, COUNT(*)::int AS total
         FROM establecimientos WHERE activo = TRUE
        GROUP BY categoria ORDER BY total DESC`
    ),
    pool.query(`SELECT COUNT(*)::int FROM approval_queue WHERE estado = 'pendiente'`),
    pool.query(`SELECT COUNT(*)::int FROM business_claims WHERE estado IN ('pendiente','en_revision')`),
    pool.query(`SELECT COUNT(*)::int FROM municipalities`),
    pool.query(`SELECT COUNT(*)::int FROM fiestas_patronales`),
    pool.query(`SELECT COUNT(*)::int FROM patrimonio_inmaterial`),
    pool.query(`SELECT COUNT(*)::int FROM admin_users WHERE estado = 'activo'`),
  ]);

  const range = (req.query.range as string) ?? '30d';
  const days = range === '7d' ? 7 : range === '90d' ? 90 : 30;
  const startAt = Date.now() - days * 24 * 60 * 60_000;

  let umamiStats = null;
  if (u.role === 'super_admin' && UMAMI_SITE) {
    umamiStats = await umamiGet(`/websites/${UMAMI_SITE}/stats?startAt=${startAt}&endAt=${Date.now()}`);
  }

  let actividadReciente: unknown[] = [];
  if (u.role === 'super_admin') {
    const actQ = await pool.query(
      `SELECT al.accion, al.entidad_tipo, al.entidad_id, al.created_at,
              au.email AS user_email
         FROM audit_log al
         LEFT JOIN admin_users au ON au.id = al.user_id
         ORDER BY al.created_at DESC LIMIT 10`
    );
    actividadReciente = actQ.rows;
  }

  if (u.role === 'dueno_negocio') {
    const estabQ = await pool.query(
      `SELECT e.id, e.nombre
         FROM user_establecimientos ue
         JOIN establecimientos e ON e.id = ue.establecimiento_id
        WHERE ue.user_id = $1`,
      [u.id]
    );
    return res.json({
      mis_negocios: estabQ.rows,
      umami: umamiStats,
    });
  }

  res.json({
    total_negocios: negociosQ.rows[0].count,
    negocios_por_categoria: porCategoriaQ.rows,
    pendientes_aprobacion: pendientesQ.rows[0].count,
    claims_activos: claimsQ.rows[0].count,
    total_municipios: municipiosQ.rows[0].count,
    total_fiestas: fiestasQ.rows[0].count,
    total_patrimonio: patrimonioQ.rows[0].count,
    usuarios_activos: usersQ.rows[0].count,
    umami: umamiStats,
    actividad_reciente: actividadReciente,
  });
});

// Global metrics
router.get('/global', requireAuth, async (req, res) => {
  const range = (req.query.range as string) ?? '30d';
  const days = range === '7d' ? 7 : range === '90d' ? 90 : range === '12m' ? 365 : 30;
  const startAt = Date.now() - days * 24 * 60 * 60_000;

  if (!UMAMI_SITE || !UMAMI_API || !UMAMI_KEY) {
    return res.json({ stats: null, pageviews: null, events: null, range, error: 'analytics_no_configurado' });
  }

  const [stats, pageviews, events] = await Promise.all([
    umamiGet(`/websites/${UMAMI_SITE}/stats?startAt=${startAt}&endAt=${Date.now()}`),
    umamiGet(`/websites/${UMAMI_SITE}/metrics?startAt=${startAt}&endAt=${Date.now()}&type=url&limit=20`),
    umamiGet(`/websites/${UMAMI_SITE}/metrics?startAt=${startAt}&endAt=${Date.now()}&type=event&limit=20`),
  ]);

  res.json({ stats, pageviews, events, range });
});

export default router;
