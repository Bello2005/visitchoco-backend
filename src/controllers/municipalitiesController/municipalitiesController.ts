import { Request, Response } from "express";
import { municipalityRepository } from "../../repositories/municipalityRepository";

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
  attractions: unknown[];
  transportation: unknown[];
  weather: { temperature?: string; climate?: string; rainfall?: string } | null;
  cod_dane: string;
  coordinates?: [number, number];
  created_at: Date;
  updated_at: Date;
  geometry?: unknown;
}

export const getMunicipalities = async (_req: Request, res: Response) => {
  try {
    const rows = await municipalityRepository.findAll();
    const municipalities = rows.map((m: Municipality) => ({
      ...m,
      coordinates: [m.lat, m.lon],
    }));
    res.json(municipalities);
  } catch (error) {
    console.error("[municipalities] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getMunicipalityBySlug = async (req: Request, res: Response) => {
  const slug = req.params.slug as string;

  if (!slug) {
    return res.status(400).json({ success: false, message: "Se requiere un slug válido" });
  }

  try {
    const row = await municipalityRepository.findBySlug(slug);

    if (!row) {
      return res.status(404).json({ success: false, message: "Municipio no encontrado" });
    }

    res.json({ ...row, coordinates: [row.lat, row.lon] });
  } catch (error) {
    console.error("[municipalities] Error fetching by slug:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
