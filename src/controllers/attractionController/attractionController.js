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
exports.getAttractionsByMunicipality = exports.getAttractions = void 0;
const attractionRepository_1 = require("../../repositories/attractionRepository");
const getAttractions = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield attractionRepository_1.attractionRepository.findAll();
        res.json(rows);
    }
    catch (error) {
        console.error("[attractions] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getAttractions = getAttractions;
const getAttractionsByMunicipality = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const municipalityId = Number(req.params.municipalityId);
    if (isNaN(municipalityId)) {
        return res.status(400).json({ success: false, message: "ID de municipio inválido" });
    }
    try {
        const rows = yield attractionRepository_1.attractionRepository.findByMunicipality(municipalityId);
        res.json(rows);
    }
    catch (error) {
        console.error("[attractions] Error fetching by municipality:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getAttractionsByMunicipality = getAttractionsByMunicipality;
