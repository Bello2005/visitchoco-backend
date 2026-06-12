import type { Request, Response, NextFunction } from "express";

/**
 * Cache-Control para GETs públicos servidos detrás del CDN de Vercel.
 * Mitiga el cold start de Neon (DEF-01): el edge sirve la respuesta cacheada
 * y revalida en background. NO usar en /api/auth, /api/admin, /api/weather ni /api/docs.
 */
export function publicCache(sMaxAge: number, swr: number) {
  return (req: Request, res: Response, next: NextFunction) => {
    if (req.method === "GET") {
      res.set(
        "Cache-Control",
        `public, s-maxage=${sMaxAge}, stale-while-revalidate=${swr}`
      );
    }
    next();
  };
}
