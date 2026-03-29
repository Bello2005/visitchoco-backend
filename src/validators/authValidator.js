"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.registerSchema = exports.loginSchema = void 0;
const zod_1 = require("zod");
exports.loginSchema = zod_1.z.object({
    email: zod_1.z.string().email("Email inválido"),
    password: zod_1.z.string().min(8, "La contraseña debe tener mínimo 8 caracteres"),
});
exports.registerSchema = zod_1.z.object({
    name: zod_1.z.string().min(2, "El nombre debe tener mínimo 2 caracteres"),
    email: zod_1.z.string().email("Email inválido"),
    password: zod_1.z.string().min(8, "La contraseña debe tener mínimo 8 caracteres"),
});
