import pool from "../config/db";

export const festivalRepository = {
  findAll: async () => {
    const result = await pool.query(`
      SELECT f.*, m.name AS municipality_name
      FROM festivals f
      LEFT JOIN municipalities m ON m.id = f.municipality_id
      ORDER BY f.start_date ASC
    `);
    return result.rows;
  },

  findByMunicipality: async (municipalityId: number) => {
    const result = await pool.query(
      `
      SELECT f.*, m.name AS municipality_name
      FROM festivals f
      LEFT JOIN municipalities m ON m.id = f.municipality_id
      WHERE f.municipality_id = $1
      ORDER BY f.start_date ASC
      `,
      [municipalityId]
    );
    return result.rows;
  },
};
