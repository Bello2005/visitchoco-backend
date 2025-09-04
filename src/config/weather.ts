export const OPENWEATHER_API_KEY = "b5acb68797f4414ff99923e999eb109b";
export const OPENWEATHER_BASE_URL = "https://api.openweathermap.org/data/2.5";

// Parámetros por defecto para las peticiones a OpenWeather
export const DEFAULT_WEATHER_PARAMS = {
  units: "metric", // Para obtener temperaturas en Celsius
  lang: "es", // Para obtener descripciones en español
  exclude: "minutely,hourly,daily", // Solo necesitamos datos actuales
  mode: "json", // Formato de respuesta
};
