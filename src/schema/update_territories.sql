-- Script para actualizar los límites territoriales de los municipios
ALTER TABLE municipalities
ALTER COLUMN territory_geom TYPE geometry(MultiPolygon, 4326);

-- Asegurarnos de que PostGIS está instalado
CREATE EXTENSION IF NOT EXISTS postgis;

-- Actualizar los límites territoriales
-- Nota: Estos son ejemplos, necesitarás reemplazarlos con los polígonos reales de cada municipio
UPDATE municipalities
SET territory_geom = ST_Multi(ST_GeomFromText('POLYGON((-76.7583 5.7919, -76.7583 5.8919, -76.6583 5.8919, -76.6583 5.7919, -76.7583 5.7919))', 4326))
WHERE name = 'Quibdó';

-- Aquí agregarías más municipios
-- UPDATE municipalities
-- SET territory_geom = ST_Multi(ST_GeomFromText('POLYGON(...)', 4326))
-- WHERE name = 'Otro Municipio';
