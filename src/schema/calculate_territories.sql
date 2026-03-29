CREATE OR REPLACE FUNCTION calculate_territory_geom()
RETURNS void AS $$
BEGIN
  -- Actualizar territory_geom para cada municipio creando un círculo alrededor del punto
  UPDATE municipalities 
  SET territory_geom = ST_Multi(
    ST_Buffer(
      ST_Transform(
        ST_SetSRID(ST_MakePoint(lon::float, lat::float), 4326),
        3857
      )::geography,
      5000 -- Radio en metros (5km)
    )::geometry
  )::geometry(MultiPolygon, 4326)
  WHERE lat IS NOT NULL AND lon IS NOT NULL;
END;
$$ LANGUAGE plpgsql;
