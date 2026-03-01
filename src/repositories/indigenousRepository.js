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
exports.indigenousRepository = void 0;
const db_1 = __importDefault(require("../config/db"));
const SELECT_FIELDS = `
  id, name,
  administrative_act_type, administrative_act_number, administrative_act_date,
  total_area, plan_number, indigenous_people,
  cod_dane, department_code, municipality_code, lat, lon,
  ST_AsGeoJSON(territory_geom)::json AS territory_geom
`;
exports.indigenousRepository = {
    findAll: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`SELECT ${SELECT_FIELDS} FROM indigenous_reserves`);
        return result.rows;
    }),
    findById: (id) => __awaiter(void 0, void 0, void 0, function* () {
        var _a;
        const result = yield db_1.default.query(`SELECT ${SELECT_FIELDS} FROM indigenous_reserves WHERE id = $1`, [id]);
        return (_a = result.rows[0]) !== null && _a !== void 0 ? _a : null;
    }),
    findByMunicipality: (codDane) => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`SELECT ${SELECT_FIELDS} FROM indigenous_reserves WHERE cod_dane = $1`, [codDane]);
        return result.rows;
    }),
};
