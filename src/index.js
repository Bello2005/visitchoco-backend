"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
const swagger_ui_express_1 = __importDefault(require("swagger-ui-express"));
const swagger_1 = require("./config/swagger");
const cors_1 = require("./config/cors");
const auth_1 = __importDefault(require("./routes/auth/auth"));
const municipalities_1 = __importDefault(require("./routes/municipalities/municipalities"));
const indigenous_1 = __importDefault(require("./routes/indigenous/indigenous"));
const weather_1 = __importDefault(require("./routes/weather/weather"));
const dashboard_1 = __importDefault(require("./routes/dashboard/dashboard"));
const animals_1 = __importDefault(require("./routes/animals/animals"));
const festivals_1 = __importDefault(require("./routes/festivals/festivals"));
const attractions_1 = __importDefault(require("./routes/attractions/attractions"));
const auth_2 = require("./middlewares/auth");
dotenv_1.default.config();
const app = (0, express_1.default)();
// CORS centralizado (config/cors.ts)
(0, cors_1.configureCors)(app);
app.use(express_1.default.json());
// Documentación Swagger
app.use("/api/docs", swagger_ui_express_1.default.serve, swagger_ui_express_1.default.setup(swagger_1.swaggerSpec));
// Rutas públicas
app.use("/api/auth", auth_1.default);
app.use("/api/municipalities", municipalities_1.default);
app.use("/api/indigenous", indigenous_1.default);
app.use("/api/ethnic", require("./routes/ethnic/ethnic").default);
app.use("/api/weather", weather_1.default);
app.use("/api/animals", animals_1.default);
app.use("/api/festivals", festivals_1.default);
app.use("/api/attractions", attractions_1.default);
// Rutas protegidas (requieren autenticación)
app.use("/api", auth_2.verifyJWT, dashboard_1.default);
// Root
app.get("/", (_req, res) => {
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
app.use((err, _req, res, _next) => {
    console.error("[ERROR]", err.message);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
});
const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
