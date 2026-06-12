import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth, requireSuperAdmin } from '../middleware/auth';
import { audit } from '../middleware/audit';
import { rateLimit } from '../middleware/rateLimit';
import { Resend } from 'resend';

const router = Router();
const resend = new Resend(process.env.RESEND_API_KEY!);

// PÚBLICO: solicitar reclamo
router.post('/',
  rateLimit({ windowMs: 60 * 60_000, max: 3, keyFn: r => `claim:${r.ip}` }),
  async (req, res) => {
    const schema = z.object({
      establecimiento_id: z.string().uuid(),
      email: z.string().email(),
      nombre_completo: z.string().min(3).max(120),
      telefono: z.string().min(7).max(40),
      cargo: z.string().max(80).optional(),
      cedula: z.string().max(40).optional(),
      evidencia_urls: z.array(z.string().url()).max(5).optional(),
    });
    const parse = schema.safeParse(req.body);
    if (!parse.success) return res.status(400).json({ error: 'datos_invalidos', detalles: parse.error.format() });

    const existing = await pool.query(
      `SELECT id FROM business_claims
        WHERE establecimiento_id = $1 AND email = LOWER($2) AND estado IN ('pendiente','en_revision')`,
      [parse.data.establecimiento_id, parse.data.email]
    );
    if (existing.rows.length > 0) {
      return res.status(409).json({ error: 'ya_solicitado', claim_id: existing.rows[0].id });
    }

    const estabQ = await pool.query(
      `SELECT email AS email_rnt FROM establecimientos WHERE id = $1::uuid`,
      [parse.data.establecimiento_id]
    );
    if (estabQ.rows.length === 0) return res.status(404).json({ error: 'establecimiento_no_existe' });

    const e = estabQ.rows[0];
    const emailMatch = e.email_rnt && e.email_rnt.toLowerCase() === parse.data.email.toLowerCase();
    const metodo = emailMatch ? 'email_match' : 'manual';

    const result = await pool.query(
      `INSERT INTO business_claims
        (establecimiento_id, email, nombre_completo, telefono, cargo, cedula,
         evidencia_urls, metodo_verificacion, estado)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
       RETURNING id`,
      [
        parse.data.establecimiento_id,
        parse.data.email.toLowerCase(),
        parse.data.nombre_completo,
        parse.data.telefono,
        parse.data.cargo ?? null,
        parse.data.cedula ?? null,
        parse.data.evidencia_urls ?? [],
        metodo,
        emailMatch ? 'en_revision' : 'pendiente',
      ]
    );

    resend.emails.send({
      from: `${process.env.RESEND_FROM_NAME ?? 'VisitChocó'} <${process.env.RESEND_FROM_EMAIL ?? 'noreply@visitchoco.cloud'}>`,
      to: 'ldbello@miuniclaretiana.edu.co',
      subject: `Nuevo reclamo · ${parse.data.nombre_completo}`,
      text: `Nuevo claim:\n\nEstablecimiento: ${parse.data.establecimiento_id}\nSolicitante: ${parse.data.nombre_completo}\nEmail: ${parse.data.email}\nMétodo: ${metodo}\n\nRevisar: ${process.env.ADMIN_FRONTEND_URL}/inbox/claims/${result.rows[0].id}`,
    }).catch(err => console.error('[claims] email error:', err));

    res.json({ ok: true, claim_id: result.rows[0].id, en_revision: emailMatch });
  }
);

// Admin: listar claims
router.get('/', requireAuth, requireSuperAdmin, async (req, res) => {
  const estado = (req.query.estado as string) ?? 'pendiente';
  const result = await pool.query(
    `SELECT bc.*, e.nombre AS establecimiento_nombre, m.name AS municipio_nombre
       FROM business_claims bc
       JOIN establecimientos e ON e.id = bc.establecimiento_id
       LEFT JOIN municipalities m ON m.id = e.municipio_id
      WHERE ($1 = 'todos' OR bc.estado = $1)
      ORDER BY bc.created_at DESC LIMIT 200`,
    [estado]
  );
  res.json({ items: result.rows });
});

// Admin: aprobar claim
router.post('/:id/aprobar', requireAuth, requireSuperAdmin, async (req, res) => {
  const { id } = req.params;
  const claim = await pool.query(`SELECT * FROM business_claims WHERE id = $1`, [id]);
  if (claim.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  const c = claim.rows[0];
  if (c.estado === 'aprobado') return res.status(400).json({ error: 'ya_aprobado' });

  let userResult = await pool.query(`SELECT id FROM admin_users WHERE email = $1`, [c.email]);
  let userId: string;
  if (userResult.rows.length === 0) {
    const newUser = await pool.query(
      `INSERT INTO admin_users (email, nombre, telefono, role_id, estado, email_verified)
       VALUES ($1,$2,$3,(SELECT id FROM admin_roles WHERE slug='dueno_negocio'),'activo',TRUE)
       RETURNING id`,
      [c.email, c.nombre_completo, c.telefono]
    );
    userId = newUser.rows[0].id as string;
  } else {
    userId = userResult.rows[0].id as string;
  }

  await pool.query(
    `INSERT INTO user_establecimientos (user_id, establecimiento_id, rol_negocio, asignado_por)
     VALUES ($1,$2,'propietario',$3)
     ON CONFLICT (user_id, establecimiento_id) DO NOTHING`,
    [userId, c.establecimiento_id, req.adminUser!.id]
  );

  await pool.query(
    `UPDATE establecimientos SET verificado = TRUE WHERE id = $1`,
    [c.establecimiento_id]
  );

  await pool.query(
    `UPDATE business_claims
       SET estado = 'aprobado', revisado_por = $1, revisado_at = NOW()
     WHERE id = $2`,
    [req.adminUser!.id, id]
  );

  audit(req, { accion: 'claim_approve', entidad_id: id, metadata: { user_id: userId } });
  res.json({ ok: true, user_id: userId });
});

// Admin: rechazar claim
router.post('/:id/rechazar', requireAuth, requireSuperAdmin, async (req, res) => {
  const { id } = req.params;
  const { motivo } = req.body as { motivo?: string };
  await pool.query(
    `UPDATE business_claims
       SET estado = 'rechazado', revisado_por = $1, revisado_at = NOW(), motivo_rechazo = $2
     WHERE id = $3`,
    [req.adminUser!.id, motivo ?? null, id]
  );
  audit(req, { accion: 'claim_reject', entidad_id: id });
  res.json({ ok: true });
});

export default router;
