import axios from "axios";
import {
  OPENWEATHER_API_KEY,
  OPENWEATHER_BASE_URL,
  DEFAULT_WEATHER_PARAMS,
} from "../../config/weather";

interface WeatherData {
  temp: number;
  feels_like: number;
  temp_min: number;
  temp_max: number;
  humidity: number;
  description: string;
  icon: string;
  wind_speed: number;
}

interface OpenWeatherResponse {
  main: {
    temp: number;
    feels_like: number;
    temp_min: number;
    temp_max: number;
    humidity: number;
    pressure: number;
  };
  weather: Array<{
    id?: number;
    main?: string;
    description: string;
    icon: string;
  }>;
  wind: {
    speed: number;
    deg?: number;
  };
}

export class WeatherService {
  private static instance: WeatherService;

  private constructor() {}

  public static getInstance(): WeatherService {
    if (!WeatherService.instance) {
      WeatherService.instance = new WeatherService();
    }
    return WeatherService.instance;
  }

  async getCurrentWeather(lat: number, lon: number): Promise<any> {
    try {
      const response = await axios.get<
        OpenWeatherResponse & { [key: string]: any }
      >(`${OPENWEATHER_BASE_URL}/weather`, {
        params: {
          lat,
          lon,
          appid: OPENWEATHER_API_KEY,
          ...DEFAULT_WEATHER_PARAMS,
        },
      });

      const data = response.data;
      console.log("Respuesta OpenWeatherMap:", JSON.stringify(data, null, 2));

      // Validar que los datos críticos existen
      if (
        !data ||
        !data.main ||
        !Array.isArray(data.weather) ||
        !data.weather[0]
      ) {
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
        weather: data.weather.map((w: any) => ({
          id: w.id ?? null,
          main: w.main ?? "",
          description: w.description
            ? w.description.charAt(0).toUpperCase() + w.description.slice(1)
            : "",
          icon: w.icon ?? "",
        })),
        wind: {
          speed: data.wind?.speed ? Number(data.wind.speed.toFixed(1)) : null,
          deg: data.wind?.deg ?? null,
        },
        name: data.name ?? "",
        visibility: data.visibility ?? null,
        uvi: data.uvi ?? null, // uvi solo está en la API OneCall, pero lo dejamos por compatibilidad
        dt: data.dt ?? null,
        timezone: data.timezone ?? null,
      };
    } catch (error: any) {
      console.error(
        "Error fetching weather data:",
        error?.message,
        error?.response?.data
      );
      return { error: "Error al obtener datos del clima" };
    }
  }
}

export const weatherService = WeatherService.getInstance();
