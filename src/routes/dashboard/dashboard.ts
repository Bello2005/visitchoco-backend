import { Router } from "express";
import { verifyJWT } from "../../middlewares/auth";
import { getUserDashboard, getAdminDashboard } from "../../controllers/dashboardController/dashboardController";

const router = Router();

// Ruta para el dashboard de usuario
router.get("/user/dashboard", verifyJWT, getUserDashboard);

// Ruta para el dashboard de administrador
router.get("/admin/dashboard", verifyJWT, getAdminDashboard);

export default router;
