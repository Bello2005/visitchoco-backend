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
exports.municipalityRepository = void 0;
const db_1 = __importDefault(require("../config/db"));
exports.municipalityRepository = {
    findAll: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query(`
      SELECT
        id, name, description, image_url, audio_url,
        lat, lon, slug, emoji, zone, main_activity,
        attractions::jsonb, transportation::jsonb, weather::jsonb,
        ST_AsGeoJSON(territory_geom)::jsonb AS geometry,
        cod_dane, created_at, updated_at
      FROM municipalities
      ORDER BY name ASC
    `);
        return result.rows;
    }),
    findBySlug: (slug) => __awaiter(void 0, void 0, void 0, function* () {
        var _a;
        const result = yield db_1.default.query(`
      SELECT
        id, name, description, image_url, audio_url,
        lat, lon, slug, emoji, zone, main_activity,
        attractions::jsonb, transportation::jsonb, weather::jsonb,
        ST_AsGeoJSON(geom)::jsonb AS geometry,
        cod_dane, created_at, updated_at
      FROM municipalities
      WHERE slug = $1
      `, [slug]);
        return (_a = result.rows[0]) !== null && _a !== void 0 ? _a : null;
    }),
};
