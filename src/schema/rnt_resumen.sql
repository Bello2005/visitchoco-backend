-- RNT resumen: registros activos del Chocó agregados por municipio
-- Fuente: BASE DE DATOS DE RNT.xlsx
-- municipio_nombre alineado con municipalities.name para JOIN

CREATE TABLE IF NOT EXISTS public.rnt_resumen (
    id SERIAL PRIMARY KEY,
    municipio_nombre VARCHAR(100) NOT NULL UNIQUE,
    total_activos INTEGER NOT NULL DEFAULT 0,
    hoteles INTEGER NOT NULL DEFAULT 0,
    fincas_turisticas INTEGER NOT NULL DEFAULT 0,
    hostales INTEGER NOT NULL DEFAULT 0,
    agencias_viajes INTEGER NOT NULL DEFAULT 0,
    guias_turismo INTEGER NOT NULL DEFAULT 0,
    viviendas_turisticas INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_rnt_municipio ON public.rnt_resumen(municipio_nombre);

-- INSERT one row per municipality with aggregated counts
-- Categorías del Excel:
--   ESTABLECIMIENTOS DE ALOJAMIENTO TURÍSTICO (subcategoría HOTEL) -> hoteles
--   ESTABLECIMIENTOS DE ALOJAMIENTO TURÍSTICO (subcategoría HOSTAL) -> hostales
--   VIVIENDAS TURÍSTICAS -> viviendas_turisticas
--   AGENCIAS DE VIAJES -> agencias_viajes
--   GUIAS DE TURISMO -> guias_turismo
--   fincas_turisticas: sin categoría directa en esta fuente -> 0
--   NUEVO BELEN DE BAJIRA: no corresponde a municipio en BD -> omitido

INSERT INTO public.rnt_resumen
    (municipio_nombre, total_activos, hoteles, fincas_turisticas, hostales, agencias_viajes, guias_turismo, viviendas_turisticas)
VALUES
    ('Acandí',            153, 33, 0, 27, 12, 0,  77),
    ('Bahía Solano',      111, 19, 0, 14, 26, 0,  50),
    ('Bajo Baudó',          2,  2, 0,  0,  0, 0,   0),
    ('Bojayá',              2,  0, 0,  0,  1, 0,   1),
    ('Cértegui',            3,  3, 0,  0,  0, 0,   0),
    ('Condoto',             3,  1, 0,  0,  2, 0,   0),
    ('El Carmen de Atrato',12,  4, 0,  0,  0, 1,   6),
    ('Istmina',            17, 12, 0,  0,  4, 0,   0),
    ('Juradó',              2,  1, 0,  0,  0, 0,   1),
    ('Medio Baudó',         1,  1, 0,  0,  0, 0,   0),
    ('Nuquí',             152, 28, 0,  4, 13, 0, 103),
    ('Quibdó',            128, 46, 0,  3, 45, 5,  19),
    ('Riosucio',            9,  6, 0,  0,  0, 0,   0),
    ('Tadó',                4,  4, 0,  0,  0, 0,   0),
    ('Unión Panamericana',  2,  1, 0,  1,  0, 0,   0)
ON CONFLICT (municipio_nombre) DO UPDATE SET
    total_activos        = EXCLUDED.total_activos,
    hoteles              = EXCLUDED.hoteles,
    fincas_turisticas    = EXCLUDED.fincas_turisticas,
    hostales             = EXCLUDED.hostales,
    agencias_viajes      = EXCLUDED.agencias_viajes,
    guias_turismo        = EXCLUDED.guias_turismo,
    viviendas_turisticas = EXCLUDED.viviendas_turisticas,
    created_at           = now();
