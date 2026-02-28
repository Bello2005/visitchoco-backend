"use strict";
var _a;
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEFAULT_WEATHER_PARAMS = exports.OPENWEATHER_BASE_URL = exports.OPENWEATHER_API_KEY = void 0;
exports.OPENWEATHER_API_KEY = (_a = process.env.WEATHER_API_KEY) !== null && _a !== void 0 ? _a : "";
if (!exports.OPENWEATHER_API_KEY) {
    console.warn("[WEATHER] WEATHER_API_KEY no está definida en las variables de entorno");
}
exports.OPENWEATHER_BASE_URL = "https://api.openweathermap.org/data/2.5";
// Parámetros por defecto para las peticiones a OpenWeather
exports.DEFAULT_WEATHER_PARAMS = {
    units: "metric", // Para obtener temperaturas en Celsius
    lang: "es", // Para obtener descripciones en español
    exclude: "minutely,hourly,daily", // Solo necesitamos datos actuales
    mode: "json", // Formato de respuesta
};
