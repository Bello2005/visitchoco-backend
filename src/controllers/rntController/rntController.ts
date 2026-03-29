import { Request, Response } from "express";
import pool from "../../config/db";

export const getRntByMunicipio = async (req: Request, res: Response) => {
  const municipio = decodeURIComponent(req.params.municipio);
  try {
    const result = await pool.query(
      `SELECT * FROM rnt_resumen WHERE municipio_nombre = $1 LIMIT 1`,
      [municipio]
    );
    res.json(result.rows[0] ?? null);
  } catch (error) {
    console.error("[rnt] Error:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};

export const getRntSummary = async (req: Request, res: Response) => {
  try {
    const result = await pool.query(
      `SELECT * FROM rnt_resumen ORDER BY total_activos DESC`
    );
    res.json(result.rows);
  } catch (error) {
    console.error("[rnt] Error:", error);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
  }
};
