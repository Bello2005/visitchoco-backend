"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyJWT = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const verifyJWT = (req, res, next) => {
    try {
        console.log("[AUTH] Headers recibidos:", Object.assign(Object.assign({}, req.headers), { authorization: req.headers.authorization
                ? "Bearer [FILTERED]"
                : undefined }));
        const authHeader = req.headers.authorization;
        if (!authHeader) {
            console.log("[AUTH] No se encontró header de autorización");
            return res.status(401).json({
                error: "Unauthorized",
                message: "Token de autenticación no proporcionado",
            });
        }
        if (!authHeader.startsWith("Bearer ")) {
            console.log("[AUTH] Formato de token inválido");
            return res.status(401).json({
                error: "Unauthorized",
                message: "Formato de token inválido",
            });
        }
        const token = authHeader.split(" ")[1];
        if (!token) {
            console.log("[AUTH] Token vacío");
            return res.status(401).json({
                error: "Unauthorized",
                message: "Token vacío",
            });
        }
        console.log("[AUTH] Verificando token...");
        jsonwebtoken_1.default.verify(token, process.env.JWT_SECRET, (err, decoded) => {
            if (err) {
                console.log("[AUTH] Error al verificar token:", err.message);
                if (err.name === "TokenExpiredError") {
                    return res.status(401).json({
                        error: "Token Expired",
                        message: "El token ha expirado",
                    });
                }
                return res.status(403).json({
                    error: "Forbidden",
                    message: "Token inválido",
                });
            }
            console.log("[AUTH] Token verificado correctamente, payload:", {
                sub: decoded.sub,
                role: decoded.role,
                email: decoded.email,
            });
            req.user = decoded;
            next();
        });
    }
    catch (error) {
        console.error("[AUTH] Error inesperado:", error);
        res.status(500).json({
            error: "Internal Server Error",
            message: "Error al procesar la autenticación",
        });
    }
};
exports.verifyJWT = verifyJWT;
