import { Request, Response } from "express";
import { attractionRepository } from "../../repositories/attractionRepository";

export const getAttractions = async (_req: Request, res: Response) => {
  try {
    const rows = await attractionRepository.findAll();
    res.json(rows);
  } catch (error) {
    console.error("[attractions] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getAttractionsByMunicipality = async (req: Request, res: Response) => {
  const municipalityId = Number(req.params.municipalityId);
  if (isNaN(municipalityId)) {
    return res.status(400).json({ success: false, message: "ID de municipio inválido" });
  }
  try {
    const rows = await attractionRepository.findByMunicipality(municipalityId);
    res.json(rows);
  } catch (error) {
    console.error("[attractions] Error fetching by municipality:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
