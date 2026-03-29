import pool from "../config/db";

export const fiestasRepository = {
  findAll: async () => {
    const result = await pool.query(
      `SELECT f.*, m.lat, m.lon, m.slug
       FROM fiestas_patronales f
       LEFT JOIN municipalities m ON LOWER(m.name) = LOWER(f.municipio_nombre)
       ORDER BY f.mes, f.fecha_inicio_dia`
    );
    return result.rows;
  },

  findProximas: async () => {
    const mesActual = new Date().getMonth() + 1;
    const mesSiguiente = mesActual === 12 ? 1 : mesActual + 1;
    const result = await pool.query(
      `SELECT f.*, m.lat, m.lon, m.slug, m.image_url
       FROM fiestas_patronales f
       LEFT JOIN municipalities m ON LOWER(m.name) = LOWER(f.municipio_nombre)
       WHERE f.mes IN ($1, $2)
       ORDER BY f.mes, f.fecha_inicio_dia`,
      [mesActual, mesSiguiente]
    );
    return result.rows;
  },

  findByMunicipio: async (nombre: string) => {
    const result = await pool.query(
      `SELECT * FROM fiestas_patronales
       WHERE LOWER(municipio_nombre) = LOWER($1)
       ORDER BY mes`,
      [nombre]
    );
    return result.rows;
  },
};
