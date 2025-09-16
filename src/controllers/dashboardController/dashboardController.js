"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAdminDashboard = exports.getUserDashboard = void 0;
const dashboardController = {
    getUserDashboard: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            // Obtener el usuario del request (establecido por el middleware de autenticación)
            const user = req.user;
            // Aquí puedes agregar la lógica específica para el dashboard de usuario
            return res.json({
                message: "Bienvenido al dashboard de usuario",
                user: user
            });
        }
        catch (error) {
            console.error("Error en getUserDashboard:", error);
            return res.status(500).json({ message: "Error interno del servidor" });
        }
    }),
    getAdminDashboard: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            // Obtener el usuario del request (establecido por el middleware de autenticación)
            const user = req.user;
            // Aquí puedes agregar la lógica específica para el dashboard de administrador
            return res.json({
                message: "Bienvenido al dashboard de administrador",
                user: user
            });
        }
        catch (error) {
            console.error("Error en getAdminDashboard:", error);
            return res.status(500).json({ message: "Error interno del servidor" });
        }
    })
};
exports.getUserDashboard = dashboardController.getUserDashboard, exports.getAdminDashboard = dashboardController.getAdminDashboard;
