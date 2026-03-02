"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const animalController_1 = require("../../controllers/animalController/animalController");
const router = (0, express_1.Router)();
router.get("/", animalController_1.getAnimals);
router.get("/municipality/:municipalityId", animalController_1.getAnimalsByMunicipality);
exports.default = router;
