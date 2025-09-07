import cors from 'cors';
import { config } from 'dotenv';

config();

const corsOptions = {
  origin: process.env.FRONTEND_URL || 'http://localhost:5173',
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
};

export const configureCors = (app: any) => {
  app.use(cors(corsOptions));
};
