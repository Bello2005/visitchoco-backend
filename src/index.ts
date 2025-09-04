import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import swaggerUi from "swagger-ui-express";
import { swaggerSpec } from "./config/swagger";
import authRoutes from "./routes/auth/auth";
import municipalitiesRoutes from "./routes/municipalities/municipalities";
import indigenousRoutes from "./routes/indigenous/indigenous";
import weatherRoutes from "./routes/weather/weather";
import { verifyJWT } from "./middlewares/auth";

dotenv.config();
const app = express();

// Configuración de CORS dinámica
const allowAllOrigins = process.env.CORS_ALLOW_ALL_ORIGINS === "True";
const origins = (process.env.CORS_ORIGIN || "")
  .split(",")
  .map((s) => s.trim())
  .filter(Boolean);

app.use(
  cors(
    allowAllOrigins
      ? { credentials: true } // Permite todos los orígenes
      : {
          origin: (incomingOrigin, callback) => {
            if (!incomingOrigin || origins.includes(incomingOrigin)) {
              return callback(null, true);
            }
            callback(new Error(`CORS error: ${incomingOrigin} not allowed`));
          },
          credentials: true,
        }
  )
);

app.use(express.json());

// Documentación Swagger
app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Mount routes
app.use("/api/auth", authRoutes);
app.use("/api/municipalities", municipalitiesRoutes);
app.use("/api/ethnic", require("./routes/ethnic/ethnic").default);
app.use("/api/indigenous", indigenousRoutes);
app.use("/api/weather", weatherRoutes);

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
