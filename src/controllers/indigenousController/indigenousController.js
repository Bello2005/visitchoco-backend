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
exports.getIndigenousReservesByMunicipality = exports.getIndigenousReserveById = exports.getIndigenousReserves = void 0;
const indigenousRepository_1 = require("../../repositories/indigenousRepository");
const geojsonUtils_1 = require("../../utils/geojsonUtils");
const getIndigenousReserves = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield indigenousRepository_1.indigenousRepository.findAll();
        res.json(rows.map(geojsonUtils_1.transformToGeoJSON).filter(Boolean));
    }
    catch (error) {
        console.error("[indigenous] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getIndigenousReserves = getIndigenousReserves;
const getIndigenousReserveById = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = parseInt(req.params.id, 10);
    if (isNaN(id)) {
        return res.status(400).json({ success: false, message: "ID inválido" });
    }
    try {
        const row = yield indigenousRepository_1.indigenousRepository.findById(id);
        if (!row) {
            return res.status(404).json({ success: false, message: "Reserva indígena no encontrada" });
        }
        const transformed = (0, geojsonUtils_1.transformToGeoJSON)(row);
        if (!transformed) {
            return res.status(500).json({ success: false, message: "Error al procesar la geometría" });
        }
        res.json(transformed);
    }
    catch (error) {
        console.error("[indigenous] Error fetching by id:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getIndigenousReserveById = getIndigenousReserveById;
const getIndigenousReservesByMunicipality = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const codDane = req.params.codDane;
    if (!codDane) {
        return res.status(400).json({ success: false, message: "Se requiere el código DANE" });
    }
    try {
        const rows = yield indigenousRepository_1.indigenousRepository.findByMunicipality(codDane);
        res.json(rows.map(geojsonUtils_1.transformToGeoJSON).filter(Boolean));
    }
    catch (error) {
        console.error("[indigenous] Error fetching by municipality:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getIndigenousReservesByMunicipality = getIndigenousReservesByMunicipality;
