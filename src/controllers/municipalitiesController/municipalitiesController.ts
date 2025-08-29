import { Request, Response } from "express";
import pool from "../../config/db";

export interface Municipality {
  id: number;
  name: string;
  description: string | null;
  image_url: string | null;
  audio_url: string | null;
  lat: number;
  lon: number;
  slug: string;
  emoji: string | null;
  zone: string | null;
  main_activity: string | null;
  attractions: any[];
  transportation: any[];
  weather: {
    temperature?: string;
    climate?: string;
    rainfall?: string;
  } | null;
  cod_dane: string;
  coordinates?: [number, number];
  created_at: Date;
  updated_at: Date;
  geometry?: any;
}

export const getMunicipalities = async (req: Request, res: Response) => {
  try {
    console.log("=== PETICIÓN GET ALL MUNICIPALITIES ===");
    console.log("URL:", req.url);
    console.log("Method:", req.method);

    const result = await pool.query(`
      SELECT 
        id,
        name,
        description,
        image_url,
        audio_url,
        lat,
        lon,
        slug,
        emoji,
        zone,
        main_activity,
        attractions::jsonb,
        transportation::jsonb,
        weather::jsonb,
        ST_AsGeoJSON(territory_geom)::jsonb as geometry,
        cod_dane,
        created_at,
        updated_at
      FROM municipalities
      ORDER BY name ASC
    `);

    const municipalities = result.rows.map((municipality: Municipality) => ({
      ...municipality,
      coordinates: [municipality.lat, municipality.lon],
    }));

    res.json(municipalities);
  } catch (error) {
    console.error("Error fetching municipalities:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

export const getMunicipalityBySlug = async (req: Request, res: Response) => {
  try {
    const { slug } = req.params;
    console.log("=== INICIO DE BÚSQUEDA ===");
    console.log("Parámetros recibidos:", req.params);
    console.log("Buscando municipio con slug:", slug);

    if (!slug) {
      console.error("Error: No se proporcionó un slug");
      return res.status(400).json({ error: "Se requiere un slug válido" });
    }

    const result = await pool.query(
      `
      SELECT 
        id,
        name,
        description,
        image_url,
        audio_url,
        lat,
        lon,
        slug,
        emoji,
        zone,
        main_activity,
        attractions::jsonb,
        transportation::jsonb,
        weather::jsonb,
        ST_AsGeoJSON(geom)::jsonb as geometry,
        cod_dane,
        created_at,
        updated_at
      FROM municipalities
      WHERE slug = $1
    `,
      [slug]
    );

    console.log("Resultado de la consulta:", result.rows[0]);

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Municipality not found" });
    }

    if (!result.rows[0]) {
      console.log("=== NO SE ENCONTRÓ EL MUNICIPIO ===");
      console.log("Slug buscado:", slug);
      return res.status(404).json({ error: "Municipio no encontrado" });
    }

    console.log("=== DATOS CRUDOS DE LA BASE DE DATOS ===");
    console.log(JSON.stringify(result.rows[0], null, 2));

    const municipality = {
      ...result.rows[0],
      coordinates: [result.rows[0].lat, result.rows[0].lon],
    };

    console.log("=== DATOS TRANSFORMADOS DEL MUNICIPIO ===");
    console.log(
      JSON.stringify(
        {
          name: municipality.name,
          zone: municipality.zone,
          attractions: municipality.attractions,
          transportation: municipality.transportation,
          weather: municipality.weather,
          coordinates: municipality.coordinates,
        },
        null,
        2
      )
    );

    res.json(municipality);
  } catch (error) {
    console.error("=== ERROR EN LA BÚSQUEDA ===");
    console.error("Slug que causó el error:", req.params.slug);
    console.error("Error completo:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};
