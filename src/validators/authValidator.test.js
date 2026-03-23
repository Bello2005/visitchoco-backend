"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const authValidator_1 = require("./authValidator");
describe("loginSchema", () => {
    it("valida un login correcto", () => {
        const result = authValidator_1.loginSchema.safeParse({ email: "user@test.com", password: "12345678" });
        expect(result.success).toBe(true);
    });
    it("falla con email inválido", () => {
        const result = authValidator_1.loginSchema.safeParse({ email: "not-an-email", password: "12345678" });
        expect(result.success).toBe(false);
    });
    it("falla con contraseña menor a 8 caracteres", () => {
        const result = authValidator_1.loginSchema.safeParse({ email: "user@test.com", password: "short" });
        expect(result.success).toBe(false);
    });
    it("falla si falta el email", () => {
        const result = authValidator_1.loginSchema.safeParse({ password: "12345678" });
        expect(result.success).toBe(false);
    });
});
describe("registerSchema", () => {
    it("valida un registro correcto", () => {
        const result = authValidator_1.registerSchema.safeParse({
            name: "Juan Pérez",
            email: "juan@test.com",
            password: "securePass123",
        });
        expect(result.success).toBe(true);
    });
    it("falla con nombre menor a 2 caracteres", () => {
        const result = authValidator_1.registerSchema.safeParse({
            name: "J",
            email: "juan@test.com",
            password: "securePass123",
        });
        expect(result.success).toBe(false);
    });
    it("falla con email inválido", () => {
        const result = authValidator_1.registerSchema.safeParse({
            name: "Juan",
            email: "invalid",
            password: "securePass123",
        });
        expect(result.success).toBe(false);
    });
});
