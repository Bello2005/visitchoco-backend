import { Pool } from "pg";
import db from "../../config/db";

export interface IUser {
  id: number;
  email: string;
  password_hash: string;
  role_id: number;
  role: string;
}

export const findUserByEmail = async (email: string): Promise<IUser | null> => {
  const res = await db.query<IUser>(
    `SELECT 
       u.id, 
       u.email, 
       u.password_hash, 
       u.role_id,
       r.name AS role
     FROM users u
     JOIN roles r ON u.role_id = r.id
     WHERE u.email = $1`,
    [email]
  );
  return res.rows[0] || null;
};
