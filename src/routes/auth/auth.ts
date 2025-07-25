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
  const email = req.user?.email || "";
  const role = req.user?.role || "";
  if (role !== "user") {
    return res
      .status(403)
      .json({
        message: "Acceso denegado: solo usuarios pueden ver este dashboard.",
      });
  }
  res.json({ message: `Bienvenido, usuario ${email}` });
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
