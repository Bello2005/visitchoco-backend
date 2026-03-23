"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const auth_1 = require("./auth");
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
process.env.JWT_SECRET = "test-secret";
function mockReq(authHeader) {
    return { headers: { authorization: authHeader } };
}
function mockRes() {
    const res = { statusCode: 200 };
    res.status = jest.fn().mockReturnValue(res);
    res.json = jest.fn().mockReturnValue(res);
    return res;
}
describe("verifyJWT middleware", () => {
    const next = jest.fn();
    beforeEach(() => jest.clearAllMocks());
    it("devuelve 401 si no hay header Authorization", () => {
        const req = mockReq();
        const res = mockRes();
        (0, auth_1.verifyJWT)(req, res, next);
        expect(res.status).toHaveBeenCalledWith(401);
        expect(next).not.toHaveBeenCalled();
    });
    it("devuelve 401 si el formato no es Bearer", () => {
        const req = mockReq("Token abc123");
        const res = mockRes();
        (0, auth_1.verifyJWT)(req, res, next);
        expect(res.status).toHaveBeenCalledWith(401);
        expect(next).not.toHaveBeenCalled();
    });
    it("devuelve 403 si el token es inválido", (done) => {
        const req = mockReq("Bearer invalid.token.here");
        const res = mockRes();
        res.json = jest.fn().mockImplementation(() => {
            expect(res.status).toHaveBeenCalledWith(403);
            expect(next).not.toHaveBeenCalled();
            done();
            return res;
        });
        (0, auth_1.verifyJWT)(req, res, next);
    });
    it("devuelve 401 si el token está expirado", (done) => {
        const expired = jsonwebtoken_1.default.sign({ sub: 1, role: "user", email: "test@test.com" }, "test-secret", { expiresIn: -1 });
        const req = mockReq(`Bearer ${expired}`);
        const res = mockRes();
        res.json = jest.fn().mockImplementation(() => {
            expect(res.status).toHaveBeenCalledWith(401);
            expect(next).not.toHaveBeenCalled();
            done();
            return res;
        });
        (0, auth_1.verifyJWT)(req, res, next);
    });
    it("llama a next() con un token válido", (done) => {
        const token = jsonwebtoken_1.default.sign({ sub: 1, role: "user", email: "test@test.com" }, "test-secret", { expiresIn: "1h" });
        const req = mockReq(`Bearer ${token}`);
        const res = mockRes();
        const nextFn = jest.fn(() => done());
        (0, auth_1.verifyJWT)(req, res, nextFn);
    });
});
