import pool from "../config/db";

export const patrimonioRepository = {
  findAll: async () => {
    const result = await pool.query(`
      SELECT * FROM patrimonio_inmaterial
      ORDER BY municipio_nombre, id
    `);
    return result.rows;
  },

  findByMunicipio: async (municipio: string) => {
    const result = await pool.query(
      `
      SELECT * FROM patrimonio_inmaterial
      WHERE municipio_nombre = $1 OR municipio_nombre = 'Chocó'
      ORDER BY ambito DESC, id ASC
      `,
      [municipio]
    );
    return result.rows;
  },

  findMaterialByMunicipio: async (municipio: string) => {
    const result = await pool.query(
      `SELECT * FROM patrimonio_material WHERE municipio_nombre = $1 ORDER BY id`,
      [municipio]
    );
    return result.rows;
  },

  findRntByMunicipio: async (municipio: string) => {
    const result = await pool.query(
      `SELECT * FROM rnt_resumen WHERE municipio_nombre = $1 LIMIT 1`,
      [municipio]
    );
    return result.rows[0] ?? null;
  },
};
