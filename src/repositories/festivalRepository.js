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
exports.festivalRepository = void 0;
const db_1 = __importDefault(require("../config/db"));
exports.festivalRepository = {
    findAll: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      SELECT f.*, m.name AS municipality_name
      FROM festivals f
      LEFT JOIN municipalities m ON m.id = f.municipality_id
      ORDER BY f.start_date ASC
    `);
        return result.rows;
    }),
    findByMunicipality: (municipalityId) => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      SELECT f.*, m.name AS municipality_name
      FROM festivals f
      LEFT JOIN municipalities m ON m.id = f.municipality_id
      WHERE f.municipality_id = $1
      ORDER BY f.start_date ASC
      `, [municipalityId]);
        return result.rows;
    }),
};
