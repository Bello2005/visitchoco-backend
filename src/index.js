"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const swagger_ui_express_1 = __importDefault(require("swagger-ui-express"));
const swagger_1 = require("./config/swagger");
const auth_1 = __importDefault(require("./routes/auth/auth"));
const municipalities_1 = __importDefault(require("./routes/municipalities/municipalities"));
const indigenous_1 = __importDefault(require("./routes/indigenous/indigenous"));
const weather_1 = __importDefault(require("./routes/weather/weather"));
const dashboard_1 = __importDefault(require("./routes/dashboard/dashboard"));
const auth_2 = require("./middlewares/auth");
dotenv_1.default.config();
const app = (0, express_1.default)();
// Configuración de CORS
const corsOptions = {
    origin: ["https://visitchoco-frontend.vercel.app", "http://localhost:5173"],
    credentials: true,
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: [
        "Content-Type",
        "Authorization",
        "Origin",
        "X-Requested-With",
        "Accept",
    ],
};
app.use((0, cors_1.default)(corsOptions));
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
// Ruta protegida con JWT
/**
 * @openapi
 * /api/admin/dashboard:
 *   get:
 *     summary: Dashboard de administrador (protegido)
 *     tags:
 *       - Admin
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       '200':
 *         description: Acceso permitido, muestra mensaje de bienvenida
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Bienvenido, usuario admin@choco.com
 *       '401':
 *         description: Token no enviado o inválido
 *       '403':
 *         description: Token inválido o expirado
 */
app.get("/api/admin/dashboard", auth_2.verifyJWT, (req, res) => {
    var _a;
    res.json({ message: `Bienvenido, usuario ${(_a = req.user) === null || _a === void 0 ? void 0 : _a.email}` });
});
const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
