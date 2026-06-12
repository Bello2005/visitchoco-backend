import { Router } from 'express';
import pool from '../../config/db';
import { requireAuth, requirePermission } from '../middleware/auth';
import { audit } from '../middleware/audit';
import { aplicarCambio } from '../services/approvalQueue';

const router = Router();

// Listar pendientes
router.get('/', requireAuth, requirePermission('*', 'cultura.write', 'municipios.write'), async (req, res) => {
  const estado = (req.query.estado as string) ?? 'pendiente';
  const limit = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const result = await pool.query(
    `SELECT aq.*,
            au.email AS solicitante_email, au.nombre AS solicitante_nombre
       FROM approval_queue aq
       JOIN admin_users au ON au.id = aq.solicitado_por
      WHERE ($1 = 'todos' OR aq.estado = $1)
      ORDER BY aq.created_at DESC
      LIMIT $2 OFFSET $3`,
    [estado, limit, offset]
  );
  const countQ = await pool.query(
    `SELECT COUNT(*)::int FROM approval_queue WHERE ($1 = 'todos' OR estado = $1)`,
    [estado]
  );
  res.json({ items: result.rows, total: countQ.rows[0].count });
});

// Aprobar
router.post('/:id/aprobar', requireAuth, requirePermission('*', 'cultura.write', 'municipios.write'), async (req, res) => {
  const { id } = req.params;
  try {
    await aplicarCambio(id, req.adminUser!.id);
    audit(req, { accion: 'approve', entidad_tipo: 'approval_queue', entidad_id: id });
    res.json({ ok: true });
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'error';
    res.status(400).json({ error: msg });
  }
});

// Rechazar
router.post('/:id/rechazar', requireAuth, requirePermission('*', 'cultura.write', 'municipios.write'), async (req, res) => {
  const { id } = req.params;
  const { comentario } = req.body as { comentario?: string };

  const item = await pool.query(`SELECT id FROM approval_queue WHERE id = $1`, [id]);
  if (item.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });

  await pool.query(
    `UPDATE approval_queue
       SET estado = 'rechazado', revisado_por = $1, revisado_at = NOW(), comentario_revisor = $2
     WHERE id = $3`,
    [req.adminUser!.id, comentario ?? null, id]
  );
  audit(req, { accion: 'reject', entidad_tipo: 'approval_queue', entidad_id: id });
  res.json({ ok: true });
});

export default router;
