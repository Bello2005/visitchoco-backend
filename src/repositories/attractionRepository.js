"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.attractionRepository = void 0;
const db_1 = require("../config/db");
exports.attractionRepository = {
    findAll: async () => {
        const result = await db_1.default.query(`
      SELECT a.*, m.name AS municipality_name
      FROM attractions a
      LEFT JOIN municipalities m ON m.id = a.municipality_id
      ORDER BY a.name ASC
    `);
        return result.rows;
    },
    findByMunicipality: async (municipalityId) => {
        const result = await db_1.default.query(`
      SELECT a.*, m.name AS municipality_name
      FROM attractions a
      LEFT JOIN municipalities m ON m.id = a.municipality_id
      WHERE a.municipality_id = $1
      ORDER BY a.name ASC
      `, [municipalityId]);
        return result.rows;
    },
};
