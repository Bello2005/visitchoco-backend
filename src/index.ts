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
import fiestasRoutes from "./routes/fiestas/fiestas";
import patrimonioRoutes from "./routes/patrimonio/patrimonio";
import ethnicRoutes from "./routes/ethnic/ethnic";
import rntRoutes from "./routes/rnt/rnt";
import populationRoutes from "./routes/population/population";
import establecimientosPublicRoutes from "./routes/establecimientos/establecimientos";
import { verifyJWT } from "./middlewares/auth";
import { publicCache } from "./middlewares/publicCache";
import adminRouter from "./admin/index";

dotenv.config();
const app = express();

// CORS centralizado (config/cors.ts)
configureCors(app);

app.use(express.json());

// Documentación Swagger
app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Rutas públicas
// publicCache: contenido editorial (1 h) y datos casi estáticos (24 h).
// Sin cache en /api/auth, /api/weather, /api/admin, /api/docs, /api/establecimientos.
const CACHE_1H = publicCache(3600, 86400);
const CACHE_24H = publicCache(86400, 86400);

app.use("/api/auth", authRoutes);
app.use("/api/municipalities", CACHE_1H, municipalitiesRoutes);
app.use("/api/indigenous", CACHE_24H, indigenousRoutes);
app.use("/api/ethnic", CACHE_24H, ethnicRoutes);
app.use("/api/weather", weatherRoutes);
app.use("/api/animals", CACHE_1H, animalsRoutes);
app.use("/api/festivals", CACHE_1H, festivalsRoutes);
app.use("/api/attractions", CACHE_1H, attractionsRoutes);
app.use("/api/fiestas", CACHE_1H, fiestasRoutes);
app.use("/api/patrimonio", CACHE_1H, patrimonioRoutes);
app.use("/api/rnt", CACHE_1H, rntRoutes);
app.use("/api/population", CACHE_24H, populationRoutes);
app.use("/api/establecimientos", establecimientosPublicRoutes);

// Panel de administración (DEBE ir antes del verifyJWT global)
app.use("/api/admin", adminRouter);

// Rutas protegidas del frontend público
app.use("/api", verifyJWT, dashboardRoutes);

// Root
app.get("/", (_req: Request, res: Response) => {
  res.setHeader("Content-Type", "text/html; charset=utf-8");
  res.send(`<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>visitChoco API</title>
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:#0f172a;color:#e2e8f0;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:2rem}
    .card{background:#1e293b;border:1px solid #334155;border-radius:1rem;padding:2.5rem;max-width:640px;width:100%;box-shadow:0 25px 50px rgba(0,0,0,.5)}
    .badge{display:inline-flex;align-items:center;gap:.4rem;background:#0d9488;color:#fff;font-size:.7rem;font-weight:700;letter-spacing:.08em;text-transform:uppercase;padding:.25rem .75rem;border-radius:9999px;margin-bottom:1.25rem}
    .dot{width:7px;height:7px;background:#5eead4;border-radius:50%;animation:pulse 1.5s ease-in-out infinite}
    @keyframes pulse{0%,100%{opacity:1}50%{opacity:.4}}
    h1{font-size:1.75rem;font-weight:800;color:#f1f5f9;margin-bottom:.5rem}
    .version{font-size:.8rem;color:#64748b;margin-bottom:1rem}
    p{color:#94a3b8;line-height:1.6;margin-bottom:1.75rem;font-size:.95rem}
    h2{font-size:.75rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#64748b;margin-bottom:.75rem}
    table{width:100%;border-collapse:collapse;margin-bottom:1.75rem}
    td{padding:.45rem .6rem;font-size:.85rem;border-bottom:1px solid #1e293b}
    tr:last-child td{border-bottom:none}
    .method{font-weight:700;font-family:monospace;color:#5eead4;white-space:nowrap}
    .path{font-family:monospace;color:#cbd5e1}
    tr:hover td{background:#ffffff08}
    .docs{display:inline-flex;align-items:center;gap:.4rem;background:#0d9488;color:#fff;padding:.6rem 1.25rem;border-radius:.5rem;text-decoration:none;font-weight:600;font-size:.9rem;transition:background .15s}
    .docs:hover{background:#0f766e}
  </style>
</head>
<body>
  <div class="card">
    <div class="badge"><span class="dot"></span>online</div>
    <h1>visitChoco API</h1>
    <div class="version">v1.0.0 &nbsp;·&nbsp; Express 5 &nbsp;·&nbsp; PostgreSQL + PostGIS</div>
    <p>REST API para la plataforma <strong style="color:#f1f5f9">visitChoco</strong> — guía interactiva de turismo, biodiversidad y datos demográficos del departamento del Chocó, Colombia.</p>
    <h2>Endpoints</h2>
    <table>
      <tr><td class="method">GET</td><td class="path">/api/municipalities</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/municipalities/:slug</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/indigenous</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/ethnic</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/animals</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/festivals</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/attractions</td></tr>
      <tr><td class="method">GET</td><td class="path">/api/weather/:municipalityName</td></tr>
      <tr><td class="method" style="color:#fb923c">POST</td><td class="path">/api/auth/login</td></tr>
      <tr><td class="method" style="color:#fb923c">POST</td><td class="path">/api/auth/register</td></tr>
    </table>
    <a class="docs" href="/api/docs">Ver documentación Swagger →</a>
  </div>
</body>
</html>`);
});

// Global error handler (Express 5 compatible — 4 parámetros obligatorios)
// eslint-disable-next-line @typescript-eslint/no-unused-vars
app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  console.error("[ERROR]", err.message);
  res.status(500).json({ success: false, message: "Error interno del servidor" });
});

const PORT = Number(process.env.PORT) || 8000;
// HOST=127.0.0.1 en producción detrás de nginx; por defecto 0.0.0.0 (dev, Vercel)
const HOST = process.env.HOST || "0.0.0.0";
app.listen(PORT, HOST, () => console.log(`Server running on ${HOST}:${PORT}`));
