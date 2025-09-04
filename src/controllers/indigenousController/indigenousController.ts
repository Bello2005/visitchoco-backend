import { Request, Response } from "express";
import pool from "../../config/db";
import { transformToGeoJSON } from "../../utils/geojsonUtils";

// Obtener reservas indígenas por municipio
export const getIndigenousReservesByMunicipality = async (
  req: Request,
  res: Response
) => {
  const { codDane } = req.params;
  try {
    const query = `
      SELECT 
        id,
        name,
        administrative_act_type,
        administrative_act_number,
        administrative_act_date,
        total_area,
        plan_number,
        indigenous_people,
        cod_dane,
        lat,
        lon,
        ST_AsGeoJSON(territory_geom)::json as territory_geom
      FROM indigenous_reserves
      WHERE cod_dane = $1
    `;
    const result = await pool.query(query, [codDane]);
    const transformedRows = result.rows.map(transformToGeoJSON).filter(Boolean);
    res.json(transformedRows);
  } catch (error) {
    console.error("Error al obtener reservas indígenas por municipio:", error);
    res.status(500).json({ message: "Error interno del servidor" });
  }
};

// Obtener todas las reservas indígenas
export const getIndigenousReserves = async (req: Request, res: Response) => {
  try {
    const query = `
      SELECT 
        id,
        name,
        administrative_act_type,
        administrative_act_number,
        administrative_act_date,
        total_area,
        plan_number,
        indigenous_people,
        cod_dane,
        lat,
        lon,
        ST_AsGeoJSON(territory_geom)::json as territory_geom
      FROM indigenous_reserves
    `;
    const result = await pool.query(query);
    const transformedRows = result.rows.map(transformToGeoJSON).filter(Boolean);
    res.json(transformedRows);
  } catch (error) {
    console.error("Error al obtener reservas indígenas:", error);
    res.status(500).json({ message: "Error interno del servidor" });
  }
};

// Obtener una reserva indígena por ID
export const getIndigenousReserveById = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const query = `
      SELECT 
        id,
        name,
        administrative_act_type,
        administrative_act_number,
        administrative_act_date,
        total_area,
        plan_number,
        indigenous_people,
        cod_dane,
        lat,
        lon,
        ST_AsGeoJSON(territory_geom)::json as territory_geom
      FROM indigenous_reserves
      WHERE id = $1
    `;
    const result = await pool.query(query, [id]);

    if (result.rows.length === 0) {
      return res
        .status(404)
        .json({ message: "Reserva indígena no encontrada" });
    }

    const transformedRow = transformToGeoJSON(result.rows[0]);
    if (!transformedRow) {
      return res
        .status(500)
        .json({ message: "Error al procesar la geometría" });
    }

    res.json(transformedRow);
  } catch (error) {
    console.error("Error al obtener la reserva indígena:", error);
    res.status(500).json({ message: "Error interno del servidor" });
  }
};
