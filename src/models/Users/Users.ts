import { Pool } from "pg";
import db from "../../config/db";

export interface IUser {
  id: number;
  email: string;
  password_hash: string;
  role: "admin" | "user";
}

export const findUserByEmail = async (email: string): Promise<IUser | null> => {
  const res = await db.query<IUser>(
    "SELECT id, email, password_hash, role FROM users WHERE email = $1",
    [email]
  );
  return res.rows[0] || null;
};
