import { Router } from 'express';
import { z } from 'zod';
import crypto from 'crypto';
import { Resend } from 'resend';
import pool from '../../config/db';
import { requireAuth, requireSuperAdmin } from '../middleware/auth';
import { audit } from '../middleware/audit';

const router = Router();
const resend = new Resend(process.env.RESEND_API_KEY!);

// Listar usuarios (super admin)
router.get('/', requireAuth, requireSuperAdmin, async (req, res) => {
  const result = await pool.query(
    `SELECT u.id, u.email, u.nombre, u.estado, r.slug AS role, u.ultimo_login_at, u.created_at
       FROM admin_users u
       JOIN admin_roles r ON r.id = u.role_id
      ORDER BY u.created_at DESC`
  );
  res.json({ items: result.rows });
});

// Cambiar estado de usuario
router.patch('/:id/estado', requireAuth, requireSuperAdmin, async (req, res) => {
  const schema = z.object({ estado: z.enum(['activo','suspendido','eliminado']) });
  const parse = schema.safeParse(req.body);
  if (!parse.success) return res.status(400).json({ error: 'estado_invalido' });

  await pool.query(
    `UPDATE admin_users SET estado = $1 WHERE id = $2`,
    [parse.data.estado, req.params.id]
  );
  audit(req, { accion: 'user_estado_change', entidad_id: req.params.id, cambios: parse.data });
  res.json({ ok: true });
});

// Invitar usuario
router.post('/invite', requireAuth, requireSuperAdmin, async (req, res) => {
  const schema = z.object({
    email: z.string().email(),
    role_slug: z.enum(['super_admin','editor_institucional','dueno_negocio']),
    establecimiento_id: z.string().uuid().optional(),
    mensaje_personal: z.string().max(500).optional(),
  });
  const parse = schema.safeParse(req.body);
  if (!parse.success) return res.status(400).json({ error: 'datos_invalidos' });

  const roleQ = await pool.query(`SELECT id FROM admin_roles WHERE slug = $1`, [parse.data.role_slug]);
  if (roleQ.rows.length === 0) return res.status(400).json({ error: 'rol_invalido' });
  const roleId = roleQ.rows[0].id as number;

  const token = crypto.randomBytes(32).toString('base64url');
  const tokenHash = crypto.createHash('sha256').update(token).digest('hex');
  const expiraAt = new Date(Date.now() + 7 * 24 * 60 * 60_000);

  await pool.query(
    `INSERT INTO invitations (email, role_id, invitado_por, establecimiento_id, mensaje_personal, token_hash, expira_at)
     VALUES ($1,$2,$3,$4,$5,$6,$7)`,
    [
      parse.data.email,
      roleId,
      req.adminUser!.id,
      parse.data.establecimiento_id ?? null,
      parse.data.mensaje_personal ?? null,
      tokenHash,
      expiraAt,
    ]
  );

  const url = `${process.env.ADMIN_FRONTEND_URL}/auth/invite?token=${token}`;
  await resend.emails.send({
    from: `${process.env.RESEND_FROM_NAME ?? 'VisitChocó'} <${process.env.RESEND_FROM_EMAIL ?? 'noreply@visitchoco.cloud'}>`,
    to: parse.data.email,
    subject: 'Te invitaron a colaborar en VisitChocó Admin',
    html: `<p>Has sido invitado a colaborar en VisitChocó Admin.</p>
           <p>${parse.data.mensaje_personal ?? ''}</p>
           <p><a href="${url}" style="background:#1a5c45;color:white;padding:12px 24px;border-radius:8px;text-decoration:none;display:inline-block;">Aceptar invitación</a></p>
           <p style="color:#888;font-size:12px;">El enlace expira en 7 días.</p>`,
    text: `Has sido invitado a colaborar en VisitChocó Admin.\n\n${url}\n\nExpira en 7 días.`,
  });

  audit(req, { accion: 'user_invite', metadata: { email: parse.data.email, role: parse.data.role_slug } });
  res.json({ ok: true });
});

// Audit log
router.get('/audit-log', requireAuth, requireSuperAdmin, async (req, res) => {
  const limit = Math.min(Number(req.query.limit ?? 50), 200);
  const offset = Number(req.query.offset ?? 0);

  const result = await pool.query(
    `SELECT al.*, au.email AS actor_email
       FROM audit_log al
       LEFT JOIN admin_users au ON au.id = al.user_id
      ORDER BY al.created_at DESC
      LIMIT $1 OFFSET $2`,
    [limit, offset]
  );
  const countQ = await pool.query(`SELECT COUNT(*)::int FROM audit_log`);
  res.json({ items: result.rows, total: countQ.rows[0].count });
});

export default router;
