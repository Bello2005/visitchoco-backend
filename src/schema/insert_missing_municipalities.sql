-- Insertar municipios faltantes para los resguardos indígenas
INSERT INTO municipalities (
    name,
    cod_dane,
    zone,
    created_at,
    updated_at
) VALUES 
('Bagadó', '27413', 'CHOCÓ', NOW(), NOW()),
('Barrancas', '44078', 'LA GUAJIRA', NOW(), NOW()),
('Puerto Carreño', '99001', 'VICHADA', NOW(), NOW()),
('Buenaventura', '76109', 'VALLE DEL CAUCA', NOW(), NOW()),
('Hato Corozal', '85125', 'CASANARE', NOW(), NOW())
ON CONFLICT (cod_dane) DO NOTHING;

-- Verificar la inserción
SELECT cod_dane, name, zone 
FROM municipalities 
WHERE cod_dane IN ('27413', '44078', '99001', '76109', '85125');
