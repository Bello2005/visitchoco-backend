import { Router, Request, Response } from "express";
import pool from "../../config/db";

const router = Router();

router.get("/:cod_dane", async (req: Request, res: Response) => {
  const { cod_dane } = req.params;
  try {
    const result = await pool.query(
      `SELECT count AS total, men, women, cabecera_municipal, centros_poblados_rural_disperso, year, source
       FROM population
       WHERE cod_dane = $1 AND year = 2026
       LIMIT 1`,
      [cod_dane]
    );
    if (!result.rows[0]) {
      res.status(404).json({ message: "No data" });
      return;
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error("[population] Error:", err);
    res.status(500).json({ message: "Error interno" });
  }
});

export default router;
