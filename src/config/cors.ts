import cors from "cors";
import { config } from "dotenv";

config();

const isDevelopment = process.env.NODE_ENV === 'development';

const allowedOrigins = isDevelopment
  ? ['http://localhost:5173', 'http://127.0.0.1:5173']
  : ['https://visitchoco-frontend.vercel.app'];

const corsOptions = {
  origin: (origin: any, callback: any) => {
    if (!origin || allowedOrigins.indexOf(origin) !== -1) {
      callback(null, true);
    } else {
      callback(new Error("No permitido por CORS"));
    }
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
  // Middleware de pre-vuelo para las solicitudes OPTIONS
  app.options("*", cors(corsOptions));

  // Aplicar CORS para todas las rutas
  app.use(cors(corsOptions));
};
