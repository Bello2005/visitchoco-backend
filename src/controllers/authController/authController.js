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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAllUsers = exports.login = exports.register = void 0;
const bcrypt_1 = __importDefault(require("bcrypt"));
const authService_1 = require("../../services/authService/authService");
const userRepository_1 = require("../../repositories/userRepository");
const authValidator_1 = require("../../validators/authValidator");
const register = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const parsed = authValidator_1.registerSchema.safeParse(req.body);
    if (!parsed.success) {
        return res.status(400).json({
            success: false,
            message: parsed.error.issues[0].message,
        });
    }
    const { name, email, password } = parsed.data;
    try {
        const hash = yield bcrypt_1.default.hash(password, 10);
        yield userRepository_1.userRepository.create(name, email, hash);
        res.status(201).json({ success: true, message: "Usuario creado exitosamente" });
    }
    catch (error) {
        const msg = error instanceof Error ? error.message : "";
        if (msg.includes("unique") || msg.includes("duplicate")) {
            return res.status(409).json({ success: false, message: "El email ya está registrado" });
        }
        console.error("[auth] Error en registro:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.register = register;
const login = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const parsed = authValidator_1.loginSchema.safeParse(req.body);
    if (!parsed.success) {
        return res.status(400).json({
            success: false,
            message: parsed.error.issues[0].message,
        });
    }
    const { email, password } = parsed.data;
    try {
        const user = yield userRepository_1.userRepository.findByEmail(email);
        if (!user) {
            return res.status(401).json({ success: false, message: "Credenciales inválidas" });
        }
        const token = yield (0, authService_1.authenticate)(email, password);
        res.json({ token, role: user.role });
    }
    catch (err) {
        const message = err instanceof Error ? err.message : "Credenciales inválidas";
        res.status(401).json({ success: false, message });
    }
});
exports.login = login;
const getAllUsers = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const users = yield userRepository_1.userRepository.findAll();
        res.json(users);
    }
    catch (error) {
        console.error("[auth] Error fetching users:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getAllUsers = getAllUsers;
