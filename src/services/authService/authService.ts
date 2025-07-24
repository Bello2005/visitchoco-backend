import bcrypt from "bcrypt";
import jwt, { Secret } from "jsonwebtoken";
import { findUserByEmail, IUser } from "../../models/Users/Users";

const JWT_SECRET: Secret = process.env.JWT_SECRET!;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || "1h";

export const authenticate = async (
  email: string,
  password: string
): Promise<string> => {
  const user = await findUserByEmail(email);
  if (!user) throw new Error("Invalid credentials");

  const valid = await bcrypt.compare(password, user.password_hash);
  if (!valid) throw new Error("Invalid credentials");

  const token = jwt.sign(
    { sub: user.id, role: user.role, email: user.email },
    JWT_SECRET,
    { expiresIn: JWT_EXPIRES_IN } as jwt.SignOptions
  );
  return token;
};
