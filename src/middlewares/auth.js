"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyJWT = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const isDev = process.env.NODE_ENV !== "production";
const verifyJWT = (req, res, next) => {
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
        jsonwebtoken_1.default.verify(token, process.env.JWT_SECRET, (err, decoded) => {
            if (err) {
                if (isDev)
                    console.log("[AUTH] Token inválido:", err.message);
                if (err.name === "TokenExpiredError") {
                    return res.status(401).json({ success: false, message: "El token ha expirado" });
                }
                return res.status(403).json({ success: false, message: "Token inválido" });
            }
            req.user = decoded;
            next();
        });
    }
    catch (error) {
        console.error("[AUTH] Error inesperado:", error);
        res.status(500).json({ success: false, message: "Error al procesar la autenticación" });
    }
};
exports.verifyJWT = verifyJWT;
