"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.swaggerSpec = void 0;
const swagger_jsdoc_1 = __importDefault(require("swagger-jsdoc"));
const options = {
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
exports.swaggerSpec = (0, swagger_jsdoc_1.default)(options);
