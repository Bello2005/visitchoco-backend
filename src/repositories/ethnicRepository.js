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
exports.ethnicRepository = void 0;
const db_1 = __importDefault(require("../config/db"));
exports.ethnicRepository = {
    findAll: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      SELECT ed.*, m.name AS municipality_name, m.zone AS municipality_zone
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      ORDER BY ed.year DESC, m.name ASC
    `);
        return result.rows;
    }),
    findByMunicipality: (codDane) => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      SELECT ed.*, m.name AS municipality_name, m.zone AS municipality_zone
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      WHERE ed.municipality_cod_dane = $1
      ORDER BY ed.year DESC
      `, [codDane]);
        return result.rows;
    }),
    findLatestSummary: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      WITH latest_year AS (SELECT MAX(year) AS max_year FROM municipality_ethnic_distribution)
      SELECT ed.*, m.name AS municipality_name, m.zone AS municipality_zone, m.lat, m.lon, m.geometry
      FROM municipality_ethnic_distribution ed
      JOIN municipalities m ON m.cod_dane = ed.municipality_cod_dane
      JOIN latest_year ly ON ed.year = ly.max_year
      ORDER BY m.name ASC
    `);
        return result.rows;
    }),
    findTotalSummary: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      WITH latest_year AS (SELECT MAX(year) AS max_year FROM municipality_ethnic_distribution)
      SELECT
        race_code,
        SUM(persons_count) AS total_persons,
        ROUND(AVG(persons_percentage), 2) AS average_percentage,
        COUNT(DISTINCT municipality_cod_dane) AS municipalities_count
      FROM municipality_ethnic_distribution
      WHERE year = (SELECT max_year FROM latest_year)
      GROUP BY race_code
      ORDER BY total_persons DESC
    `);
        return result.rows;
    }),
    findByYear: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      SELECT
        year, race_code,
        SUM(persons_count) AS total_persons,
        ROUND(AVG(persons_percentage), 2) AS average_percentage
      FROM municipality_ethnic_distribution
      GROUP BY year, race_code
      ORDER BY year DESC, total_persons DESC
    `);
        return result.rows;
    }),
    findStats: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      WITH latest_year AS (SELECT MAX(year) AS max_year FROM municipality_ethnic_distribution),
      stats AS (
        SELECT
          race_code,
          COUNT(DISTINCT municipality_cod_dane) AS municipalities_count,
          MIN(persons_percentage) AS min_percentage,
          MAX(persons_percentage) AS max_percentage,
          ROUND(AVG(persons_percentage), 2) AS avg_percentage,
          SUM(persons_count) AS total_population
        FROM municipality_ethnic_distribution
        WHERE year = (SELECT max_year FROM latest_year)
        GROUP BY race_code
      )
      SELECT s.*, ly.max_year AS reference_year
      FROM stats s, latest_year ly
      ORDER BY s.total_population DESC
    `);
        return result.rows;
    }),
};
