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
exports.getEthnicStats = exports.getEthnicDistributionByYear = exports.getTotalEthnicSummary = exports.getLatestEthnicSummary = exports.getEthnicDistributionByMunicipality = exports.getEthnicDistribution = void 0;
const db_1 = __importDefault(require("../../config/db"));
// Obtener toda la distribución étnica
const getEthnicDistribution = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield db_1.default.query(`
      SELECT 
        ed.*,
        m.name as municipality_name,
        m.zone as municipality_zone
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      ORDER BY ed.year DESC, m.name ASC
    `);
        res.json(result.rows);
    }
    catch (error) {
        console.error("Error fetching ethnic distribution:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getEthnicDistribution = getEthnicDistribution;
// Obtener distribución étnica por municipio
const getEthnicDistributionByMunicipality = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { codDane } = req.params;
    try {
        const result = yield db_1.default.query(`
      SELECT 
        ed.*,
        m.name as municipality_name,
        m.zone as municipality_zone
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      WHERE ed.municipality_cod_dane = $1
      ORDER BY ed.year DESC
    `, [codDane]);
        if (result.rows.length === 0) {
            return res.status(404).json({
                error: "No se encontró distribución étnica para este municipio",
            });
        }
        res.json(result.rows);
    }
    catch (error) {
        console.error("Error fetching ethnic distribution by municipality:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getEthnicDistributionByMunicipality = getEthnicDistributionByMunicipality;
// Obtener resumen étnico del último año disponible
const getLatestEthnicSummary = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield db_1.default.query(`
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
    }
    catch (error) {
        console.error("Error fetching latest ethnic summary:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getLatestEthnicSummary = getLatestEthnicSummary;
// Obtener resumen total por etnia
const getTotalEthnicSummary = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield db_1.default.query(`
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
    }
    catch (error) {
        console.error("Error fetching total ethnic summary:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getTotalEthnicSummary = getTotalEthnicSummary;
// Obtener distribución étnica por año
const getEthnicDistributionByYear = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield db_1.default.query(`
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
    }
    catch (error) {
        console.error("Error fetching ethnic distribution by year:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getEthnicDistributionByYear = getEthnicDistributionByYear;
// Obtener estadísticas generales de distribución étnica
const getEthnicStats = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield db_1.default.query(`
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
    }
    catch (error) {
        console.error("Error fetching ethnic statistics:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getEthnicStats = getEthnicStats;
