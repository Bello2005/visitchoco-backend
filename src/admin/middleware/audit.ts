import type { Request } from 'express';
import pool from '../../config/db';

interface AuditEntry {
  accion: string;
  entidad_tipo?: string;
  entidad_id?: string;
  cambios?: unknown;
  metadata?: Record<string, unknown>;
}

export function audit(req: Request, entry: AuditEntry) {
  const u = req.adminUser;
  pool.query(
    `INSERT INTO audit_log
      (user_id, user_email, user_role, accion, entidad_tipo, entidad_id,
       cambios, ip, user_agent, metadata)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)`,
    [
      u?.id ?? null,
      u?.email ?? null,
      u?.role ?? null,
      entry.accion,
      entry.entidad_tipo ?? null,
      entry.entidad_id ?? null,
      entry.cambios ? JSON.stringify(entry.cambios) : null,
      req.ip,
      req.get('user-agent') ?? null,
      JSON.stringify(entry.metadata ?? {}),
    ]
  ).catch(err => console.error('[audit] fallo:', err));
}
