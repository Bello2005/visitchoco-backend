"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAnimalsByMunicipality = exports.getAnimals = void 0;
const animalRepository_1 = require("../../repositories/animalRepository");
const getAnimals = async (_req, res) => {
    try {
        const rows = await animalRepository_1.animalRepository.findAll();
        res.json(rows);
    }
    catch (error) {
        console.error("[animals] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
};
exports.getAnimals = getAnimals;
const getAnimalsByMunicipality = async (req, res) => {
    const municipalityId = Number(req.params.municipalityId);
    if (isNaN(municipalityId)) {
        return res.status(400).json({ success: false, message: "ID de municipio inválido" });
    }
    try {
        const rows = await animalRepository_1.animalRepository.findByMunicipality(municipalityId);
        res.json(rows);
    }
    catch (error) {
        console.error("[animals] Error fetching by municipality:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
};
exports.getAnimalsByMunicipality = getAnimalsByMunicipality;
