import cors from "cors";
import { config } from "dotenv";

config();

const isDevelopment = process.env.NODE_ENV === "development";

const isVercelDeployment = (origin: string): boolean => {
  return origin.endsWith('.vercel.app') || origin === 'https://visitchoco-frontend.vercel.app';
};

const corsOptions = {
  origin: (origin: any, callback: any) => {
    // Permitir solicitudes en desarrollo
    if (isDevelopment && (!origin || origin.startsWith('http://localhost') || origin.startsWith('http://127.0.0.1'))) {
      callback(null, true);
      return;
    }

    // Permitir solicitudes de dominios Vercel en producción
    if (!isDevelopment && (!origin || isVercelDeployment(origin))) {
      callback(null, true);
      return;
    }

    callback(new Error('No permitido por CORS'));
  },
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

export const configureCors = (app: any) => {
  app.use(cors(corsOptions));
};
