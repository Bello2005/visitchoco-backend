import pool from "../config/db";

export const attractionRepository = {
  findAll: async () => {
    const result = await pool.query(`
      SELECT a.*, m.name AS municipality_name
      FROM attractions a
      LEFT JOIN municipalities m ON m.id = a.municipality_id
      ORDER BY a.name ASC
    `);
    return result.rows;
  },

  findByMunicipality: async (municipalityId: number) => {
    const result = await pool.query(
      `
      SELECT a.*, m.name AS municipality_name
      FROM attractions a
      LEFT JOIN municipalities m ON m.id = a.municipality_id
      WHERE a.municipality_id = $1
      ORDER BY a.name ASC
      `,
      [municipalityId]
    );
    return result.rows;
  },
};
