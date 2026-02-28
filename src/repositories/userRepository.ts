import pool from "../config/db";

export const userRepository = {
  findByEmail: async (email: string) => {
    const result = await pool.query(
      "SELECT * FROM users JOIN roles ON users.role_id = roles.id WHERE email = $1",
      [email]
    );
    return result.rows[0] ?? null;
  },

  findAll: async () => {
    const result = await pool.query(
      "SELECT id, name, email, role, created_at FROM users ORDER BY id ASC"
    );
    return result.rows;
  },

  create: async (name: string, email: string, passwordHash: string, roleId = 2) => {
    const result = await pool.query(
      "INSERT INTO users (name, email, password_hash, role_id) VALUES ($1, $2, $3, $4) RETURNING id, name, email",
      [name, email, passwordHash, roleId]
    );
    return result.rows[0];
  },
};
