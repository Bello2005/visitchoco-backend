import { Router } from "express";
import { getCurrentWeather } from "../../controllers/weatherController/weatherController";

const router = Router();

// Ruta para obtener el clima actual
router.get("/current", getCurrentWeather);

export default router;
