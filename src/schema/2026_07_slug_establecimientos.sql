-- ============================================================
-- 2026_07 — Slugs para establecimientos
-- Idempotente. Correr manualmente en pgAdmin (NO desde código).
-- Requiere la extensión unaccent (ya instalada por DB.sql).
-- ============================================================

ALTER TABLE establecimientos ADD COLUMN IF NOT EXISTS slug TEXT;

-- backfill: nombre → kebab-case sin acentos; colisiones → sufijo -{municipio_id}
UPDATE establecimientos e SET slug = sub.slug_final FROM (
  SELECT id,
    CASE WHEN COUNT(*) OVER (PARTITION BY base) > 1
         THEN base || '-' || COALESCE(municipio_id::text, id::text)
         ELSE base END AS slug_final
  FROM (
    SELECT id, municipio_id,
      trim(both '-' from regexp_replace(lower(unaccent(nombre)), '[^a-z0-9]+', '-', 'g')) AS base
    FROM establecimientos
  ) t
) sub WHERE e.id = sub.id AND e.slug IS NULL;

CREATE UNIQUE INDEX IF NOT EXISTS idx_estab_slug ON establecimientos(slug);
