import pool from "../config/db";

export const municipalityRepository = {
  findAll: async () => {
    const result = await pool.query(`
      SELECT
        id, name, description, image_url, audio_url,
        lat, lon, slug, emoji, zone, main_activity,
        attractions::jsonb, transportation::jsonb, weather::jsonb,
        ST_AsGeoJSON(territory_geom)::jsonb AS geometry,
        cod_dane, created_at, updated_at
      FROM municipalities
      ORDER BY name ASC
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
