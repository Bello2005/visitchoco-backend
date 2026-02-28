import { Request, Response } from "express";
import { ethnicRepository } from "../../repositories/ethnicRepository";

export const getEthnicDistribution = async (_req: Request, res: Response) => {
  try {
    const rows = await ethnicRepository.findAll();
    res.json(rows);
  } catch (error) {
    console.error("[ethnic] Error fetching all:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getEthnicDistributionByMunicipality = async (req: Request, res: Response) => {
  const codDane = req.params.codDane as string;

  try {
    const rows = await ethnicRepository.findByMunicipality(codDane);

    if (rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "No se encontró distribución étnica para este municipio",
      });
    }

    res.json(rows);
  } catch (error) {
    console.error("[ethnic] Error fetching by municipality:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getLatestEthnicSummary = async (_req: Request, res: Response) => {
  try {
    const rows = await ethnicRepository.findLatestSummary();
    res.json(rows);
  } catch (error) {
    console.error("[ethnic] Error fetching latest summary:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getTotalEthnicSummary = async (_req: Request, res: Response) => {
  try {
    const rows = await ethnicRepository.findTotalSummary();
    res.json(rows);
  } catch (error) {
    console.error("[ethnic] Error fetching total summary:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getEthnicDistributionByYear = async (_req: Request, res: Response) => {
  try {
    const rows = await ethnicRepository.findByYear();
    res.json(rows);
  } catch (error) {
    console.error("[ethnic] Error fetching by year:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getEthnicStats = async (_req: Request, res: Response) => {
  try {
    const rows = await ethnicRepository.findStats();
    res.json(rows);
  } catch (error) {
    console.error("[ethnic] Error fetching stats:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
