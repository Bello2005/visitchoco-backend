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

// Rutas protegidas (requieren autenticación)
app.use("/api", verifyJWT, dashboardRoutes);

// Global error handler (Express 5 compatible — 4 parámetros obligatorios)
// eslint-disable-next-line @typescript-eslint/no-unused-vars
app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  console.error("[ERROR]", err.message);
  res.status(500).json({ success: false, message: "Error interno del servidor" });
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
