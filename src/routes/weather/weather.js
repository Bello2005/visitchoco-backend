"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const weatherController_1 = require("../../controllers/weatherController/weatherController");
const router = (0, express_1.Router)();
// Ruta para obtener el clima actual
router.get("/current", weatherController_1.getCurrentWeather);
exports.default = router;
