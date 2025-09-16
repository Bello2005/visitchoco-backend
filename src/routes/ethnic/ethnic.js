"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const ethnicDistributionController_1 = require("../../controllers/ethnicDistributionController/ethnicDistributionController");
const router = (0, express_1.Router)();
// Rutas para la distribución étnica
router.get("/", ethnicDistributionController_1.getEthnicDistribution);
router.get("/latest", ethnicDistributionController_1.getLatestEthnicSummary);
router.get("/summary/total", ethnicDistributionController_1.getTotalEthnicSummary);
router.get("/summary/by-year", ethnicDistributionController_1.getEthnicDistributionByYear);
router.get("/stats", ethnicDistributionController_1.getEthnicStats);
router.get("/:codDane", ethnicDistributionController_1.getEthnicDistributionByMunicipality);
exports.default = router;
