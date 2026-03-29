"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const patrimonioController_1 = require("../../controllers/patrimonioController/patrimonioController");
const router = (0, express_1.Router)();
router.get("/inmaterial", patrimonioController_1.getPatrimonioInmaterial);
router.get("/inmaterial/:municipio", patrimonioController_1.getPatrimonioByMunicipio);
exports.default = router;
