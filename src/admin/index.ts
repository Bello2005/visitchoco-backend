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
