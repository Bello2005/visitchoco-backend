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
exports.getEthnicStats = exports.getEthnicDistributionByYear = exports.getTotalEthnicSummary = exports.getLatestEthnicSummary = exports.getEthnicDistributionByMunicipality = exports.getEthnicDistribution = void 0;
const ethnicRepository_1 = require("../../repositories/ethnicRepository");
const getEthnicDistribution = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield ethnicRepository_1.ethnicRepository.findAll();
        res.json(rows);
    }
    catch (error) {
        console.error("[ethnic] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getEthnicDistribution = getEthnicDistribution;
const getEthnicDistributionByMunicipality = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const codDane = req.params.codDane;
    try {
        const rows = yield ethnicRepository_1.ethnicRepository.findByMunicipality(codDane);
        if (rows.length === 0) {
            return res.status(404).json({
                success: false,
                message: "No se encontró distribución étnica para este municipio",
            });
        }
        res.json(rows);
    }
    catch (error) {
        console.error("[ethnic] Error fetching by municipality:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getEthnicDistributionByMunicipality = getEthnicDistributionByMunicipality;
const getLatestEthnicSummary = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield ethnicRepository_1.ethnicRepository.findLatestSummary();
        res.json(rows);
    }
    catch (error) {
        console.error("[ethnic] Error fetching latest summary:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getLatestEthnicSummary = getLatestEthnicSummary;
const getTotalEthnicSummary = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield ethnicRepository_1.ethnicRepository.findTotalSummary();
        res.json(rows);
    }
    catch (error) {
        console.error("[ethnic] Error fetching total summary:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getTotalEthnicSummary = getTotalEthnicSummary;
const getEthnicDistributionByYear = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield ethnicRepository_1.ethnicRepository.findByYear();
        res.json(rows);
    }
    catch (error) {
        console.error("[ethnic] Error fetching by year:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getEthnicDistributionByYear = getEthnicDistributionByYear;
const getEthnicStats = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield ethnicRepository_1.ethnicRepository.findStats();
        res.json(rows);
    }
    catch (error) {
        console.error("[ethnic] Error fetching stats:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getEthnicStats = getEthnicStats;
