import { Request, Response } from "express";
import { weatherService } from "../../services/weatherService/index";

export const getCurrentWeather = async (req: Request, res: Response) => {
  try {
    const { lat, lon } = req.query;

    if (!lat || !lon) {
      return res.status(400).json({
        error: "Se requieren las coordenadas (lat, lon) para obtener el clima",
      });
    }

    const weatherData = await weatherService.getCurrentWeather(
      parseFloat(lat as string),
      parseFloat(lon as string)
    );

    res.json(weatherData);
  } catch (error) {
    console.error("Error in weather controller:", error);
    res.status(500).json({
      error: "Error al obtener datos del clima",
    });
  }
};
