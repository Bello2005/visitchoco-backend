import pool from "../config/db";

export const municipalityRepository = {
  findAll: async () => {
    const result = await pool.query(`
      SELECT
        m.id, m.name, m.description, m.image_url, m.audio_url,
        m.lat, m.lon, m.slug, m.emoji, m.zone, m.main_activity,
        m.attractions::jsonb, m.transportation::jsonb, m.weather::jsonb,
        ST_AsGeoJSON(m.territory_geom)::jsonb AS geometry,
        m.cod_dane, m.created_at, m.updated_at,
        COALESCE(p.total_population, 0)::integer AS population,
        COALESCE(p.men, 0)::integer AS population_men,
        COALESCE(p.women, 0)::integer AS population_women
      FROM municipalities m
      LEFT JOIN (
        SELECT cod_dane, count AS total_population, men, women
        FROM population
        WHERE year = 2026
      ) p ON p.cod_dane = m.cod_dane
      ORDER BY m.name ASC
    `);
    return result.rows;
  },

  findBySlug: async (slug: string) => {
    const result = await pool.query(
      `
      SELECT
        id, name, description, image_url, audio_url,
        lat, lon, slug, emoji, zone, main_activity,
        attractions::jsonb, transportation::jsonb, weather::jsonb,
        ST_AsGeoJSON(geom)::jsonb AS geometry,
        cod_dane, created_at, updated_at
      FROM municipalities
      WHERE slug = $1
      `,
      [slug]
    );
    return result.rows[0] ?? null;
  },
};
