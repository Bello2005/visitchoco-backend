"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const attractionController_1 = require("../../controllers/attractionController/attractionController");
const router = (0, express_1.Router)();
router.get("/", attractionController_1.getAttractions);
router.get("/municipality/:municipalityId", attractionController_1.getAttractionsByMunicipality);
exports.default = router;
