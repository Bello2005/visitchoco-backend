import { verifyJWT } from "./auth";
import jwt from "jsonwebtoken";
import { Request, Response, NextFunction } from "express";

process.env.JWT_SECRET = "test-secret";

function mockReq(authHeader?: string): Partial<Request> {
  return { headers: { authorization: authHeader } } as Partial<Request>;
}

function mockRes(): { status: jest.Mock; json: jest.Mock; statusCode: number } {
  const res = { statusCode: 200 } as any;
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  return res;
}

describe("verifyJWT middleware", () => {
  const next = jest.fn() as NextFunction;

  beforeEach(() => jest.clearAllMocks());

  it("devuelve 401 si no hay header Authorization", () => {
    const req = mockReq();
    const res = mockRes();
    verifyJWT(req as Request, res as unknown as Response, next);
    expect(res.status).toHaveBeenCalledWith(401);
    expect(next).not.toHaveBeenCalled();
  });

  it("devuelve 401 si el formato no es Bearer", () => {
    const req = mockReq("Token abc123");
    const res = mockRes();
    verifyJWT(req as Request, res as unknown as Response, next);
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
    verifyJWT(req as Request, res as unknown as Response, next);
  });

  it("devuelve 401 si el token está expirado", (done) => {
    const expired = jwt.sign(
      { sub: 1, role: "user", email: "test@test.com" },
      "test-secret",
      { expiresIn: -1 }
    );
    const req = mockReq(`Bearer ${expired}`);
    const res = mockRes();
    res.json = jest.fn().mockImplementation(() => {
      expect(res.status).toHaveBeenCalledWith(401);
      expect(next).not.toHaveBeenCalled();
      done();
      return res;
    });
    verifyJWT(req as Request, res as unknown as Response, next);
  });

  it("llama a next() con un token válido", (done) => {
    const token = jwt.sign(
      { sub: 1, role: "user", email: "test@test.com" },
      "test-secret",
      { expiresIn: "1h" }
    );
    const req = mockReq(`Bearer ${token}`);
    const res = mockRes();
    const nextFn = jest.fn(() => done());
    verifyJWT(req as Request, res as unknown as Response, nextFn as NextFunction);
  });
});
