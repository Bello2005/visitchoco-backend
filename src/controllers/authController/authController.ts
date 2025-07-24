import { Request, Response } from "express";
import { authenticate } from "../../services/authService/authService";

export const login = async (req: Request, res: Response) => {
  const { email, password } = req.body;
  try {
    const token = await authenticate(email, password);
    return res.json({ token });
  } catch (err: any) {
    return res.status(401).json({ message: err.message });
  }
};
