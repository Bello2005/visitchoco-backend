import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import swaggerUi from "swagger-ui-express";
import { swaggerSpec } from "./config/swagger";
import authRoutes from "./routes/auth/auth";
import municipalitiesRoutes from "./routes/municipalities/municipalities";
import indigenousRoutes from "./routes/indigenous/indigenous";
import weatherRoutes from "./routes/weather/weather";
import dashboardRoutes from "./routes/dashboard/dashboard";
import { verifyJWT } from "./middlewares/auth";

dotenv.config();
const app = express();

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

app.use(cors(corsOptions));

app.use(express.json());

// Documentación Swagger
app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Rutas públicas
app.use("/api/auth/login", authRoutes);
app.use("/api/auth/register", authRoutes);

// Rutas protegidas
app.use("/api/auth", verifyJWT, authRoutes);
app.use("/api/municipalities", verifyJWT, municipalitiesRoutes);
app.use("/api/ethnic", verifyJWT, require("./routes/ethnic/ethnic").default);
app.use("/api/indigenous", verifyJWT, indigenousRoutes);
app.use("/api/weather", verifyJWT, weatherRoutes);
app.use("/api", verifyJWT, dashboardRoutes);

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
app.get("/api/admin/dashboard", verifyJWT, (req, res) => {
  res.json({ message: `Bienvenido, usuario ${req.user?.email}` });
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
