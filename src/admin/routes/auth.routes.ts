import { Router, type RequestHandler } from 'express';
import { z } from 'zod';
import { sendLoginCredentials, verifyCredential } from '../services/magicLink';
import { requireAuth } from '../middleware/auth';
import { audit } from '../middleware/audit';
import { rateLimit } from '../middleware/rateLimit';
import pool from '../../config/db';

const router = Router();

// Doble vía passwordless: enlace (token largo) + código de 6 dígitos.
// /login es el path del spec; /magic-link se mantiene porque el admin frontend lo llama.
const loginRateLimit = rateLimit({ windowMs: 60_000, max: 5, keyFn: r => `ml:${r.body?.email ?? r.ip}` });

const loginHandler: RequestHandler = async (req, res) => {
  const schema = z.object({ email: z.string().email() });
  const parse = schema.safeParse(req.body);
  if (!parse.success) {
    res.status(400).json({ error: 'email_invalido' });
    return;
  }
  await sendLoginCredentials(parse.data.email, req.ip ?? '', req.get('user-agent') ?? '');
  res.json({ ok: true });
};

router.post('/login', loginRateLimit, loginHandler);
router.post('/magic-link', loginRateLimit, loginHandler);

router.post('/verify',
  rateLimit({ windowMs: 60_000, max: 5, keyFn: r => `verify:${r.ip}`, errorCode: 'demasiados_intentos' }),
  async (req, res) => {
    // Acepta token largo o código "123 456" en el mismo campo.
    const schema = z.object({ token: z.string().min(1).max(200) });
    const parse = schema.safeParse(req.body);
    if (!parse.success) return res.status(401).json({ error: 'codigo_invalido' });
    const result = await verifyCredential(
      parse.data.token,
      req.ip ?? '',
      req.get('user-agent') ?? ''
    );
    if (!result.ok) return res.status(401).json({ error: 'codigo_invalido' });
    req.adminUser = result.user as typeof req.adminUser;
    audit(req, { accion: 'login', metadata: { user_id: result.user.id } });
    res.json(result);
  }
);

router.get('/me', requireAuth, async (req, res) => {
  const u = req.adminUser!;
  const userQ = await pool.query(
    `SELECT id, email, nombre, telefono, avatar_url, ultimo_login_at, created_at
       FROM admin_users WHERE id = $1`,
    [u.id]
  );
  let establecimientos: unknown[] = [];
  if (u.role === 'dueno_negocio') {
    const estabQ = await pool.query(
      `SELECT e.id, e.nombre, e.categoria, ue.rol_negocio
         FROM user_establecimientos ue
         JOIN establecimientos e ON e.id = ue.establecimiento_id
        WHERE ue.user_id = $1`,
      [u.id]
    );
    establecimientos = estabQ.rows;
  }
  res.json({
    user: { ...userQ.rows[0], role: u.role, permisos: u.permisos },
    establecimientos,
  });
});

router.post('/logout', requireAuth, async (req, res) => {
  await pool.query(
    `UPDATE admin_sessions SET revocado_at = NOW() WHERE jti = $1`,
    [req.adminUser!.jti]
  );
  audit(req, { accion: 'logout' });
  res.json({ ok: true });
});

router.get('/sessions', requireAuth, async (req, res) => {
  const result = await pool.query(
    `SELECT id, jti, ip, user_agent, ultimo_uso_at, expira_at, created_at
       FROM admin_sessions
      WHERE user_id = $1 AND revocado_at IS NULL AND expira_at > NOW()
      ORDER BY ultimo_uso_at DESC`,
    [req.adminUser!.id]
  );
  res.json({ sessions: result.rows });
});

router.delete('/sessions/:id', requireAuth, async (req, res) => {
  await pool.query(
    `UPDATE admin_sessions SET revocado_at = NOW()
      WHERE id = $1 AND user_id = $2`,
    [req.params.id, req.adminUser!.id]
  );
  audit(req, { accion: 'session_revoke', metadata: { session_id: req.params.id } });
  res.json({ ok: true });
});

export default router;
