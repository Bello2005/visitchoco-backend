import { Request, Response } from "express";
import { fiestasRepository } from "../../repositories/fiestasRepository";

export const getFiestasPatronales = async (_req: Request, res: Response) => {
  try {
    const rows = await fiestasRepository.findAll();
    res.json(rows);
  } catch (error) {
    console.error("[fiestas] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getFiestasProximas = async (_req: Request, res: Response) => {
  try {
    const rows = await fiestasRepository.findProximas();
    res.json(rows);
  } catch (error) {
    console.error("[fiestas] Error fetching proximas:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getFiestasByMunicipio = async (req: Request, res: Response) => {
  const nombre = decodeURIComponent(req.params.nombre);
  try {
    const rows = await fiestasRepository.findByMunicipio(nombre);
    res.json(rows);
  } catch (error) {
    console.error("[fiestas] Error fetching by municipio:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
