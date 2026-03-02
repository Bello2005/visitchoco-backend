"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAttractionsByMunicipality = exports.getAttractions = void 0;
const attractionRepository_1 = require("../../repositories/attractionRepository");
const getAttractions = async (_req, res) => {
    try {
        const rows = await attractionRepository_1.attractionRepository.findAll();
        res.json(rows);
    }
    catch (error) {
        console.error("[attractions] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
};
exports.getAttractions = getAttractions;
const getAttractionsByMunicipality = async (req, res) => {
    const municipalityId = Number(req.params.municipalityId);
    if (isNaN(municipalityId)) {
        return res.status(400).json({ success: false, message: "ID de municipio inválido" });
    }
    try {
        const rows = await attractionRepository_1.attractionRepository.findByMunicipality(municipalityId);
        res.json(rows);
    }
    catch (error) {
        console.error("[attractions] Error fetching by municipality:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
};
exports.getAttractionsByMunicipality = getAttractionsByMunicipality;
