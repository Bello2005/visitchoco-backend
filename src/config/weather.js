"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEFAULT_WEATHER_PARAMS = exports.OPENWEATHER_BASE_URL = exports.OPENWEATHER_API_KEY = void 0;
exports.OPENWEATHER_API_KEY = "b5acb68797f4414ff99923e999eb109b";
exports.OPENWEATHER_BASE_URL = "https://api.openweathermap.org/data/2.5";
// Parámetros por defecto para las peticiones a OpenWeather
exports.DEFAULT_WEATHER_PARAMS = {
    units: "metric", // Para obtener temperaturas en Celsius
    lang: "es", // Para obtener descripciones en español
    exclude: "minutely,hourly,daily", // Solo necesitamos datos actuales
    mode: "json", // Formato de respuesta
};
