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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.weatherService = exports.WeatherService = void 0;
const axios_1 = __importDefault(require("axios"));
const weather_1 = require("../config/weather");
class WeatherService {
    constructor() { }
    static getInstance() {
        if (!WeatherService.instance) {
            WeatherService.instance = new WeatherService();
        }
        return WeatherService.instance;
    }
    getCurrentWeather(lat, lon) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const response = yield axios_1.default.get(`${weather_1.OPENWEATHER_BASE_URL}/weather`, {
                    params: Object.assign({ lat,
                        lon, appid: weather_1.OPENWEATHER_API_KEY }, weather_1.DEFAULT_WEATHER_PARAMS),
                });
                const { data } = response;
                return {
                    temp: data.main.temp,
                    feels_like: data.main.feels_like,
                    temp_min: data.main.temp_min,
                    temp_max: data.main.temp_max,
                    humidity: data.main.humidity,
                    description: data.weather[0].description,
                    icon: data.weather[0].icon,
                    wind_speed: data.wind.speed,
                };
            }
            catch (error) {
                console.error("Error fetching weather data:", error);
                throw new Error("Error al obtener datos del clima");
            }
        });
    }
}
exports.WeatherService = WeatherService;
exports.weatherService = WeatherService.getInstance();
