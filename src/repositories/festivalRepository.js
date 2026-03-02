"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.festivalRepository = void 0;
const db_1 = require("../config/db");
exports.festivalRepository = {
    findAll: async () => {
        const result = await db_1.default.query(`
      SELECT f.*, m.name AS municipality_name
      FROM festivals f
      LEFT JOIN municipalities m ON m.id = f.municipality_id
      ORDER BY f.start_date ASC
    `);
        return result.rows;
    },
    findByMunicipality: async (municipalityId) => {
        const result = await db_1.default.query(`
      SELECT f.*, m.name AS municipality_name
      FROM festivals f
      LEFT JOIN municipalities m ON m.id = f.municipality_id
      WHERE f.municipality_id = $1
      ORDER BY f.start_date ASC
      `, [municipalityId]);
        return result.rows;
    },
};
