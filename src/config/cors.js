"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.configureCors = void 0;
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = require("dotenv");
(0, dotenv_1.config)();
const isDevelopment = process.env.NODE_ENV === "development";
const isVercelDeployment = (origin) => {
    return origin.endsWith('.vercel.app') || origin === 'https://visitchoco-frontend.vercel.app';
};
const corsOptions = {
    origin: (origin, callback) => {
        // Permitir solicitudes en desarrollo
        if (isDevelopment && (!origin || origin.startsWith('http://localhost') || origin.startsWith('http://127.0.0.1'))) {
            callback(null, true);
            return;
        }
        // Permitir solicitudes de dominios Vercel en producción
        if (!isDevelopment && (!origin || isVercelDeployment(origin))) {
            callback(null, true);
            return;
        }
        callback(new Error('No permitido por CORS'));
    },
    credentials: true,
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: [
        "Content-Type",
        "Authorization",
        "Origin",
        "X-Requested-With",
        "Accept",
    ],
};
const configureCors = (app) => {
    app.use((0, cors_1.default)(corsOptions));
};
exports.configureCors = configureCors;
