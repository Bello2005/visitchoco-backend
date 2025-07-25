import bcrypt from "bcrypt";
import db from "../../config/db";
import { Request, Response } from "express";

import { authenticate } from "../../services/authService/authService";

const authController = {
  register: async (req: Request, res: Response) => {
    const { name, email, password } = req.body;
    const hash = await bcrypt.hash(password, 10);
    // Asume que el role_id por defecto es 2 (usuario normal)
    await db.query(
      "INSERT INTO users (name, email, password_hash, role_id) VALUES ($1, $2, $3, $4)",
      [name, email, hash, 2]
    );
    res.status(201).json({ message: "User created" });
  },
  login: async (req: Request, res: Response) => {
    const { email, password } = req.body;
    try {
      // authenticate debe retornar solo el token, así que obtenemos el usuario para el rol
      const user = await (
        await import("../../models/Users/Users")
      ).findUserByEmail(email);
      if (!user) throw new Error("Invalid credentials");
      const token = await authenticate(email, password);
      return res.json({ token, role: user.role });
    } catch (err: any) {
      return res.status(401).json({ message: err.message });
    }
  },
};

export const register = authController.register;
export const login = authController.login;
