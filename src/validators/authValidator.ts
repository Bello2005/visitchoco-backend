import { z } from "zod";

export const loginSchema = z.object({
  email: z.string().email("Email inválido"),
  password: z.string().min(8, "La contraseña debe tener mínimo 8 caracteres"),
});

export const registerSchema = z.object({
  name: z.string().min(2, "El nombre debe tener mínimo 2 caracteres"),
  email: z.string().email("Email inválido"),
  password: z.string().min(8, "La contraseña debe tener mínimo 8 caracteres"),
});
