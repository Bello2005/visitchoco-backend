"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const indigenousController_1 = require("../../controllers/indigenousController/indigenousController");
const router = (0, express_1.Router)();
// Rutas para las reservas indígenas
router.get("/", indigenousController_1.getIndigenousReserves);
router.get("/municipality/:codDane", indigenousController_1.getIndigenousReservesByMunicipality);
router.get("/:id", indigenousController_1.getIndigenousReserveById);
exports.default = router;
