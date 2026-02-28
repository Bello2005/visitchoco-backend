import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

declare global {
  namespace Express {
    interface Request {
      user?: Record<string, unknown>;
    }
  }
}

const isDev = process.env.NODE_ENV !== "production";

export const verifyJWT = (req: Request, res: Response, next: NextFunction) => {
  try {
    const authHeader = req.headers.authorization;

    if (!authHeader) {
      return res.status(401).json({
        success: false,
        message: "Token de autenticación no proporcionado",
      });
    }

    if (!authHeader.startsWith("Bearer ")) {
      return res.status(401).json({
        success: false,
        message: "Formato de token inválido. Use: Bearer <token>",
      });
    }

    const token = authHeader.split(" ")[1];

    jwt.verify(token, process.env.JWT_SECRET as string, (err, decoded) => {
      if (err) {
        if (isDev) console.log("[AUTH] Token inválido:", err.message);
        if (err.name === "TokenExpiredError") {
          return res.status(401).json({ success: false, message: "El token ha expirado" });
        }
        return res.status(403).json({ success: false, message: "Token inválido" });
      }

      req.user = decoded as Record<string, unknown>;
      next();
    });
  } catch (error) {
    console.error("[AUTH] Error inesperado:", error);
    res.status(500).json({ success: false, message: "Error al procesar la autenticación" });
  }
};
