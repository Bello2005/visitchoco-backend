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
exports.getPatrimonioByMunicipio = exports.getPatrimonioInmaterial = void 0;
const patrimonioRepository_1 = require("../../repositories/patrimonioRepository");
const getPatrimonioInmaterial = (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const rows = yield patrimonioRepository_1.patrimonioRepository.findAll();
        res.json(rows);
    }
    catch (error) {
        console.error("[patrimonio] Error fetching all:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getPatrimonioInmaterial = getPatrimonioInmaterial;
const getPatrimonioByMunicipio = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const municipio = decodeURIComponent(req.params.municipio);
    if (!municipio) {
        return res.status(400).json({ success: false, message: "Nombre de municipio requerido" });
    }
    try {
        const rows = yield patrimonioRepository_1.patrimonioRepository.findByMunicipio(municipio);
        res.json(rows);
    }
    catch (error) {
        console.error("[patrimonio] Error fetching by municipio:", error);
        res.status(500).json({ success: false, message: "Error interno del servidor" });
    }
});
exports.getPatrimonioByMunicipio = getPatrimonioByMunicipio;
