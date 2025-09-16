"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const auth_1 = require("../../middlewares/auth");
const dashboardController_1 = require("../../controllers/dashboardController/dashboardController");
const router = (0, express_1.Router)();
// Ruta para el dashboard de usuario
router.get("/user/dashboard", auth_1.verifyJWT, dashboardController_1.getUserDashboard);
// Ruta para el dashboard de administrador
router.get("/admin/dashboard", auth_1.verifyJWT, dashboardController_1.getAdminDashboard);
exports.default = router;
