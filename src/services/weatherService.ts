import axios from "axios";
import {
  OPENWEATHER_API_KEY,
  OPENWEATHER_BASE_URL,
  DEFAULT_WEATHER_PARAMS,
} from "../config/weather";

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
  };
  weather: Array<{
    description: string;
    icon: string;
  }>;
  wind: {
    speed: number;
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

  async getCurrentWeather(lat: number, lon: number): Promise<WeatherData> {
    try {
      const response = await axios.get(`${OPENWEATHER_BASE_URL}/weather`, {
        params: {
          lat,
          lon,
          appid: OPENWEATHER_API_KEY,
          ...DEFAULT_WEATHER_PARAMS,
        },
      });

      const { data } = response as { data: OpenWeatherResponse };

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
    } catch (error) {
      console.error("Error fetching weather data:", error);
      throw new Error("Error al obtener datos del clima");
    }
  }
}

export const weatherService = WeatherService.getInstance();
