import crypto from 'crypto';
import jwt from 'jsonwebtoken';
import pool from '../../config/db';
import { sendLoginEmail } from '../../services/emailService/emailService';

const EXPIRES_MIN = Number(process.env.MAGIC_LINK_EXPIRES_MIN ?? 15);

function hashToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}

/**
 * Genera DOS credenciales para el mismo login (doble vía, una sola tabla):
 * - token largo (32 bytes hex) → enlace del email
 * - código de 6 dígitos → para escribir a mano
 * Cada una se guarda como fila propia en magic_links (SHA-256 en token_hash).
 */
export async function sendLoginCredentials(email: string, ip: string, userAgent: string) {
  const userQ = await pool.query(
    `SELECT id, estado FROM admin_users WHERE email = LOWER($1) LIMIT 1`,
    [email]
  );

  // No filtrar existencia de cuentas: responder { ok: true } siempre.
  if (userQ.rows.length === 0) return { ok: true };
  const user = userQ.rows[0];
  if (user.estado !== 'activo') return { ok: true };

  const token = crypto.randomBytes(32).toString('hex');
  const codigo = String(crypto.randomInt(100000, 1000000));
  const expiraAt = new Date(Date.now() + EXPIRES_MIN * 60_000);

  await pool.query(
    `INSERT INTO magic_links (user_id, token_hash, ip_solicitud, user_agent, expira_at)
     VALUES ($1,$2,$4,$5,$6), ($1,$3,$4,$5,$6)`,
    [user.id, hashToken(token), hashToken(codigo), ip, userAgent, expiraAt]
  );

  await sendLoginEmail({ to: email, token, codigo });

  return { ok: true };
}

/**
 * Acepta tanto el token largo como el código de 6 dígitos en el mismo campo.
 * Al validar consume TODAS las filas vigentes del user (enlace y código juntos).
 * Error siempre genérico: 'codigo_invalido'.
 */
export async function verifyCredential(raw: string, ip: string, userAgent: string) {
  const normalizado = raw.trim().replace(/\s+/g, '');
  if (!normalizado) return { ok: false as const, error: 'codigo_invalido' };

  const linkQ = await pool.query(
    `SELECT ml.user_id, u.email, r.slug AS role
       FROM magic_links ml
       JOIN admin_users u ON u.id = ml.user_id
       JOIN admin_roles r ON r.id = u.role_id
      WHERE ml.token_hash = $1
        AND ml.consumido_at IS NULL
        AND ml.expira_at > NOW()
        AND u.estado = 'activo'
      LIMIT 1`,
    [hashToken(normalizado)]
  );

  if (linkQ.rows.length === 0) return { ok: false as const, error: 'codigo_invalido' };
  const link = linkQ.rows[0];

  // Un solo uso por solicitud: consumir enlace Y código a la vez.
  await pool.query(
    `UPDATE magic_links SET consumido_at = NOW()
      WHERE user_id = $1 AND consumido_at IS NULL`,
    [link.user_id]
  );
  await pool.query(
    `UPDATE admin_users SET email_verified = TRUE, ultimo_login_at = NOW() WHERE id = $1`,
    [link.user_id]
  );

  const jti = crypto.randomUUID();
  const expiresIn = (process.env.JWT_EXPIRES_IN ?? '7d') as jwt.SignOptions['expiresIn'];
  const expiraAt = new Date(Date.now() + 7 * 24 * 60 * 60_000);

  await pool.query(
    `INSERT INTO admin_sessions (user_id, jti, ip, user_agent, expira_at)
     VALUES ($1,$2,$3,$4,$5)`,
    [link.user_id, jti, ip, userAgent, expiraAt]
  );

  const accessToken = jwt.sign(
    { sub: link.user_id, email: link.email, jti, role: link.role },
    process.env.JWT_SECRET!,
    { expiresIn }
  );

  return {
    ok: true as const,
    accessToken,
    user: { id: link.user_id, email: link.email, role: link.role },
  };
}
