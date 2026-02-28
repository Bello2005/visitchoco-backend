import bcrypt from "bcrypt";
import { Request, Response } from "express";
import { authenticate } from "../../services/authService/authService";
import { userRepository } from "../../repositories/userRepository";
import { loginSchema, registerSchema } from "../../validators/authValidator";

export const register = async (req: Request, res: Response) => {
  const parsed = registerSchema.safeParse(req.body);
  if (!parsed.success) {
    return res.status(400).json({
      success: false,
      message: parsed.error.issues[0].message,
    });
  }

  const { name, email, password } = parsed.data;

  try {
    const hash = await bcrypt.hash(password, 10);
    await userRepository.create(name, email, hash);
    res.status(201).json({ success: true, message: "Usuario creado exitosamente" });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : "";
    if (msg.includes("unique") || msg.includes("duplicate")) {
      return res.status(409).json({ success: false, message: "El email ya está registrado" });
    }
    console.error("[auth] Error en registro:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const login = async (req: Request, res: Response) => {
  const parsed = loginSchema.safeParse(req.body);
  if (!parsed.success) {
    return res.status(400).json({
      success: false,
      message: parsed.error.issues[0].message,
    });
  }

  const { email, password } = parsed.data;

  try {
    const user = await userRepository.findByEmail(email);
    if (!user) {
      return res.status(401).json({ success: false, message: "Credenciales inválidas" });
    }
    const token = await authenticate(email, password);
    res.json({ token, role: user.role });
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : "Credenciales inválidas";
    res.status(401).json({ success: false, message });
  }
};

export const getAllUsers = async (_req: Request, res: Response) => {
  try {
    const users = await userRepository.findAll();
    res.json(users);
  } catch (error) {
    console.error("[auth] Error fetching users:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
