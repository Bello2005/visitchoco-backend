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
const weather_1 = require("../../config/weather");
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
            var _a, _b, _c, _d, _e, _f, _g, _h, _j;
            try {
                const response = yield axios_1.default.get(`${weather_1.OPENWEATHER_BASE_URL}/weather`, {
                    params: Object.assign({ lat,
                        lon, appid: weather_1.OPENWEATHER_API_KEY }, weather_1.DEFAULT_WEATHER_PARAMS),
                });
                const data = response.data;
                console.log("Respuesta OpenWeatherMap:", JSON.stringify(data, null, 2));
                // Validar que los datos críticos existen
                if (!data ||
                    !data.main ||
                    !Array.isArray(data.weather) ||
                    !data.weather[0]) {
                    console.error("Respuesta inválida de OpenWeatherMap", data);
                    return { error: "Datos de clima no disponibles" };
                }
                return {
                    main: {
                        temp: Math.round(data.main.temp),
                        feels_like: Math.round(data.main.feels_like),
                        humidity: data.main.humidity,
                        pressure: data.main.pressure,
                        temp_min: Math.round(data.main.temp_min),
                        temp_max: Math.round(data.main.temp_max),
                    },
                    weather: data.weather.map((w) => {
                        var _a, _b, _c;
                        return ({
                            id: (_a = w.id) !== null && _a !== void 0 ? _a : null,
                            main: (_b = w.main) !== null && _b !== void 0 ? _b : "",
                            description: w.description
                                ? w.description.charAt(0).toUpperCase() + w.description.slice(1)
                                : "",
                            icon: (_c = w.icon) !== null && _c !== void 0 ? _c : "",
                        });
                    }),
                    wind: {
                        speed: ((_a = data.wind) === null || _a === void 0 ? void 0 : _a.speed) ? Number(data.wind.speed.toFixed(1)) : null,
                        deg: (_c = (_b = data.wind) === null || _b === void 0 ? void 0 : _b.deg) !== null && _c !== void 0 ? _c : null,
                    },
                    name: (_d = data.name) !== null && _d !== void 0 ? _d : "",
                    visibility: (_e = data.visibility) !== null && _e !== void 0 ? _e : null,
                    uvi: (_f = data.uvi) !== null && _f !== void 0 ? _f : null, // uvi solo está en la API OneCall, pero lo dejamos por compatibilidad
                    dt: (_g = data.dt) !== null && _g !== void 0 ? _g : null,
                    timezone: (_h = data.timezone) !== null && _h !== void 0 ? _h : null,
                };
            }
            catch (error) {
                console.error("Error fetching weather data:", error === null || error === void 0 ? void 0 : error.message, (_j = error === null || error === void 0 ? void 0 : error.response) === null || _j === void 0 ? void 0 : _j.data);
                return { error: "Error al obtener datos del clima" };
            }
        });
    }
}
exports.WeatherService = WeatherService;
exports.weatherService = WeatherService.getInstance();
