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
exports.getMunicipalityBySlug = exports.getMunicipalities = void 0;
const db_1 = __importDefault(require("../../config/db"));
const getMunicipalities = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        console.log("=== PETICIÓN GET ALL MUNICIPALITIES ===");
        console.log("URL:", req.url);
        console.log("Method:", req.method);
        const result = yield db_1.default.query(`
      SELECT 
        id,
        name,
        description,
        image_url,
        audio_url,
        lat,
        lon,
        slug,
        emoji,
        zone,
        main_activity,
        attractions::jsonb,
        transportation::jsonb,
        weather::jsonb,
        ST_AsGeoJSON(territory_geom)::jsonb as geometry,
        cod_dane,
        created_at,
        updated_at
      FROM municipalities
      ORDER BY name ASC
    `);
        const municipalities = result.rows.map((municipality) => (Object.assign(Object.assign({}, municipality), { coordinates: [municipality.lat, municipality.lon] })));
        res.json(municipalities);
    }
    catch (error) {
        console.error("Error fetching municipalities:", error);
        res.status(500).json({ error: "Internal server error" });
    }
});
exports.getMunicipalities = getMunicipalities;
const getMunicipalityBySlug = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { slug } = req.params;
        console.log("=== INICIO DE BÚSQUEDA ===");
        console.log("Parámetros recibidos:", req.params);
        console.log("Buscando municipio con slug:", slug);
        if (!slug) {
            console.error("Error: No se proporcionó un slug");
            return res.status(400).json({ error: "Se requiere un slug válido" });
        }
        const result = yield db_1.default.query(`
      SELECT 
        id,
        name,
        description,
        image_url,
        audio_url,
        lat,
        lon,
        slug,
        emoji,
        zone,
        main_activity,
        attractions::jsonb,
        transportation::jsonb,
        weather::jsonb,
        ST_AsGeoJSON(geom)::jsonb as geometry,
        cod_dane,
        created_at,
        updated_at
      FROM municipalities
      WHERE slug = $1
    `, [slug]);
        console.log("Resultado de la consulta:", result.rows[0]);
        if (result.rows.length === 0) {
            return res.status(404).json({ error: "Municipality not found" });
        }
        if (!result.rows[0]) {
            console.log("=== NO SE ENCONTRÓ EL MUNICIPIO ===");
            console.log("Slug buscado:", slug);
            return res.status(404).json({ error: "Municipio no encontrado" });
        }
        console.log("=== DATOS CRUDOS DE LA BASE DE DATOS ===");
        console.log(JSON.stringify(result.rows[0], null, 2));
        const municipality = Object.assign(Object.assign({}, result.rows[0]), { coordinates: [result.rows[0].lat, result.rows[0].lon] });
        console.log("=== DATOS TRANSFORMADOS DEL MUNICIPIO ===");
        console.log(JSON.stringify({
            name: municipality.name,
            zone: municipality.zone,
            attractions: municipality.attractions,
            transportation: municipality.transportation,
            weather: municipality.weather,
            coordinates: municipality.coordinates,
        }, null, 2));
        res.json(municipality);
    }
    catch (error) {
        console.error("=== ERROR EN LA BÚSQUEDA ===");
        console.error("Slug que causó el error:", req.params.slug);
        console.error("Error completo:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
});
exports.getMunicipalityBySlug = getMunicipalityBySlug;
