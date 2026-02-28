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
// Rutas protegidas (requieren autenticación)
app.use("/api", auth_2.verifyJWT, dashboard_1.default);
// Global error handler (Express 5 compatible — 4 parámetros obligatorios)
// eslint-disable-next-line @typescript-eslint/no-unused-vars
app.use((err, _req, res, _next) => {
    console.error("[ERROR]", err.message);
    res.status(500).json({ success: false, message: "Error interno del servidor" });
});
const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
