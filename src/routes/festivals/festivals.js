"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const festivalController_1 = require("../../controllers/festivalController/festivalController");
const router = (0, express_1.Router)();
router.get("/", festivalController_1.getFestivals);
router.get("/municipality/:municipalityId", festivalController_1.getFestivalsByMunicipality);
exports.default = router;
