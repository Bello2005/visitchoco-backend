/**
 * @openapi
 * /api/auth/login:
 *   post:
 *     summary: Iniciar sesión de usuario
 *     tags:
 *       - Auth
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               email:
 *                 type: string
 *                 format: email
 *                 example: admin@choco.com
 *               password:
 *                 type: string
 *                 format: password
 *                 example: YourP@ssw0rd
 *     responses:
 *       '200':
 *         description: Login exitoso, devuelve token JWT
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 token:
 *                   type: string
 *                   example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
 *       '401':
 *         description: Credenciales inválidas
 */
import { Router } from "express";
import {
  login,
  register,
} from "../../controllers/authController/authController";
import { verifyJWT } from "../../middlewares/auth";

const router = Router();

// Rutas públicas
router.post("/login", login);
router.post("/register", register);

/**
 * @openapi
 * /api/auth/login:
 *   post:
 *     summary: Iniciar sesión de usuario
 *     tags:
 *       - Auth
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               email:
 *                 type: string
 *                 format: email
 *                 example: admin@choco.com
 *               password:
 *                 type: string
 *                 format: password
 *                 example: YourP@ssw0rd
 *     responses:
 *       '200':
 *         description: Login exitoso, devuelve token JWT
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 token:
 *                   type: string
 *                   example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
 *       '401':
 *         description: Credenciales inválidas
 */
router.post("/login", login);

/**
 * @openapi
 * /api/user/dashboard:
 *   get:
 *     summary: Dashboard de usuario
 *     tags: [User]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       '200':
 *         description: Mensaje de bienvenida para el usuario
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: "Bienvenido, usuario user@choco.com"
 *       '401':
 *         description: No autorizado
 */
router.get("/user/dashboard", verifyJWT, (req, res) => {
  try {
    console.log("[DASHBOARD] Usuario accediendo al dashboard:", req.user);
    const email = req.user?.email || "";
    const role = req.user?.role || "";

    if (role !== "user") {
      console.log("[DASHBOARD] Acceso denegado - rol incorrecto:", role);
      return res.status(403).json({
        error: "Forbidden",
        message: "Acceso denegado: solo usuarios pueden ver este dashboard.",
      });
    }

    res.json({
      message: `Bienvenido, usuario ${email}`,
      role: role,
    });
  } catch (error) {
    console.error("[DASHBOARD] Error en dashboard de usuario:", error);
    res.status(500).json({
      error: "Internal Server Error",
      message: "Error al procesar la solicitud",
    });
  }
});

router.get("/admin/dashboard", verifyJWT, (req, res) => {
  try {
    console.log("[DASHBOARD] Administrador accediendo al dashboard:", req.user);
    const email = req.user?.email || "";
    const role = req.user?.role || "";

    if (role !== "admin") {
      console.log("[DASHBOARD] Acceso denegado - rol incorrecto:", role);
      return res.status(403).json({
        error: "Forbidden",
        message:
          "Acceso denegado: solo administradores pueden ver este dashboard.",
      });
    }

    res.json({
      message: `Bienvenido, administrador ${email}`,
      role: role,
      isAuthenticated: true,
    });
  } catch (error) {
    console.error("[DASHBOARD] Error en dashboard de admin:", error);
    res.status(500).json({
      error: "Internal Server Error",
      message: "Error al procesar la solicitud",
    });
  }
});

export default router;

/**
 * @openapi
 * /api/auth/register:
 *   post:
 *     summary: Crear un nuevo usuario
 *     tags: [Auth]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               email:
 *                 type: string
 *                 format: email
 *               password:
 *                 type: string
 *             required: [name, email, password]
 *     responses:
 *       '201':
 *         description: Usuario creado
 */
router.post("/register", register);
