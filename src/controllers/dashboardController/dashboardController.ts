import { Request, Response } from "express";

const dashboardController = {
  getUserDashboard: async (req: Request, res: Response) => {
    try {
      // Obtener el usuario del request (establecido por el middleware de autenticación)
      const user = req.user;
      
      // Aquí puedes agregar la lógica específica para el dashboard de usuario
      return res.json({
        message: "Bienvenido al dashboard de usuario",
        user: user
      });
    } catch (error) {
      console.error("Error en getUserDashboard:", error);
      return res.status(500).json({ message: "Error interno del servidor" });
    }
  },

  getAdminDashboard: async (req: Request, res: Response) => {
    try {
      // Obtener el usuario del request (establecido por el middleware de autenticación)
      const user = req.user;
      
      // Aquí puedes agregar la lógica específica para el dashboard de administrador
      return res.json({
        message: "Bienvenido al dashboard de administrador",
        user: user
      });
    } catch (error) {
      console.error("Error en getAdminDashboard:", error);
      return res.status(500).json({ message: "Error interno del servidor" });
    }
  }
};

export const { getUserDashboard, getAdminDashboard } = dashboardController;
