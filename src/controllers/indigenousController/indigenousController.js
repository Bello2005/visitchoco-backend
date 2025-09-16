"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getIndigenousReserveById = exports.getIndigenousReserves = exports.getIndigenousReservesByMunicipality = void 0;
const db_1 = __importDefault(require("../../config/db"));
const geojsonUtils_1 = require("../../utils/geojsonUtils");
// Obtener reservas indígenas por municipio
const getIndigenousReservesByMunicipality = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
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
        const result = yield db_1.default.query(query, [codDane]);
        const transformedRows = result.rows.map(geojsonUtils_1.transformToGeoJSON).filter(Boolean);
        res.json(transformedRows);
    }
    catch (error) {
        console.error("Error al obtener reservas indígenas por municipio:", error);
        res.status(500).json({ message: "Error interno del servidor" });
    }
});
exports.getIndigenousReservesByMunicipality = getIndigenousReservesByMunicipality;
// Obtener todas las reservas indígenas
const getIndigenousReserves = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
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
        const result = yield db_1.default.query(query);
        const transformedRows = result.rows.map(geojsonUtils_1.transformToGeoJSON).filter(Boolean);
        res.json(transformedRows);
    }
    catch (error) {
        console.error("Error al obtener reservas indígenas:", error);
        res.status(500).json({ message: "Error interno del servidor" });
    }
});
exports.getIndigenousReserves = getIndigenousReserves;
// Obtener una reserva indígena por ID
const getIndigenousReserveById = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
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
        const result = yield db_1.default.query(query, [id]);
        if (result.rows.length === 0) {
            return res
                .status(404)
                .json({ message: "Reserva indígena no encontrada" });
        }
        const transformedRow = (0, geojsonUtils_1.transformToGeoJSON)(result.rows[0]);
        if (!transformedRow) {
            return res
                .status(500)
                .json({ message: "Error al procesar la geometría" });
        }
        res.json(transformedRow);
    }
    catch (error) {
        console.error("Error al obtener la reserva indígena:", error);
        res.status(500).json({ message: "Error interno del servidor" });
    }
});
exports.getIndigenousReserveById = getIndigenousReserveById;
