import { Pool as PgPool } from "pg";
import { Pool as NeonPool, neonConfig } from "@neondatabase/serverless";
import ws from "ws";
import dotenv from "dotenv";

dotenv.config();

// Interfaz mínima común entre pg.Pool y @neondatabase/serverless Pool —
// los repositorios solo usan query() y connect().
type DbPool = Pick<PgPool, "query" | "connect" | "on">;

// Con DATABASE_URL (Neon) usamos el driver serverless por WebSocket:
// evita el handshake TCP+TLS de pg en cada cold start (~8-9 s → ~1 s).
// Sin DATABASE_URL (dev local con DB_HOST) seguimos con pg.
function createPool(): DbPool {
  if (process.env.DATABASE_URL) {
    neonConfig.webSocketConstructor = ws;
    return new NeonPool({
      connectionString: process.env.DATABASE_URL,
    }) as unknown as DbPool;
  }

  return new PgPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: parseInt(process.env.DB_PORT || "5432"),
  });
}

const pool = createPool();

pool.on("error", (err) => {
  console.error("Unexpected error on idle client", err);
});

export default pool as PgPool;
