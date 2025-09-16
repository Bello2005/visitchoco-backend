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
exports.getCurrentWeather = void 0;
const index_1 = require("../../services/weatherService/index");
const getCurrentWeather = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { lat, lon } = req.query;
        if (!lat || !lon) {
            return res.status(400).json({
                error: "Se requieren las coordenadas (lat, lon) para obtener el clima",
            });
        }
        const weatherData = yield index_1.weatherService.getCurrentWeather(parseFloat(lat), parseFloat(lon));
        res.json(weatherData);
    }
    catch (error) {
        console.error("Error in weather controller:", error);
        res.status(500).json({
            error: "Error al obtener datos del clima",
        });
    }
});
exports.getCurrentWeather = getCurrentWeather;
