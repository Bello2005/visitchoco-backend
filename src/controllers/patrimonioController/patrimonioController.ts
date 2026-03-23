import { Request, Response } from "express";
import { patrimonioRepository } from "../../repositories/patrimonioRepository";

export const getPatrimonioInmaterial = async (_req: Request, res: Response) => {
  try {
    const rows = await patrimonioRepository.findAll();
    res.json(rows);
  } catch (error) {
    console.error("[patrimonio] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getPatrimonioByMunicipio = async (req: Request, res: Response) => {
  const municipio = decodeURIComponent(req.params.municipio);
  if (!municipio) {
    return res.status(400).json({ success: false, message: "Nombre de municipio requerido" });
  }
  try {
    const rows = await patrimonioRepository.findByMunicipio(municipio);
    res.json(rows);
  } catch (error) {
    console.error("[patrimonio] Error fetching by municipio:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getPatrimonioMaterialByMunicipio = async (req: Request, res: Response) => {
  const municipio = decodeURIComponent(req.params.municipio);
  try {
    const rows = await patrimonioRepository.findMaterialByMunicipio(municipio);
    res.json(rows);
  } catch (error) {
    console.error("[patrimonio] Error fetching material:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getRntByMunicipio = async (req: Request, res: Response) => {
  const municipio = decodeURIComponent(req.params.municipio);
  try {
    const row = await patrimonioRepository.findRntByMunicipio(municipio);
    res.json(row);
  } catch (error) {
    console.error("[patrimonio] Error fetching rnt:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
