-- Table: public.municipalities

-- DROP TABLE IF EXISTS public.municipalities;

CREATE TABLE IF NOT EXISTS public.municipalities
(
    id integer NOT NULL DEFAULT nextval('municipalities_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    image_url character varying(300) COLLATE pg_catalog."default",
    audio_url character varying(300) COLLATE pg_catalog."default",
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    geom geography(Point,4326),
    lat numeric(9,6),
    lon numeric(9,6),
    slug text COLLATE pg_catalog."default",
    emoji character varying(8) COLLATE pg_catalog."default",
    zone character varying(100) COLLATE pg_catalog."default",
    main_activity character varying(100) COLLATE pg_catalog."default",
    attractions jsonb DEFAULT '[]'::jsonb,
    transportation jsonb DEFAULT '[]'::jsonb,
    weather jsonb,
    cod_dane character varying COLLATE pg_catalog."default",
    territory_geom geometry(MultiPolygon,4326),
    CONSTRAINT municipalities_pkey PRIMARY KEY (id),
    CONSTRAINT chk_lat_range CHECK (lat IS NULL OR lat >= '-90'::integer::numeric AND lat <= 90::numeric),
    CONSTRAINT chk_lon_range CHECK (lon IS NULL OR lon >= '-180'::integer::numeric AND lon <= 180::numeric)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.municipalities
    OWNER to postgres;
-- Index: idx_municipalities_attractions_gin

-- DROP INDEX IF EXISTS public.idx_municipalities_attractions_gin;

CREATE INDEX IF NOT EXISTS idx_municipalities_attractions_gin
    ON public.municipalities USING gin
    (attractions)
    WITH (fastupdate=True, gin_pending_list_limit=4194304)
    TABLESPACE pg_default;
-- Index: idx_municipalities_cod_dane_unique

-- DROP INDEX IF EXISTS public.idx_municipalities_cod_dane_unique;

CREATE UNIQUE INDEX IF NOT EXISTS idx_municipalities_cod_dane_unique
    ON public.municipalities USING btree
    (cod_dane COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_municipalities_geom

-- DROP INDEX IF EXISTS public.idx_municipalities_geom;

CREATE INDEX IF NOT EXISTS idx_municipalities_geom
    ON public.municipalities USING gist
    (geom)
    WITH (fillfactor=90, buffering=auto)
    TABLESPACE pg_default;
-- Index: idx_municipalities_main_activity

-- DROP INDEX IF EXISTS public.idx_municipalities_main_activity;

CREATE INDEX IF NOT EXISTS idx_municipalities_main_activity
    ON public.municipalities USING btree
    (main_activity COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_municipalities_slug_unique

-- DROP INDEX IF EXISTS public.idx_municipalities_slug_unique;

CREATE UNIQUE INDEX IF NOT EXISTS idx_municipalities_slug_unique
    ON public.municipalities USING btree
    (slug COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_municipalities_territory_geom_gist

-- DROP INDEX IF EXISTS public.idx_municipalities_territory_geom_gist;

CREATE INDEX IF NOT EXISTS idx_municipalities_territory_geom_gist
    ON public.municipalities USING gist
    (territory_geom)
    WITH (fillfactor=90, buffering=auto)
    TABLESPACE pg_default;
-- Index: idx_municipalities_transportation_gin

-- DROP INDEX IF EXISTS public.idx_municipalities_transportation_gin;

CREATE INDEX IF NOT EXISTS idx_municipalities_transportation_gin
    ON public.municipalities USING gin
    (transportation)
    WITH (fastupdate=True, gin_pending_list_limit=4194304)
    TABLESPACE pg_default;
-- Index: idx_municipalities_weather_gin

-- DROP INDEX IF EXISTS public.idx_municipalities_weather_gin;

CREATE INDEX IF NOT EXISTS idx_municipalities_weather_gin
    ON public.municipalities USING gin
    (weather)
    WITH (fastupdate=True, gin_pending_list_limit=4194304)
    TABLESPACE pg_default;
-- Index: idx_municipalities_zone

-- DROP INDEX IF EXISTS public.idx_municipalities_zone;

CREATE INDEX IF NOT EXISTS idx_municipalities_zone
    ON public.municipalities USING btree
    (zone COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;

-- Trigger: set_geom_before_insert_update

-- DROP TRIGGER IF EXISTS set_geom_before_insert_update ON public.municipalities;

CREATE OR REPLACE TRIGGER set_geom_before_insert_update
    BEFORE INSERT OR UPDATE 
    ON public.municipalities
    FOR EACH ROW
    EXECUTE FUNCTION public.municipalities_set_geom();

-- Trigger: set_updated_at

-- DROP TRIGGER IF EXISTS set_updated_at ON public.municipalities;

CREATE OR REPLACE TRIGGER set_updated_at
    BEFORE UPDATE 
    ON public.municipalities
    FOR EACH ROW
    EXECUTE FUNCTION public.trigger_set_updated_at();