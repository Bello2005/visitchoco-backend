/**
 * Router del panel admin — montado en /api/admin (src/index.ts).
 * Roles (admin_roles.slug): super_admin (alias 'admin'),
 * editor_institucional (alias 'editor'), dueno_negocio (alias 'negocio').
 *
 * AUTH (público, rate-limited)
 *   POST   /auth/login                  { email } → { ok } — envía enlace + código 6 dígitos
 *   POST   /auth/magic-link             alias de /login (lo usa el admin frontend)
 *   POST   /auth/verify                 { token: enlace o "123 456" } → { ok, accessToken, user } | 401 codigo_invalido | 429 demasiados_intentos
 * AUTH (Bearer)
 *   GET    /auth/me                     perfil + establecimientos del dueño
 *   POST   /auth/logout                 revoca la sesión del jti
 *   GET    /auth/sessions               sesiones activas del usuario
 *   DELETE /auth/sessions/:id           revoca una sesión propia
 *
 * ESTABLECIMIENTOS (Bearer)
 *   GET    /establecimientos            ?q&categoria&municipio_id&estado&reclamado&limit&offset → { items, total } (sin notas_admin)
 *   GET    /establecimientos/:id        { establecimiento (con notas_admin), media, cambios_pendientes }
 *   PATCH  /establecimientos/:id        admin directo | editor/negocio → { ok, en_revision, queue_id }
 *   DELETE /establecimientos/:id        solo admin — soft delete (activo=false)
 *
 * APPROVALS
 *   GET    /approvals                   ?estado&limit&offset → { items, total } (con solicitante_email/nombre)
 *   POST   /approvals/:id/aprobar       solo admin — aplica cambios en transacción
 *   POST   /approvals/:id/rechazar      solo admin — { comentario }
 *
 * METRICS
 *   GET    /metrics/dashboard           ?range=7d|30d|90d — conteos + actividad reciente
 *   GET    /metrics/global              ?range — Umami o { …null, error: 'analytics_no_configurado' }
 *
 * MUNICIPIOS / CULTURA / FAUNA (Bearer; PATCH editor → queue, admin directo)
 *   GET    /municipios                  ?q&zone&limit&offset
 *   GET    /municipios/:id              { municipio, media }
 *   PATCH  /municipios/:id              whitelist editorial (jamás name/slug/geom)
 *   GET    /cultura/patrimonio          ?q&municipio&limit&offset
 *   GET    /cultura/patrimonio/:id      { patrimonio }
 *   PATCH  /cultura/patrimonio/:id
 *   GET    /cultura/fiestas             ?q&mes&limit&offset → { items, total, meses }
 *   GET    /cultura/fiestas/:id         { fiesta }
 *   PATCH  /cultura/fiestas/:id
 *   GET    /fauna                       ?q&municipality_id&limit&offset
 *   GET    /fauna/:id                   { animal, media }
 *   PATCH  /fauna/:id                   directo (fauna no está en el CHECK de approval_queue)
 *
 * MEDIA (Bearer; sin vars R2 → 501 media_no_configurado)
 *   POST   /media/upload-url            { entidad_tipo, entidad_id, mime_type, filename } → { upload_url, key, public_url }
 *   POST   /media/confirm               registra en media_assets → { ok, asset }
 *   DELETE /media/:id                   soft delete (activo=false)
 *   PATCH  /media/:id/principal         marca principal (hermanos a false)
 *
 * CLAIMS / USERS — ver claims.routes.ts y users.routes.ts
 */
import { Router } from 'express';
import authRoutes from './routes/auth.routes';
import establecimientosRoutes from './routes/establecimientos.routes';
import claimsRoutes from './routes/claims.routes';
import approvalsRoutes from './routes/approvals.routes';
import mediaRoutes from './routes/media.routes';
import metricsRoutes from './routes/metrics.routes';
import usersRoutes from './routes/users.routes';
import municipiosRoutes from './routes/municipios.routes';
import faunaRoutes from './routes/fauna.routes';
import culturaRoutes from './routes/cultura.routes';

const adminRouter = Router();

adminRouter.use('/auth', authRoutes);
adminRouter.use('/establecimientos', establecimientosRoutes);
adminRouter.use('/claims', claimsRoutes);
adminRouter.use('/approvals', approvalsRoutes);
adminRouter.use('/media', mediaRoutes);
adminRouter.use('/metrics', metricsRoutes);
adminRouter.use('/users', usersRoutes);
adminRouter.use('/municipios', municipiosRoutes);
adminRouter.use('/fauna', faunaRoutes);
adminRouter.use('/cultura', culturaRoutes);

export default adminRouter;
