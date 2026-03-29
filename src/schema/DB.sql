--
-- PostgreSQL database dump
--

-- \restrict EiZ08bMpdzQUmMQPo6pUtSnup3nW0CJCFheOF6Sv43iAgpSIZZrjsV4aCEQLQlk

-- Dumped from database version 16.10 (Ubuntu 16.10-1.pgdg24.04+1)
-- Dumped by pg_dump version 17.6 (Ubuntu 17.6-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;  -- Solo disponible en PostgreSQL 17+
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: municipalities_set_geom(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.municipalities_set_geom() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.lat IS NOT NULL AND NEW.lon IS NOT NULL THEN
    NEW.geom := ST_SetSRID(ST_MakePoint(NEW.lon::double precision, NEW.lat::double precision), 4326)::geography;
  ELSE
    NEW.geom := NULL;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.municipalities_set_geom() OWNER TO postgres;

--
-- Name: safe_text_to_jsonb(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.safe_text_to_jsonb(in_text text) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
  t text := in_text;
  v jsonb;
BEGIN
  IF t IS NULL OR btrim(t) = '' THEN
    RETURN NULL;
  END IF;

  -- 1) intento directo
  BEGIN
    v := t::jsonb;
    RETURN v;
  EXCEPTION WHEN others THEN
    NULL;
  END;

  -- 2) reemplazar dobles comillas duplicadas
  BEGIN
    t := replace(t, '""', '"');
    v := t::jsonb;
    RETURN v;
  EXCEPTION WHEN others THEN
    NULL;
  END;

  -- 3) reemplazar comillas tipográficas (si existieran)
  BEGIN
    t := replace(t, '“', '"');
    t := replace(t, '”', '"');
    v := t::jsonb;
    RETURN v;
  EXCEPTION WHEN others THEN
    NULL;
  END;

  -- 4) quitar comillas dobles de inicio/fin si encierran todo el JSON
  BEGIN
    IF left(t,1) = '"' AND right(t,1) = '"' THEN
      t := substring(t FROM 2 FOR char_length(t) - 2);
    END IF;
    v := t::jsonb;
    RETURN v;
  EXCEPTION WHEN others THEN
    NULL;
  END;

  -- 5) quitar comillas simples de inicio/fin si encierran todo el JSON (ej. '''[...]''')
  BEGIN
    IF left(t,1) = '''' AND right(t,1) = '''' THEN
      t := substring(t FROM 2 FOR char_length(t) - 2);
    END IF;
    v := t::jsonb;
    RETURN v;
  EXCEPTION WHEN others THEN
    NULL;
  END;

  -- 6) si nada funcionó, devolver NULL
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.safe_text_to_jsonb(in_text text) OWNER TO postgres;

