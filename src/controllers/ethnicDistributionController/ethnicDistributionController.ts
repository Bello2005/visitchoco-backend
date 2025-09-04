import { Request, Response } from "express";
import pool from "../../config/db";

export interface EthnicDistribution {
  id: number;
  municipality_cod_dane: string;
  year: number;
  source: string;
  race_code: string;
  persons_count: number;
  persons_percentage: number;
  created_at: Date;
  updated_at: Date;
}

// Obtener toda la distribución étnica
export const getEthnicDistribution = async (req: Request, res: Response) => {
  try {
    const result = await pool.query(`
      SELECT 
        ed.*,
        m.name as municipality_name,
        m.zone as municipality_zone
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      ORDER BY ed.year DESC, m.name ASC
    `);

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching ethnic distribution:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

// Obtener distribución étnica por municipio
export const getEthnicDistributionByMunicipality = async (
  req: Request,
  res: Response
) => {
  const { codDane } = req.params;

  try {
    const result = await pool.query(
      `
      SELECT 
        ed.*,
        m.name as municipality_name,
        m.zone as municipality_zone
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      WHERE ed.municipality_cod_dane = $1
      ORDER BY ed.year DESC
    `,
      [codDane]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        error: "No se encontró distribución étnica para este municipio",
      });
    }

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching ethnic distribution by municipality:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

// Obtener resumen étnico del último año disponible
export const getLatestEthnicSummary = async (req: Request, res: Response) => {
  try {
    const result = await pool.query(`
      WITH latest_year AS (
        SELECT MAX(year) as max_year
        FROM municipality_ethnic_distribution
      )
      SELECT 
        ed.*,
        m.name as municipality_name,
        m.zone as municipality_zone,
        m.lat,
        m.lon,
        m.geometry
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      JOIN latest_year ly ON ed.year = ly.max_year
      ORDER BY m.name ASC
    `);

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching latest ethnic summary:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

// Obtener resumen total por etnia
export const getTotalEthnicSummary = async (req: Request, res: Response) => {
  try {
    const result = await pool.query(`
      WITH latest_year AS (
        SELECT MAX(year) as max_year
        FROM municipality_ethnic_distribution
      )
      SELECT 
        race_code,
        SUM(persons_count) as total_persons,
        ROUND(AVG(persons_percentage), 2) as average_percentage,
        COUNT(DISTINCT municipality_cod_dane) as municipalities_count
      FROM municipality_ethnic_distribution
      WHERE year = (SELECT max_year FROM latest_year)
      GROUP BY race_code
      ORDER BY total_persons DESC
    `);

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching total ethnic summary:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

// Obtener distribución étnica por año
export const getEthnicDistributionByYear = async (
  req: Request,
  res: Response
) => {
  try {
    const result = await pool.query(`
      SELECT 
        year,
        race_code,
        SUM(persons_count) as total_persons,
        ROUND(AVG(persons_percentage), 2) as average_percentage
      FROM municipality_ethnic_distribution
      GROUP BY year, race_code
      ORDER BY year DESC, total_persons DESC
    `);

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching ethnic distribution by year:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

// Obtener estadísticas generales de distribución étnica
export const getEthnicStats = async (req: Request, res: Response) => {
  try {
    const result = await pool.query(`
      WITH latest_year AS (
        SELECT MAX(year) as max_year
        FROM municipality_ethnic_distribution
      ),
      stats AS (
        SELECT
          race_code,
          COUNT(DISTINCT municipality_cod_dane) as municipalities_count,
          MIN(persons_percentage) as min_percentage,
          MAX(persons_percentage) as max_percentage,
          ROUND(AVG(persons_percentage), 2) as avg_percentage,
          SUM(persons_count) as total_population
        FROM municipality_ethnic_distribution
        WHERE year = (SELECT max_year FROM latest_year)
        GROUP BY race_code
      )
      SELECT 
        s.*,
        ly.max_year as reference_year
      FROM stats s, latest_year ly
      ORDER BY s.total_population DESC
    `);

    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching ethnic statistics:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};
