"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getFestivalsByMunicipality = exports.getFestivals = void 0;
const festivalRepository_1 = require("../../repositories/festivalRepository");
const getFestivals = async (_req, res) => {
    try {
        const rows = await festivalRepository_1.festivalRepository.findAll();
        res.json(rows);
    }
    catch (error) {
        console.error("[festivals] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
};
exports.getFestivals = getFestivals;
const getFestivalsByMunicipality = async (req, res) => {
    const municipalityId = Number(req.params.municipalityId);
    if (isNaN(municipalityId)) {
        return res.status(400).json({ success: false, message: "ID de municipio inválido" });
    }
    try {
        const rows = await festivalRepository_1.festivalRepository.findByMunicipality(municipalityId);
        res.json(rows);
    }
    catch (error) {
        console.error("[festivals] Error fetching by municipality:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
};
exports.getFestivalsByMunicipality = getFestivalsByMunicipality;
