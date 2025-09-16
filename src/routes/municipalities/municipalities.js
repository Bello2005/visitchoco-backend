"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const municipalitiesController_1 = require("../../controllers/municipalitiesController/municipalitiesController");
const router = (0, express_1.Router)();
router.get("/", municipalitiesController_1.getMunicipalities);
router.get("/:slug", municipalitiesController_1.getMunicipalityBySlug);
exports.default = router;
