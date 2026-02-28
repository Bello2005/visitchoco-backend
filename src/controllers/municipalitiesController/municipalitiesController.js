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
Object.defineProperty(exports, "__esModule", { value: true });
exports.getMunicipalityBySlug = exports.getMunicipalities = void 0;
const municipalityRepository_1 = require("../../repositories/municipalityRepository");
const getMunicipalities = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield municipalityRepository_1.municipalityRepository.findAll();
        const municipalities = rows.map((m) => (Object.assign(Object.assign({}, m), { coordinates: [m.lat, m.lon] })));
        res.json(municipalities);
    }
    catch (error) {
        console.error("[municipalities] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getMunicipalities = getMunicipalities;
const getMunicipalityBySlug = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const slug = req.params.slug;
    if (!slug) {
        return res.status(400).json({ success: false, message: "Se requiere un slug válido" });
    }
    try {
        const row = yield municipalityRepository_1.municipalityRepository.findBySlug(slug);
        if (!row) {
            return res.status(404).json({ success: false, message: "Municipio no encontrado" });
        }
        res.json(Object.assign(Object.assign({}, row), { coordinates: [row.lat, row.lon] }));
    }
    catch (error) {
        console.error("[municipalities] Error fetching by slug:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getMunicipalityBySlug = getMunicipalityBySlug;