--
-- Name: trigger_set_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_set_updated_at() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    municipality_id integer,
    common_name character varying(100) NOT NULL,
    scientific_name character varying(150),
    description text,
    image_url character varying(300),
    audio_url character varying(300),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.animals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.animals_id_seq OWNER TO postgres;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: attractions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attractions (
    id integer NOT NULL,
    municipality_id integer,
    name character varying(150) NOT NULL,
    description text,
    image_url character varying(300),
    audio_url character varying(300),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.attractions OWNER TO postgres;

--
-- Name: attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attractions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attractions_id_seq OWNER TO postgres;

--
-- Name: attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attractions_id_seq OWNED BY public.attractions.id;


--
-- Name: ethnic_code_lookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ethnic_code_lookup (
    race_code text NOT NULL,
    race_name text NOT NULL,
    source text DEFAULT 'DANE'::text
);


ALTER TABLE public.ethnic_code_lookup OWNER TO postgres;

--
-- Name: ethnicity_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ethnicity_codes (
    race_code text NOT NULL,
    label text NOT NULL,
    description text
);


ALTER TABLE public.ethnicity_codes OWNER TO postgres;

--
-- Name: festivals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festivals (
    id integer NOT NULL,
    municipality_id integer,
    name character varying(150) NOT NULL,
    description text,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.festivals OWNER TO postgres;

--
-- Name: festivals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.festivals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.festivals_id_seq OWNER TO postgres;

--
-- Name: festivals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.festivals_id_seq OWNED BY public.festivals.id;


--
-- Name: media_uploads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_uploads (
    id integer NOT NULL,
    uploaded_by integer,
    resource_type character varying(50) NOT NULL,
    resource_id integer NOT NULL,
    url character varying(300) NOT NULL,
    filename character varying(200) NOT NULL,
    mime_type character varying(100),
    file_size integer,
    uploaded_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.media_uploads OWNER TO postgres;

--
-- Name: media_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_uploads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_uploads_id_seq OWNER TO postgres;

--
-- Name: media_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_uploads_id_seq OWNED BY public.media_uploads.id;


--
-- Name: municipalities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipalities (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    image_url character varying(300),
    audio_url character varying(300),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    geom public.geography(Point,4326),
    lat numeric(9,6),
    lon numeric(9,6),
    slug text,
    emoji character varying(8),
    zone character varying(100),
    main_activity character varying(100),
    attractions jsonb DEFAULT '[]'::jsonb,
    transportation jsonb DEFAULT '[]'::jsonb,
    weather jsonb,
    cod_dane character varying,
    territory_geom public.geometry(MultiPolygon,4326),
    CONSTRAINT chk_lat_range CHECK (((lat IS NULL) OR ((lat >= ('-90'::integer)::numeric) AND (lat <= (90)::numeric)))),
    CONSTRAINT chk_lon_range CHECK (((lon IS NULL) OR ((lon >= ('-180'::integer)::numeric) AND (lon <= (180)::numeric))))
);


ALTER TABLE public.municipalities OWNER TO postgres;

--
-- Name: municipalities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipalities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.municipalities_id_seq OWNER TO postgres;

--
-- Name: municipalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipalities_id_seq OWNED BY public.municipalities.id;


--
-- Name: municipalities_population_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipalities_population_backup (
    id integer,
    cod_dane character varying,
    population_int integer,
    population_backup character varying(100),
    backed_at timestamp with time zone
);


ALTER TABLE public.municipalities_population_backup OWNER TO postgres;

--
-- Name: municipalities_without_territory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipalities_without_territory (
    id integer,
    name character varying(100),
    cod_dane character varying
);


ALTER TABLE public.municipalities_without_territory OWNER TO postgres;

--
-- Name: municipality_ethnic_distribution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipality_ethnic_distribution (
    id integer NOT NULL,
    municipality_cod_dane text NOT NULL,
    year integer NOT NULL,
    source text NOT NULL,
    race_code text NOT NULL,
    persons_count bigint,
    persons_percentage numeric(5,2),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT chk_percentage_range CHECK (((persons_percentage IS NULL) OR ((persons_percentage >= (0)::numeric) AND (persons_percentage <= (100)::numeric)))),
    CONSTRAINT chk_persons_count_nonnegative CHECK (((persons_count IS NULL) OR (persons_count >= 0)))
);


ALTER TABLE public.municipality_ethnic_distribution OWNER TO postgres;

--
-- Name: municipality_ethnic_distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipality_ethnic_distribution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.municipality_ethnic_distribution_id_seq OWNER TO postgres;

--
-- Name: municipality_ethnic_distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipality_ethnic_distribution_id_seq OWNED BY public.municipality_ethnic_distribution.id;


--
-- Name: population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.population (
    id integer NOT NULL,
    cod_dane character varying(20) NOT NULL,
    municipio character varying(200) NOT NULL,
    count integer NOT NULL,
    cabecera_municipal integer DEFAULT 0 NOT NULL,
    centros_poblados_rural_disperso integer DEFAULT 0 NOT NULL,
    municipio_id integer,
    CONSTRAINT chk_cabecera_nonneg CHECK ((cabecera_municipal >= 0)),
    CONSTRAINT chk_centros_nonneg CHECK ((centros_poblados_rural_disperso >= 0))
);


ALTER TABLE public.population OWNER TO postgres;

--
-- Name: population_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.population_backup (
    id integer,
    cod_dane character varying(20),
    municipio character varying(200),
    count integer
);


ALTER TABLE public.population_backup OWNER TO postgres;

--
-- Name: population_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.population_id_seq OWNER TO postgres;

--
-- Name: population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.population_id_seq OWNED BY public.population.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: search_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_history (
    id integer NOT NULL,
    user_id integer,
    query_text character varying(200) NOT NULL,
    filters jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.search_history OWNER TO postgres;

--
-- Name: search_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.search_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_history_id_seq OWNER TO postgres;

--
-- Name: search_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.search_history_id_seq OWNED BY public.search_history.id;


--
-- Name: temp_municipios_igac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_municipios_igac (
    ogc_fid integer NOT NULL,
    mpcodigo character varying,
    mpnombre character varying,
    mparea double precision,
    mpnorma character varying,
    mpcategor bigint,
    shape_leng double precision,
    shape_area double precision,
    mpaltitud integer,
    restriccio character varying,
    depto character varying,
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE public.temp_municipios_igac OWNER TO postgres;

--
-- Name: temp_municipios_igac_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_municipios_igac_ogc_fid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_municipios_igac_ogc_fid_seq OWNER TO postgres;

--
-- Name: temp_municipios_igac_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_municipios_igac_ogc_fid_seq OWNED BY public.temp_municipios_igac.ogc_fid;


--
-- Name: temp_municipios_matches_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_municipios_matches_log (
    municipality_id integer,
    municipality_cod_dane text,
    municipality_name text,
    temp_ogc_fid integer,
    temp_mpcodigo text,
    temp_mpnombre text,
    match_method text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.temp_municipios_matches_log OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password_hash character varying(200) NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: v_municipality_ethnic_readable; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_municipality_ethnic_readable AS
 SELECT d.municipality_cod_dane,
    d.year,
    d.source,
    d.race_code,
    COALESCE(e.label,
        CASE
            WHEN (d.race_code = ANY (ARRAY['999'::text, '0'::text, ''::text])) THEN 'No reportado / Otra'::text
            ELSE 'Código desconocido'::text
        END) AS ethnicity_label,
    d.persons_count,
    d.persons_percentage
   FROM (public.municipality_ethnic_distribution d
     LEFT JOIN public.ethnicity_codes e ON ((e.race_code = d.race_code)));


ALTER VIEW public.v_municipality_ethnic_readable OWNER TO postgres;

--
-- Name: vw_muni_ethnic_by_cod_dane_long; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_muni_ethnic_by_cod_dane_long AS
 SELECT m.id AS municipality_id,
    m.name AS municipality_name,
    m.cod_dane AS municipality_cod_dane,
    d.year,
    d.source,
    d.race_code,
    COALESCE(d.persons_count, (0)::bigint) AS persons_count,
    (COALESCE(d.persons_percentage, (0)::numeric))::numeric(5,2) AS persons_percentage
   FROM (public.municipalities m
     LEFT JOIN public.municipality_ethnic_distribution d ON (((m.cod_dane)::text = d.municipality_cod_dane)));


ALTER VIEW public.vw_muni_ethnic_by_cod_dane_long OWNER TO postgres;

--
-- Name: vw_muni_ethnic_with_label; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_muni_ethnic_with_label AS
 SELECT m.id AS municipality_id,
    m.name AS municipality_name,
    m.cod_dane AS municipality_cod_dane,
    d.year,
    d.source,
    d.race_code,
    ec.race_name,
    COALESCE(d.persons_count, (0)::bigint) AS persons_count,
    (COALESCE(d.persons_percentage, (0)::numeric))::numeric(5,2) AS persons_percentage,
    m.lat,
    m.lon,
    m.geom
   FROM ((public.municipalities m
     LEFT JOIN public.municipality_ethnic_distribution d ON (((m.cod_dane)::text = d.municipality_cod_dane)))
     LEFT JOIN public.ethnic_code_lookup ec ON ((d.race_code = ec.race_code)));


ALTER VIEW public.vw_muni_ethnic_with_label OWNER TO postgres;

--
-- Name: vw_municipalities_population; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_municipalities_population AS
 SELECT m.id AS municipality_id,
    m.name AS municipality_name,
    m.cod_dane AS municipality_cod_dane,
    m.zone AS municipality_zone,
    m.lat,
    m.lon,
    m.slug,
    p.id AS population_id,
    p.count AS population_count,
    p.cabecera_municipal AS population_cabecera,
    p.centros_poblados_rural_disperso AS population_rural_centers,
    p.cod_dane AS population_cod_dane,
    p.municipio AS population_municipio
   FROM (public.municipalities m
     LEFT JOIN public.population p ON ((p.municipio_id = m.id)));


ALTER VIEW public.vw_municipalities_population OWNER TO postgres;

--
-- Name: vw_municipality_population_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_municipality_population_summary AS
 SELECT m.id AS municipality_id,
    m.name AS municipality_name,
    m.cod_dane AS municipality_cod_dane,
    COALESCE(sum(p.count), (0)::bigint) AS total_population,
    COALESCE(sum(p.cabecera_municipal), (0)::bigint) AS total_cabecera_municipal,
    COALESCE(sum(p.centros_poblados_rural_disperso), (0)::bigint) AS total_centros_rurales
   FROM (public.municipalities m
     LEFT JOIN public.population p ON ((p.municipio_id = m.id)))
  GROUP BY m.id, m.name, m.cod_dane;


ALTER VIEW public.vw_municipality_population_summary OWNER TO postgres;

--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: attractions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attractions ALTER COLUMN id SET DEFAULT nextval('public.attractions_id_seq'::regclass);


--
-- Name: festivals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivals ALTER COLUMN id SET DEFAULT nextval('public.festivals_id_seq'::regclass);


--
-- Name: media_uploads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_uploads ALTER COLUMN id SET DEFAULT nextval('public.media_uploads_id_seq'::regclass);


--
-- Name: municipalities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipalities ALTER COLUMN id SET DEFAULT nextval('public.municipalities_id_seq'::regclass);


--
-- Name: municipality_ethnic_distribution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipality_ethnic_distribution ALTER COLUMN id SET DEFAULT nextval('public.municipality_ethnic_distribution_id_seq'::regclass);


--
-- Name: population id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population ALTER COLUMN id SET DEFAULT nextval('public.population_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: search_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history ALTER COLUMN id SET DEFAULT nextval('public.search_history_id_seq'::regclass);


--
-- Name: temp_municipios_igac ogc_fid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_municipios_igac ALTER COLUMN ogc_fid SET DEFAULT nextval('public.temp_municipios_igac_ogc_fid_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: attractions attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attractions
    ADD CONSTRAINT attractions_pkey PRIMARY KEY (id);


--
-- Name: ethnic_code_lookup ethnic_code_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ethnic_code_lookup
    ADD CONSTRAINT ethnic_code_lookup_pkey PRIMARY KEY (race_code);


--
-- Name: ethnicity_codes ethnicity_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ethnicity_codes
    ADD CONSTRAINT ethnicity_codes_pkey PRIMARY KEY (race_code);


--
-- Name: festivals festivals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_pkey PRIMARY KEY (id);


--
-- Name: media_uploads media_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_uploads
    ADD CONSTRAINT media_uploads_pkey PRIMARY KEY (id);


--
-- Name: municipalities municipalities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipalities
    ADD CONSTRAINT municipalities_pkey PRIMARY KEY (id);


--
-- Name: municipality_ethnic_distribution municipality_ethnic_distribut_municipality_cod_dane_year_so_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipality_ethnic_distribution
    ADD CONSTRAINT municipality_ethnic_distribut_municipality_cod_dane_year_so_key UNIQUE (municipality_cod_dane, year, source, race_code);


--
-- Name: municipality_ethnic_distribution municipality_ethnic_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipality_ethnic_distribution
    ADD CONSTRAINT municipality_ethnic_distribution_pkey PRIMARY KEY (id);


--
-- Name: population population_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: search_history search_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (id);


--
-- Name: temp_municipios_igac temp_municipios_igac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_municipios_igac
    ADD CONSTRAINT temp_municipios_igac_pkey PRIMARY KEY (ogc_fid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_ethnic_municipality_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ethnic_municipality_year ON public.municipality_ethnic_distribution USING btree (municipality_cod_dane, year);


--
-- Name: idx_mun_pop_bk_cod_dane; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mun_pop_bk_cod_dane ON public.municipalities_population_backup USING btree (cod_dane);


--
-- Name: idx_municipalities_attractions_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_attractions_gin ON public.municipalities USING gin (attractions);


--
-- Name: idx_municipalities_cod_dane_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_municipalities_cod_dane_unique ON public.municipalities USING btree (cod_dane);


--
-- Name: idx_municipalities_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_geom ON public.municipalities USING gist (geom);


--
-- Name: idx_municipalities_main_activity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_main_activity ON public.municipalities USING btree (main_activity);


--
-- Name: idx_municipalities_slug_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_municipalities_slug_unique ON public.municipalities USING btree (slug);


--
-- Name: idx_municipalities_territory_geom_gist; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_territory_geom_gist ON public.municipalities USING gist (territory_geom) WITH (fillfactor='90');


--
-- Name: idx_municipalities_transportation_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_transportation_gin ON public.municipalities USING gin (transportation);


--
-- Name: idx_municipalities_weather_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_weather_gin ON public.municipalities USING gin (weather);


--
-- Name: idx_municipalities_zone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_municipalities_zone ON public.municipalities USING btree (zone);


--
-- Name: idx_population_cod_dane; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_population_cod_dane ON public.population USING btree (cod_dane);


--
-- Name: idx_population_municipio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_population_municipio_id ON public.population USING btree (municipio_id);


--
-- Name: temp_municipios_igac_geom_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_municipios_igac_geom_geom_idx ON public.temp_municipios_igac USING gist (geom);


--
-- Name: municipalities set_geom_before_insert_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_geom_before_insert_update BEFORE INSERT OR UPDATE ON public.municipalities FOR EACH ROW EXECUTE FUNCTION public.municipalities_set_geom();


--
-- Name: municipalities set_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.municipalities FOR EACH ROW EXECUTE FUNCTION public.trigger_set_updated_at();


--
-- Name: animals animals_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.municipalities(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: attractions attractions_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attractions
    ADD CONSTRAINT attractions_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.municipalities(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: festivals festivals_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.municipalities(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: municipality_ethnic_distribution fk_muni_cod_dane; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipality_ethnic_distribution
    ADD CONSTRAINT fk_muni_cod_dane FOREIGN KEY (municipality_cod_dane) REFERENCES public.municipalities(cod_dane);


--
-- Name: population fk_population_municipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT fk_population_municipio FOREIGN KEY (municipio_id) REFERENCES public.municipalities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: media_uploads media_uploads_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_uploads
    ADD CONSTRAINT media_uploads_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: search_history search_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

-- \unrestrict EiZ08bMpdzQUmMQPo6pUtSnup3nW0CJCFheOF6Sv43iAgpSIZZrjsV4aCEQLQlk
