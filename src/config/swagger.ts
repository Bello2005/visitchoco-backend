import { Options } from "swagger-jsdoc";
import swaggerJSDoc from "swagger-jsdoc";

const options: Options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "Visit Chocó API",
      version: "1.0.0",
      description: "Documentación de la API para Visit Chocó",
    },
    servers: [{ url: process.env.API_BASE_URL || "http://localhost:8000" }],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: "http",
          scheme: "bearer",
          bearerFormat: "JWT",
        },
      },
    },
    security: [{ bearerAuth: [] }],
  },
  apis: ["src/routes/auth/*.ts"],
};

export const swaggerSpec = swaggerJSDoc(options);
