import { Request, Response } from "express";
import { animalRepository } from "../../repositories/animalRepository";

export const getAnimals = async (_req: Request, res: Response) => {
  try {
    const rows = await animalRepository.findAll();
    res.json(rows);
  } catch (error) {
    console.error("[animals] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getAnimalsByMunicipality = async (req: Request, res: Response) => {
  const municipalityId = Number(req.params.municipalityId);
  if (isNaN(municipalityId)) {
    return res.status(400).json({ success: false, message: "ID de municipio inválido" });
  }
  try {
    const rows = await animalRepository.findByMunicipality(municipalityId);
    res.json(rows);
  } catch (error) {
    console.error("[animals] Error fetching by municipality:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
