-- Tabla de Resguardos Indígenas
-- Creada para almacenar información de resguardos indígenas de Colombia

CREATE TABLE IF NOT EXISTS indigenous_reserves (
    id SERIAL PRIMARY KEY,
    external_id INTEGER UNIQUE NOT NULL,
    name VARCHAR(500) NOT NULL,
    administrative_act_type VARCHAR(50),
    administrative_act_number VARCHAR(100),
    administrative_act_date DATE,
    total_area NUMERIC(15,4),
    plan_number VARCHAR(200),
    indigenous_people VARCHAR(200) NOT NULL,
    department VARCHAR(100) NOT NULL,
    municipality VARCHAR(200) NOT NULL,
    dane_code VARCHAR(20),
    global_id VARCHAR(100),
    shape_area NUMERIC(20,6),
    shape_length NUMERIC(20,6),
    municipality_cod_dane VARCHAR(10),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Foreign key hacia municipalities
    CONSTRAINT fk_municipality 
        FOREIGN KEY (municipality_cod_dane) 
        REFERENCES municipalities(cod_dane)
);

-- Índices para optimización
CREATE INDEX IF NOT EXISTS idx_indigenous_reserves_people ON indigenous_reserves(indigenous_people);
CREATE INDEX IF NOT EXISTS idx_indigenous_reserves_department ON indigenous_reserves(department);
CREATE INDEX IF NOT EXISTS idx_indigenous_reserves_municipality ON indigenous_reserves(municipality);
CREATE INDEX IF NOT EXISTS idx_indigenous_reserves_dane_code ON indigenous_reserves(dane_code);
CREATE INDEX IF NOT EXISTS idx_indigenous_reserves_area ON indigenous_reserves(total_area);
CREATE INDEX IF NOT EXISTS idx_indigenous_reserves_date ON indigenous_reserves(administrative_act_date);

-- Trigger para updated_at
CREATE OR REPLACE FUNCTION update_indigenous_reserves_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER indigenous_reserves_updated_at 
    BEFORE UPDATE ON indigenous_reserves 
    FOR EACH ROW 
    EXECUTE FUNCTION update_indigenous_reserves_updated_at();

BEGIN;

-- Limpiar datos existentes si es necesario
-- DELETE FROM indigenous_reserves;

-- Insertar datos
INSERT INTO indigenous_reserves (
    external_id, name, administrative_act_type, administrative_act_number, 
    administrative_act_date, total_area, plan_number, indigenous_people, 
    department, municipality, dane_code, global_id, shape_area, shape_length, 
    municipality_cod_dane
) VALUES (
    10359,
    'Resguardo Indígena Embera de Wanchirado',
    'RESOLUCION',
    '0071',
    '1992-12-19',
    9035,
    'P-466.278',
    'EMBERA',
    '27',
    '27413',
    '27413',
    '{5122426E-DE08-432D-BFC6-26FD3BDBA74B}',
    99220363.4725748,
    53569.4674619941,
    '27413'
);

INSERT INTO indigenous_reserves (
    external_id, name, administrative_act_type, administrative_act_number, 
    administrative_act_date, total_area, plan_number, indigenous_people, 
    department, municipality, dane_code, global_id, shape_area, shape_length, 
    municipality_cod_dane
) VALUES (
    10921,
    'Resguardo Indígena Tamaquito II',
    'ACUERDO',
    '104',
    '2019-11-28',
    299.8368,
    '210-55482',
    'WAYUU',
    '44',
    '44078',
    '44078',
    '{07678766-F135-4205-B614-2035774DCA96}',
    2992226.93538414,
    9277.44059558673,
    '44078'
);

INSERT INTO indigenous_reserves (
    external_id, name, administrative_act_type, administrative_act_number, 
    administrative_act_date, total_area, plan_number, indigenous_people, 
    department, municipality, dane_code, global_id, shape_area, shape_length, 
    municipality_cod_dane
) VALUES (
    10749,
    'Resguardo Indígena Guahibo-Amoruas Caño Mesetas - Dagua y Murciélago',
    'ACUERDO',
    '454',
    '2024-12-19',
    98975.3178,
    'ACCTI02499001949',
    'GUAHIBO AMORRUA',
    '99',
    '99001',
    '99001',
    '{A802ADF5-F741-446F-8DFA-357990E4FDDA}',
    985525262.00027,
    263229.809493653,
    '99001'
);

