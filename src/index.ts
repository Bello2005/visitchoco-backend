import express, { NextFunction, Request, Response } from "express";
import dotenv from "dotenv";
import swaggerUi from "swagger-ui-express";
import { swaggerSpec } from "./config/swagger";
import { configureCors } from "./config/cors";
import authRoutes from "./routes/auth/auth";
import municipalitiesRoutes from "./routes/municipalities/municipalities";
import indigenousRoutes from "./routes/indigenous/indigenous";
import weatherRoutes from "./routes/weather/weather";
import dashboardRoutes from "./routes/dashboard/dashboard";
import animalsRoutes from "./routes/animals/animals";
import festivalsRoutes from "./routes/festivals/festivals";
import attractionsRoutes from "./routes/attractions/attractions";
import { verifyJWT } from "./middlewares/auth";

dotenv.config();
const app = express();

// CORS centralizado (config/cors.ts)
configureCors(app);

app.use(express.json());

// Documentación Swagger
app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Rutas públicas
app.use("/api/auth", authRoutes);
app.use("/api/municipalities", municipalitiesRoutes);
app.use("/api/indigenous", indigenousRoutes);
app.use("/api/ethnic", require("./routes/ethnic/ethnic").default);
app.use("/api/weather", weatherRoutes);
app.use("/api/animals", animalsRoutes);
app.use("/api/festivals", festivalsRoutes);
app.use("/api/attractions", attractionsRoutes);

// Rutas protegidas (requieren autenticación)
app.use("/api", verifyJWT, dashboardRoutes);

// Root
app.get("/", (_req: Request, res: Response) => {
  res.json({
    name: "visitChoco API",
    version: "1.0.0",
    description: "REST API para la plataforma visitChoco — turismo, biodiversidad y datos demográficos del departamento del Chocó, Colombia.",
    docs: "/api/docs",
    endpoints: [
      "GET  /api/municipalities",
      "GET  /api/municipalities/:slug",
      "GET  /api/indigenous",
      "GET  /api/ethnic",
      "GET  /api/animals",
      "GET  /api/festivals",
      "GET  /api/attractions",
      "GET  /api/weather/:municipalityName",
      "POST /api/auth/login",
      "POST /api/auth/register",
    ],
    status: "ok",
  });
});

// Global error handler (Express 5 compatible — 4 parámetros obligatorios)
// eslint-disable-next-line @typescript-eslint/no-unused-vars
app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  console.error("[ERROR]", err.message);
  res.status(500).json({ success: false, message: "Error interno del servidor" });
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
