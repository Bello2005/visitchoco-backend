import { Request, Response } from "express";
import { festivalRepository } from "../../repositories/festivalRepository";

export const getFestivals = async (_req: Request, res: Response) => {
  try {
    const rows = await festivalRepository.findAll();
    res.json(rows);
  } catch (error) {
    console.error("[festivals] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getFestivalsByMunicipality = async (req: Request, res: Response) => {
  const municipalityId = Number(req.params.municipalityId);
  if (isNaN(municipalityId)) {
    return res.status(400).json({ success: false, message: "ID de municipio inválido" });
  }
  try {
    const rows = await festivalRepository.findByMunicipality(municipalityId);
    res.json(rows);
  } catch (error) {
    console.error("[festivals] Error fetching by municipality:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