INSERT INTO indigenous_reserves (
    external_id, name, administrative_act_type, administrative_act_number, 
    administrative_act_date, total_area, plan_number, indigenous_people, 
    department, municipality, dane_code, global_id, shape_area, shape_length, 
    municipality_cod_dane
) VALUES (
    10717,
    'Resguardo Indígena Waunana de Chachajo',
    'RESOLUCION',
    '0103',
    '1981-12-15',
    2240,
    '262.714 junio de 1981',
    'WAUNANA',
    '76',
    '76109',
    '76109',
    '{2EC15917-6CDB-42A3-AFF8-9AA58F3ADFD0}',
    21010137.835854,
    21371.5281966713,
    '76109'
);

INSERT INTO indigenous_reserves (
    external_id, name, administrative_act_type, administrative_act_number, 
    administrative_act_date, total_area, plan_number, indigenous_people, 
    department, municipality, dane_code, global_id, shape_area, shape_length, 
    municipality_cod_dane
) VALUES (
    10158,
    'Resguardo Indígena Tunebo de Chaparral y Barro Negro',
    'RESOLUCION',
    '64',
    '1999-09-16',
    16824.48,
    'Plano 264993 de marzo de 1985',
    'U´WA TUNEBO',
    '85',
    '85125',
    '85125',
    '{2036B4BC-1B1D-4B17-A4B7-EDA79BA5D0F2}',
    164794517.435249,
    73191.0875271234,
    '85125'
);

COMMIT;

-- ============================================================================
-- CONSULTAS DE ANÁLISIS
-- ============================================================================

-- 1. Resumen por pueblo indígena
SELECT 
    indigenous_people,
    COUNT(*) as total_reserves,
    SUM(total_area) as total_area_hectares,
    ROUND(AVG(total_area), 2) as avg_area_hectares,
    COUNT(DISTINCT department) as departments_count
FROM indigenous_reserves 
GROUP BY indigenous_people 
ORDER BY total_area_hectares DESC;

-- 2. Resumen por departamento
SELECT 
    department,
    COUNT(*) as total_reserves,
    SUM(total_area) as total_area_hectares,
    COUNT(DISTINCT indigenous_people) as different_peoples
FROM indigenous_reserves 
GROUP BY department 
ORDER BY total_area_hectares DESC;

-- 3. Creación de reservas por década
SELECT 
    FLOOR(EXTRACT(YEAR FROM administrative_act_date) / 10) * 10 as decade,
    COUNT(*) as reserves_created,
    SUM(total_area) as total_area_hectares
FROM indigenous_reserves 
WHERE administrative_act_date IS NOT NULL
GROUP BY decade 
ORDER BY decade;

-- 4. Reservas más grandes
SELECT 
    name,
    indigenous_people,
    department,
    municipality,
    total_area as area_hectares,
    administrative_act_date
FROM indigenous_reserves 
ORDER BY total_area DESC 
LIMIT 20;

-- 5. Diversidad étnica por departamento
SELECT 
    department,
    COUNT(DISTINCT indigenous_people) as ethnic_diversity,
    STRING_AGG(DISTINCT indigenous_people, ', ' ORDER BY indigenous_people) as peoples
FROM indigenous_reserves 
GROUP BY department 
ORDER BY ethnic_diversity DESC;

-- 6. Verificar relación con municipios
SELECT 
    r.name as reserve_name,
    r.municipality as reserve_municipality,
    m.name as municipality_name,
    CASE 
        WHEN m.cod_dane IS NULL THEN '❌ Sin municipio relacionado'
        ELSE '✅ Municipio relacionado'
    END as relationship_status
FROM indigenous_reserves r
LEFT JOIN municipalities m ON r.municipality_cod_dane = m.cod_dane
WHERE r.municipality_cod_dane IS NOT NULL
ORDER BY relationship_status, r.name
LIMIT 50;
