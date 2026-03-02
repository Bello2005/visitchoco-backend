"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.animalRepository = void 0;
const db_1 = require("../config/db");
exports.animalRepository = {
    findAll: async () => {
        const result = await db_1.default.query(`
      SELECT a.*, m.name AS municipality_name
      FROM animals a
      LEFT JOIN municipalities m ON m.id = a.municipality_id
      ORDER BY a.common_name ASC
    `);
        return result.rows;
    },
    findByMunicipality: async (municipalityId) => {
        const result = await db_1.default.query(`
      SELECT a.*, m.name AS municipality_name
      FROM animals a
      LEFT JOIN municipalities m ON m.id = a.municipality_id
      WHERE a.municipality_id = $1
      ORDER BY a.common_name ASC
      `, [municipalityId]);
        return result.rows;
    },
};
