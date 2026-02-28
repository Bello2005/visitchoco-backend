import pool from "../config/db";

const SELECT_FIELDS = `
  id, name,
  administrative_act_type, administrative_act_number, administrative_act_date,
  total_area, plan_number, indigenous_people, cod_dane, lat, lon,
  ST_AsGeoJSON(territory_geom)::json AS territory_geom
`;

export const indigenousRepository = {
  findAll: async () => {
    const result = await pool.query(`SELECT ${SELECT_FIELDS} FROM indigenous_reserves`);
    return result.rows;
  },

  findById: async (id: number) => {
    const result = await pool.query(
      `SELECT ${SELECT_FIELDS} FROM indigenous_reserves WHERE id = $1`,
      [id]
    );
    return result.rows[0] ?? null;
  },

  findByMunicipality: async (codDane: string) => {
    const result = await pool.query(
      `SELECT ${SELECT_FIELDS} FROM indigenous_reserves WHERE cod_dane = $1`,
      [codDane]
    );
    return result.rows;
  },
};
