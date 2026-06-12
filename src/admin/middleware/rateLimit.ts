import type { Request, Response, NextFunction } from 'express';

const buckets = new Map<string, { count: number; resetAt: number }>();

interface RateLimitOpts {
  windowMs: number;
  max: number;
  keyFn?: (req: Request) => string;
  errorCode?: string;
}

export function rateLimit(opts: RateLimitOpts) {
  return (req: Request, res: Response, next: NextFunction) => {
    const key = opts.keyFn?.(req) ?? req.ip ?? 'unknown';
    const now = Date.now();
    const bucket = buckets.get(key);
    if (!bucket || bucket.resetAt < now) {
      buckets.set(key, { count: 1, resetAt: now + opts.windowMs });
      return next();
    }
    if (bucket.count >= opts.max) {
      const retryAfter = Math.ceil((bucket.resetAt - now) / 1000);
      res.set('Retry-After', String(retryAfter));
      return res.status(429).json({ error: opts.errorCode ?? 'rate_limit', retry_after: retryAfter });
    }
    bucket.count++;
    next();
  };
}

setInterval(() => {
  const now = Date.now();
  for (const [k, v] of buckets) {
    if (v.resetAt < now) buckets.delete(k);
  }
}, 60_000).unref();
