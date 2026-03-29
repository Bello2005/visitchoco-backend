import { Request, Response } from "express";
import { indigenousRepository } from "../../repositories/indigenousRepository";
import { transformToGeoJSON } from "../../utils/geojsonUtils";

export const getIndigenousReserves = async (_req: Request, res: Response) => {
  try {
    const rows = await indigenousRepository.findAll();
    res.json(rows.map(transformToGeoJSON).filter(Boolean));
  } catch (error) {
    console.error("[indigenous] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getIndigenousReserveById = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id as string, 10);

  if (isNaN(id)) {
    return res.status(400).json({ success: false, message: "ID inválido" });
  }

  try {
    const row = await indigenousRepository.findById(id);

    if (!row) {
      return res.status(404).json({ success: false, message: "Reserva indígena no encontrada" });
    }

    const transformed = transformToGeoJSON(row);
    if (!transformed) {
      return res.status(500).json({ success: false, message: "Error al procesar la geometría" });
    }

    res.json(transformed);
  } catch (error) {
    console.error("[indigenous] Error fetching by id:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getIndigenousReservesByMunicipality = async (req: Request, res: Response) => {
  const codDane = req.params.codDane as string;

  if (!codDane) {
    return res.status(400).json({ success: false, message: "Se requiere el código DANE" });
  }

  try {
    const rows = await indigenousRepository.findByMunicipality(codDane);
    res.json(rows.map(transformToGeoJSON).filter(Boolean));
  } catch (error) {
    console.error("[indigenous] Error fetching by municipality:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
