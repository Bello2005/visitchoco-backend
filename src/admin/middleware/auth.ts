import jwt from 'jsonwebtoken';
import type { Request, Response, NextFunction } from 'express';
import pool from '../../config/db';

export interface AdminUser {
  id: string;
  email: string;
  role: string;
  permisos: string[];
  jti: string;
}

declare global {
  namespace Express {
    interface Request {
      adminUser?: AdminUser;
    }
  }
}

const JWT_SECRET = process.env.JWT_SECRET;
if (!JWT_SECRET) throw new Error('JWT_SECRET no definido');

export async function requireAuth(req: Request, res: Response, next: NextFunction) {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader?.startsWith('Bearer ')) {
      return res.status(401).json({ error: 'token_ausente' });
    }
    const token = authHeader.slice(7);
    const payload = jwt.verify(token, JWT_SECRET!) as { sub: string; jti: string };

    const result = await pool.query(
      `SELECT u.id, u.email, r.slug AS role, r.permisos, s.id AS session_id
         FROM admin_users u
         JOIN admin_roles r ON r.id = u.role_id
         JOIN admin_sessions s ON s.user_id = u.id
        WHERE u.id = $1 AND s.jti = $2
          AND u.estado = 'activo'
          AND s.revocado_at IS NULL
          AND s.expira_at > NOW()`,
      [payload.sub, payload.jti]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'sesion_invalida' });
    }

    const u = result.rows[0];
    req.adminUser = {
      id: u.id,
      email: u.email,
      role: u.role,
      permisos: u.permisos,
      jti: payload.jti,
    };

    pool.query(
      `UPDATE admin_sessions SET ultimo_uso_at = NOW() WHERE jti = $1`,
      [payload.jti]
    ).catch(() => undefined);

    next();
  } catch {
    return res.status(401).json({ error: 'token_invalido' });
  }
}

export function requirePermission(...permisos: string[]) {
  return (req: Request, res: Response, next: NextFunction) => {
    if (!req.adminUser) return res.status(401).json({ error: 'no_autenticado' });
    if (req.adminUser.permisos.includes('*')) return next();
    const tieneAlguno = permisos.some(p => req.adminUser!.permisos.includes(p));
    if (!tieneAlguno) {
      return res.status(403).json({ error: 'permiso_denegado', requiere: permisos });
    }
    next();
  };
}

// Alias cortos del spec → slugs reales de admin_roles en la DB.
const ROLE_ALIASES: Record<string, string> = {
  admin: 'super_admin',
  editor: 'editor_institucional',
  negocio: 'dueno_negocio',
};

export function requireRole(...slugs: string[]) {
  const permitidos = new Set(slugs.map(s => ROLE_ALIASES[s] ?? s));
  return (req: Request, res: Response, next: NextFunction) => {
    if (!req.adminUser) return res.status(401).json({ error: 'no_autenticado' });
    if (!permitidos.has(req.adminUser.role)) {
      return res.status(403).json({ error: 'rol_no_permitido', requiere: [...permitidos] });
    }
    next();
  };
}

export function requireSuperAdmin(req: Request, res: Response, next: NextFunction) {
  if (!req.adminUser) return res.status(401).json({ error: 'no_autenticado' });
  if (req.adminUser.role !== 'super_admin') {
    return res.status(403).json({ error: 'requiere_super_admin' });
  }
  next();
}
