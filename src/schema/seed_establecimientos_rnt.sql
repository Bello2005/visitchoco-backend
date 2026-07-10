-- ============================================================
-- Seed de establecimientos — Registro Nacional de Turismo (RNT)
-- Fuente: BASE DE DATOS DE RNT.xlsx — Cámara de Comercio del Chocó
-- Generado: 2026-07-10 por scripts/generate-rnt-seed.ts (NO editar a mano)
-- Total de INSERTs: 602
--   (omitidas por estado != ACTIVO: 0, por RNT duplicado: 0)
--
-- Orden: si la tabla aún no tiene columna slug, correr PRIMERO
-- src/schema/2026_07_slug_establecimientos.sql. Luego este seed.
-- Idempotente: cada INSERT se salta si ya existe una fila con el mismo rnt.
--
-- Verificación: correr este SELECT antes y después del seed
--   SELECT COUNT(*) FROM establecimientos;
-- ============================================================

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JHON  BERRIO DOMINGUEZ', 'jhon-berrio-dominguez-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3178364486', 'jhonberrioguiaespiritual@gmail.com', 'capurgana barrio las palmas', '261288', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '261288')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA LAS PALMERAS', 'posada-nativa-las-palmeras-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3173582830', 'karenjara9905@gmail.com', 'CORREGIMIENTO PANGUI RIO MUERTEROS SECTOR MANGLARES', '260694', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '260694')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JAGUIRA TRAVEL- AGENCY', 'jaguira-travel-agency-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3134397401', 'diegojaguira2025@gmail.com', 'BARRIO PLAN PAREJO CORR CAPURGANA', '260473', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '260473')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE LAS CONSENTIDAS', 'hospedaje-las-consentidas-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104217189', 'conce123perez@gmail.com', 'CALLE LA POLICIA CORR CAPURGANA', '260447', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '260447')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LA MARTINA ECOLODGE', 'la-martina-ecolodge-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3126463451', 'lamartinatravelsas@hotmail.com', 'NO ME OLVIDES - PLAYA GUACHALITO NUQUI COL', '260437', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '260437')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA OPERADORA A MAR Y SELVA', 'agencia-operadora-a-mar-y-selva-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3113078481', 'vedaamaryselva@gmail.com', 'BARRIO LA UNIÓN', '260416', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '260416')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA TURISTICA LOS ROJALES PEÑALOZA', 'cabana-turistica-los-rojales-penaloza-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3222820091', 'jairoroma47@hotmail.com', 'SECTOR LA CANCHA CORR PEÑALOZA', '259602', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '259602')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YERSON  CORDOBA DIAZ', 'yerson-cordoba-diaz-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3008915380', 'rapdominicano1996@gmail.com', 'TERMALES agua caliente', '258829', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '258829')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL ''BAJIRA CENTER HOUS''', 'hotel-bajira-center-hous-riosucio', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3128397873', 'marivelmc@hotmail.com', 'CORREGIMIENTO BELEN DE BAJIRA', '258686', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '258686')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL CORAL BAHIA', 'hotel-el-coral-bahia-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3122184639', 'lisedauxgh8va.region@gmail.com', 'B/FILLO CASTRO', '257901', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '257901')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA THE MARIA''S', 'cabana-the-maria-s-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3108511391', 'themariastravel@gmail.com', 'CALLE LAS MARIAS CORR CAPURGANA', '257398', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '257398')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JESUCITA  SANCHEZ PALACIOS', 'jesucita-sanchez-palacios-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3216960061', 'mazitapalacios@gmail.com', 'BARRIO LA UNION QUEDA EN LA ZONA HOTELERA,A DOS CUADRAS DE LA PLAYA Y A DOS CUADRAS DEL AEROPUERTO', '256678', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '256678')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'COOPERATIVA MULTIACTIVA UNIVERSITARIA PARA LA FINANCIACION Y EJECUCION DE PROYECTOS DE INVERSION', 'cooperativa-multiactiva-universitaria-para-la-financiacion-y-ejecucion-de-proyectos-de-inversion-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3205588599', 'farmaexpressla30@hotmail.com', 'CALLE 26 # 11 - 9 PISO 2', '256675', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '256675')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CENTRO TURISTICO LOS ANTURIOS', 'centro-turistico-los-anturios-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3137098707', 'prosmume9026@hotmail.com', 'CORREGIMIENTO DE JURUBIRA A 20 MINUTOS DEL CASCO URBANO', '256196', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '256196')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LUCY MARGOTH PALACIOS AGUDELO', 'lucy-margoth-palacios-agudelo-quibdo', 'guia_turismo', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3218744101', 'lucymargothpalaciosagudelo@gmail.com', 'CL REAL CA 1 P 2 BRR NIÑO JESUS', '256075', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '256075')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA PEREZ NAYIBE MILENA', 'mosquera-perez-nayibe-milena-quibdo', 'guia_turismo', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6716791', 'nayi.mosquera123@gmail.com', NULL, '256074', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '256074')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BLACK SANDS FISHING', 'black-sands-fishing-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '4481458', 'bsfishing2018@gmail.com', 'PARAJE PARIDERA DEL CORREGIMIENTO DE HUACA', '255681', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '255681')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VALENCIA VALENCIA DANIEL', 'valencia-valencia-daniel-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3226372441', 'valenciadaniel135@gmail.com', 'ZONA TERMALES  - Nawala EcoHostel', '255540', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '255540')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SAN LUIS R', 'hotel-san-luis-r-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3136266782', 'wrodas6@gmail.com', 'CRA 10 # 26-07', '255520', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '255520')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YEISON  GONZALEZ GOMEZ', 'yeison-gonzalez-gomez-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3014545120', 'yeison.ygg29@gmail.com', 'DEPARTAMENTO DEL CHOCÓ, MUNICIPIO ACANDÍ, CORREGIMIENTO CAPURGANÁ, VIA EL CIELO SECTOR LAS MARIAS', '254945', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '254945')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VICHE CUPIQUEÑO QUINTA CAÑA', 'viche-cupiqueno-quinta-cana-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3226062422', 'yussekaro132@gmail.com', 'BARRIO PANQUIACO', '254397', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '254397')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL VISTA AL MAR CAPURGANA', 'hotel-vista-al-mar-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3105818334', 'pachecomarce@hotmail.com', 'CALLE PRINCIPAL CORR CAPURGANA', '254334', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '254334')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DIAZ RUIZ EUGENIA', 'diaz-ruiz-eugenia-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3126510143', 'everperead@gmail.com', 'CALLE OESTE OESTE OESTE Termales casa Eugenia', '253890', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253890')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YUDISA  SAAVEDRA PANDALES', 'yudisa-saavedra-pandales-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3212118649', 'juzaa20@hotmail.com', 'barrio los andes- urbano', '253800', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253800')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'XIOMARA  CUCALON PEREA', 'xiomara-cucalon-perea-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3135308319', 'xiocupe@hotmail.com', 'CARRETERA 1 # -1 AEROPUERTO CERCA adelante del hostal las flores', '253798', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253798')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CUEVITA PARADISE LODGE', 'cuevita-paradise-lodge-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3102474663', 'inverpacsas@gmail.com', 'PLAYA CUEVITA, FINCA ADELIN', '253726', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253726')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EDDY MARISOL DIAZ MONTENEGRO', 'eddy-marisol-diaz-montenegro-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3164026841', 'ednisol424@gmail.com', 'Corregimiento Capurgana, Barrio la Carolina', '253659', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253659')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RIVERO AGUILAR VIVIAN PAOLA', 'rivero-aguilar-vivian-paola-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3225440230', 'vivianprivero@gmail.com', 'corregimiento termales, neco', '253447', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253447')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES PEREA Y CIA LTDA', 'agencia-de-viajes-perea-y-cia-ltda-istmina', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3112460328', 'franpero_30@hotmail.com', 'CARRERA 19  40  16 SECTOR LA 70', '253434', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '253434')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA SAZÓN COQUE', 'posada-turistica-sazon-coque-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3218656387', 'evacmomar26@gmail.com', 'CORREGIMIENTO DE COQUE MUNICIPIO NUQUI', '252859', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '252859')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE PLAYA HONDA CAPURGANA', 'hospedaje-playa-honda-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146534741', 'hospedajeplayahondacapurgana@gmail.com', 'PLAYA PESCADORES CAPURGANA', '252854', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '252854')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SOÑAR DESTINOS', 'sonar-destinos-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3148822224', 'elemos2804@gmail.com', 'CARRERA 10 CALLE 28 Y 29 BARRIO SAN JUDAS', '252379', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '252379')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EDEN PACIFICO', 'eden-pacifico-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3126676336', 'edenpacificocupica@gmail.com', 'CORREGIMIENTO DE BAHIA CUPICA', '252071', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '252071')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EDEN PACIFICO', 'eden-pacifico-bahia-solano-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3126676336', 'edenpacificocupica@gmail.com', 'CORREGIMIENTO DE BAHIA CUPICA', '252068', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '252068')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BAHIA SOLANO SALVAJE', 'bahia-solano-salvaje-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3104392689', 'facostab@ucentral.edu.co', 'CARRERA         2          3  26', '251928', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251928')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VERDERUTA S.A.S', 'verderuta-s-a-s-istmina', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3215396775', 'verderutasas@gmail.com', 'CRA 8 BRR CUBIS', '251923', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251923')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL JUKEN', 'hotel-juken-certegui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('CERTEGUI'))), '3227579567', 'juancamilorr05@gmail.com', 'BARRIO CANDELARIA AL LADO DEL CENTRO RECREACIONAL CEDREPAZ', '251891', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251891')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YENY CECILIA MOLINA MORALES', 'yeny-cecilia-molina-morales-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '5216318', 'jcmolina361@hotmail.com', 'CALLE 1 A # 1B', '251657', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251657')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DESPIERTA Y SALYA TURISMO DE BIENESTAR', 'despierta-y-salya-turismo-de-bienestar-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3187123994', 'illenncikasesora@live.com', 'BARRIO LAS PALMERAS CORR CAPURGANA', '251459', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251459')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LIPSY PATRICIA ROJAS ARANGO', 'lipsy-patricia-rojas-arango-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3147995652', 'lipsypatricia@gmail.com', 'CALLE SECTOR La Armada', '251214', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251214')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL VIVO POR ELLA', 'hotel-vivo-por-ella-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3128761358', 'hvivoporella@outlook.com', 'BARRIO PLAN PAREJO CORR CAPURGANA', '251203', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251203')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EL NIDO DEL AVE', 'el-nido-del-ave-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3181973144', 'fernelisrios3@gmail.com', 'CRR PANGUI  CL PRINCIPAL', '251028', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '251028')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES KANOA TOURS', 'agencia-de-viajes-kanoa-tours-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3118883973', 'selvaancachi@gmail.com', 'BARRIO SAN TANDER', '250990', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '250990')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHOIBA', 'choiba-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3218786219', 'chocochoiba@gmail.com', 'PLAYA AMARGAL ARUSI', '250409', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '250409')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DONDE EL MOCHO TURISMO S.A.S', 'donde-el-mocho-turismo-s-a-s-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3225116346', 'dondeelmochosas@hotmail.com', 'CORREGIMIENTO DE CAPURGANA', '250263', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '250263')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DAVID PLAZA ACANDI', 'david-plaza-acandi-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3113687853', 'hoteldavidplaza@gmail.com', 'CRA 2 # 112 SEC PLAYA', '250119', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '250119')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SANTA BARBARA CHOCO', 'hotel-santa-barbara-choco-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3137157677', 'jjgraciame@gmail.com', 'CARRERA 2  24 A 57', '250056', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '250056')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA HOTEL SOL DE KEMAYU CAPURGANA', 'casa-hotel-sol-de-kemayu-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3122738367', 'kemayucapurgana@hotmail.com', 'BARRIO LAS PALMAS, CAPURGANA', '249225', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '249225')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL DESTINOS DEL PACIFICO', 'hotel-destinos-del-pacifico-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3214366464', 'hoteldestinosdelpacifico@gmail.com', 'PLAYA EL ALMEJAL VALLE CHOCO', '249083', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '249083')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'INKA HOME CHOCO', 'inka-home-choco-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3014947835', 'lapagaro@hotmail.com', 'CORREGIMIENTO DEL VALLE', '248983', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248983')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TORTUGAS DE BAHIA SOLANO', 'tortugas-de-bahia-solano-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127031914', 'nodlamcamaljulio@gmail.com', 'CORREGIMIENTO VALLE', '248964', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248964')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SOLANA MAR Y TIERRA', 'hotel-solana-mar-y-tierra-bahia-solano', 'hotel', 'apartahotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3136560920', 'raulhoyosa@gmail.com', 'PLAYA LARGA, BAHÍA SOLANO, CHOCÓ', '248420', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248420')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARYURI  RESTREPO MORALES', 'maryuri-restrepo-morales-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3164784415', 'maryurirestrepo64@gmail.com', 'CASA Ubicada en el corregimiento de Coqui, a 240 metros del restaurante Zotea', '248353', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248353')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHOCÓ PRIDE', 'choco-pride-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3122845499', 'elsediaz11901@gmail.com', 'CALLE PRINCIPAL CORR CAPURGANA', '248291', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248291')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA CACHALOTE HAUSE', 'posada-cachalote-hause-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3134765974', 'felipecachalotehause@gmail.com', 'CORREGIMIENTO EL VALLE', '248240', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248240')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS MANGLENATO', 'cabanas-manglenato-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3166935776', 'juliotobon@gmail.com', 'CORREGIMIENTO DEL VALLE EN BAHIA', '248095', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '248095')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OROPENDOLA TROPICAL # 1', 'oropendola-tropical-1-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3053369479', 'oropendolatropical@gmail.com', 'CALLE 18  NO. 22 A 20', '247812', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '247812')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ROJAS LEYVA FRANCISCO', 'rojas-leyva-francisco-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3008579828', 'Francisco.rojaslaw@gmail.com', 'Finca las flores al pie de finca la Diana, corregimiento de sapzurro', '247715', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '247715')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'FIGUEROA TOUR 1 S.A.S UIB', 'figueroa-tour-1-s-a-s-uib-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3116017155', 'figueroatours1@gmail.com', 'BARRIO JARDIN / SECTOR LOS GUADUALES', '246943', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '246943')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL Y CASA CULTURAL AMORARTE', 'hostal-y-casa-cultural-amorarte-nuevo-belen-de-bajira', 'hotel', 'vivienda_turistica', NULL, '3153113044', 'bormanldc@gmail.com', 'CORREGIMIENTO DE COQUI MUNICIPIO DE NUQUI', '246687', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '246687')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LA SEXTA DE QUIBDO', 'hotel-la-sexta-de-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147144236', 'mauricioperezpareja@yahoo.com', 'CARRERA         6         26  32 BRR ALAMEDA REYES', '246454', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '246454')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RIOS Y PAISAJES TOURS S.A.S', 'rios-y-paisajes-tours-s-a-s-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3235150733', 'paisajesriostours@gmail.com', 'EL VALLE B/ SOLANO', '245476', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '245476')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MI CABAÑA EL MADERAL', 'mi-cabana-el-maderal-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3178980880', 'turismoalamar@gmail.com', 'BRR LAS FLORES CAPURGANA', '245332', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '245332')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'IRACAS DEL MAR', 'iracas-del-mar-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3155771730', 'iracasjaramillo25@gmail.com', 'SECTOR LA PLAYA', '245070', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '245070')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANDRES FELIPE MUÑOZ VELEZ', 'andres-felipe-munoz-velez-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104457216', 'andresmunoz85@gmail.com', 'DIAGONAL 1 K # 1K', '244982', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '244982')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANDRES FELIPE MUÑOZ VELEZ', 'andres-felipe-munoz-velez-acandi-2', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104457216', 'andresmunoz85@gmail.com', 'CALLE 1 A # 1', '244609', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '244609')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BRISAS DEL ATRATO', 'hotel-brisas-del-atrato-el-carmen', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3126661659', 'diana192526@gmail.com', 'CALLE CORAZON DE MARIA', '244540', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '244540')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE Y TRANSPORTE DOÑA NORE', 'hospedaje-y-transporte-dona-nore-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3207861365', 'noreya@hotmail.com', 'CORREGIMIENTO DE ARUSI DE NUQUI CHOCO', '244533', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '244533')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POR EL MUNDO VIAJES Y TURISMO', 'por-el-mundo-viajes-y-turismo-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3163253589', 'porelmundoviajesyturismo@gmail.com', 'CARRERA 8  25  08 BR ALAMEDA', '244357', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '244357')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA LAS PALMAS', 'posada-turistica-las-palmas-nuqui', 'hotel', 'glamping', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3105586372', 'mersivivi123@hotmail.com', 'GUACHALITO', '244068', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '244068')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SAPZURRO LA POSADA HOSTAL', 'sapzurro-la-posada-hostal-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104102245', 'contacto@sapzurrolaposada.com', 'CALLE CRUZ DE MAYO CORR SAPZURRO', '243916', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243916')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA MARAZUL', 'cabana-marazul-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3013002575', 'jrcabanamarazul@hotmail.com', 'CALLE CAMINO A LA MIEL CORR SAPZURRO', '243913', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243913')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE EL DESCANSO CAPURGANA', 'hospedaje-el-descanso-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3128575031', 'adriana5borrero@gmail.com', 'CALLE LAS PALMAS   CORR CAPURGANA', '243903', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243903')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BLUEBAYOU LAS NOREÑA', 'bluebayou-las-norena-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3206100499', 'norenarojaskrena@outlook.com', 'CORREGIMIENTO CAPURGANA PLAN PAREJO', '243899', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243899')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LA MARTINA ECOLODGE', 'la-martina-ecolodge-nuqui-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3126463451', 'lamartinatravelsas@hotmail.com', 'NO ME OLVIDES - PLAYA GUACHALITO NUQUI COL', '243415', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243415')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL VIAJEROS DEL SAN JUAN', 'hotel-viajeros-del-san-juan-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3154911206', 'pabloz27@hotmail.es', 'CALLE DEL COMERCIO PISO 2', '243367', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243367')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PARQUEADERO Y ARRENDO DE HABITACIONES SANTA MARTA', 'parqueadero-y-arrendo-de-habitaciones-santa-marta-el-carmen', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3108250014', 'inmava61@gmail.com', 'VEREDA EL SIETE DEL CARMEN', '243291', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243291')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BEATRIZ EUGENIA AGUDELO VASQUEZ', 'beatriz-eugenia-agudelo-vasquez-el-carmen', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3103982131', 'beatrizeugenia.agudelo@gmail.com', 'VEREDA EL SIETE', '243201', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '243201')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE LAS TRES L', 'hospedaje-las-tres-l-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3147927836', 'juvenalpardo62@gmail.com', 'BARRIO BUENOS AIRES CAPURGANA', '242814', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242814')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES ROMA', 'agencia-de-viajes-roma-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3506120463', 'cesarmq28@hotmail.com', 'CALLE 27  2  28 LOCAL 5 BARRIO ROMA', '242594', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242594')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGUDELO HOLGUIN JENNY DAJHANA', 'agudelo-holguin-jenny-dajhana-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3218753893', 'infoplayalodgeelalmejal@gmail.com', 'PLAYA ALMEJAL EN EL VALLE BAHIA SOLANO', '242459', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242459')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CORDOBA MOSQUERA ESMERALDA', 'cordoba-mosquera-esmeralda-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3135388751', 'meyicormos@gmail.com', 'CORREGIMIENTO EL VALLE BAHIA SOLANO PLAYA', '242457', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242457')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PARAISO BLANCO ECOLODGE', 'paraiso-blanco-ecolodge-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3207218052', 'liina_172013@hotmail.com', 'CORREGIMIENTO ISLA ENSENADA UTRIA', '242331', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242331')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA COSTA YANETH', 'casa-costa-yaneth-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3013327495', 'samuelbros@hotmail.com', 'CALLE LA ARROCERA CENTRO', '242329', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242329')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AMANECER VIAJES Y TURISMO', 'amanecer-viajes-y-turismo-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3006123074', 'viejanana@gmail.com', 'CALLE        24          4  18', '242280', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242280')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'THE PELICAN HOUSE HOSTEL', 'the-pelican-house-hostel-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3114290660', 'emanueleza@yahoo.it', 'PLAYA EL ALMEJAL', '242191', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242191')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL NUEVO SOL', 'hostal-nuevo-sol-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3135874800', 'hostalnuevosol@gmail.com', 'BARRIO LA CAROLINA CORR CAPURGANA', '242027', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '242027')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SANTA CRUZ D.E', 'hotel-santa-cruz-d-e-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3142593443', 'contabilidadhotelsantacruz@gmail.com', 'CALLE        25          3  28 P 2', '241798', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '241798')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CENTRO DE SERVICIOS TURÍSTICOS ICHOTUR', 'centro-de-servicios-turisticos-ichotur-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3225344573', 'ichotur@gmail.com', 'CORREGIMIENTO SAN FRANCISCO DE ICHO', '241774', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '241774')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ELCY MARITZA ROBLEDO BONILLA', 'elcy-maritza-robledo-bonilla-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '2538430', 'elcyrobledo@yahoo.es', 'CARRERA 9 # 29 BARRIO EL SILENCIO', '241569', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '241569')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ISAZA ISAZA CESAR MAURICIO', 'isaza-isaza-cesar-mauricio-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3108338979', 'cemaispez@gmail.com', 'Paraje Terco termales Nuqui  CASA RIO TERCO', '241135', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '241135')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESIDENCIA Y CAFETERÍA LOS PALITOS', 'residencia-y-cafeteria-los-palitos-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3148293974', 'josealomiaz1994@gmail.com', 'BARRIO EL CARMEN', '240969', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '240969')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTELECOSUITES', 'hotelecosuites-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3128389962', 'hotelecosuitej@gmail.com', 'CALLE 25  NO. 4  38', '240763', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '240763')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DANIEL FELIPE LONDOÑO OCHOA', 'daniel-felipe-londono-ochoa-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3153244632', 'dani.london.8a@gmail.com', 'ZONA San Francisco, Chocó', '240502', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '240502')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DUNAS PARTY', 'dunas-party-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3113772072', 'jasminparra91@iclud.com', 'CRA 9 N 2-10 POBLADO', '240496', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '240496')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASTILLO CASTRO LTDA - SATENA ACANDI', 'castillo-castro-ltda-satena-acandi-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3134453653', 'deprisauib1@yahoo.com', 'CALLE SANTANDER', '240185', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '240185')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA HOTEL EL TIEMPO', 'casa-hotel-el-tiempo-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3175395652', 'jhoaosorio@iclood.com', 'BARRIO CAMPO ALEGRE CORR CAPURGANA', '240076', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '240076')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL EL UVITO CAPURGANÁ', 'hostal-el-uvito-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3214994933', 'jesusdavidpertuz2019@gmail.com', 'CALLE PRINCIPAL CAPURGANA', '239814', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '239814')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SELVATOUR DEL PACIFICO', 'selvatour-del-pacifico-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3217464449', 'odetteabadiabechara@gmail.com', 'CORREGIMIENTO DEL VALLE', '239773', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '239773')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA CACHALOTE', 'posada-cachalote-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3174727973', 'mirnak.angulo22@gmail.com', 'CORREGIMIENTO DE PANGUI MUNI NUQUI', '239633', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '239633')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANDRES DAVID LOPEZ LLANES', 'andres-david-lopez-llanes-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3145071834', 'andelop2000@hotmail.com', 'CALLE 9 A # 9', '239092', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '239092')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA VILLA AGUA LUNA', 'cabana-villa-agua-luna-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3164680651', 'cabanavillaagualuna@gmail.com', 'CALLE PLAYA LA CALETA CORR CAPURGANA', '238924', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '238924')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NATIVOTOURS', 'nativotours-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3022218867', 'nativo58@hotmail.com', 'CORREGIMIENTO DEL VALLE EN BAHIA SOLANO', '238843', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '238843')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SELVAMARINA ADVENTURE', 'selvamarina-adventure-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3232119050', 'samijalin@hotmail.com', 'PLAYA HUINA', '238719', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '238719')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES Y TURISMOS PLANEAR VOLAR', 'agencia-de-viajes-y-turismos-planear-volar-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3216131995', 'agenciadeviajesplanearvolar@gmail.com', 'CRA 2 # 24A - 35', '238369', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '238369')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL BRALGIJON', 'hostal-bralgijon-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3154847646', 'nancor3@hotmail.com', 'BARRIO PLAN PAREJO CORR CAPURGANA', '238251', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '238251')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OPERADORA DE TURISMO MIRAMAR', 'operadora-de-turismo-miramar-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3148116046', 'miramarot@gmail.com', 'MUELLE PRINCIPAL CAPURGANA', '237921', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237921')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JUAN ANDRES HERRERA URIBE', 'juan-andres-herrera-uribe-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3132683065', 'juanherrerau@gmail.com', 'CALLE 1 LOTE 1 Arusí-Nuqui Chocó', '237784', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237784')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YINETH  ROBLEDO QUEJADA', 'yineth-robledo-quejada-quibdo', 'guia_turismo', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147773402', 'yineth1020@gmail.com', 'BRR SANTO DOMINGO CERCA CEMENTERIO', '237650', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237650')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SARLY LEIDYS QUIÑONEZ MOSQUERA', 'sarly-leidys-quinonez-mosquera-quibdo', 'guia_turismo', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3207210138', 'sarlemus5@yahoo.es', 'C R 22 C L 19   106 AP 1 P 1', '237648', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237648')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'FUNDACION MAREIA', 'fundacion-mareia-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217581997', 'mareia.fundacion@gmail.com', 'CARRERA 4 # 30 - 19 EDIFICIO Sutizora Tercer Piso - Wontanara', '237439', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237439')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL VILLA REAL DE QUIBDO N° 1', 'hotel-villa-real-de-quibdo-n-1-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3105268605', 'hvillarealquibdo1@gmail.com', 'CALLE 26  NO. 5  46 B/ ALAMEDA REYIS', '237118', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237118')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL VILLA ESMERALDA', 'hotel-villa-esmeralda-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3113867745', 'natu-0615@hotmail.com', 'CARRERA         5         25  55 BRR ALAMEDA', '237107', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237107')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LADY MAR', 'hotel-lady-mar-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3208327421', 'carlosmurillo29@outlook.com', 'B/ROMA 10 MINUTOS DEL AEROPUERTO', '237098', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '237098')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOHOTEL MAR Y AGUA', 'ecohotel-mar-y-agua-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3104943726', 'franjavier22@hotmail.com', 'BARRIO CHOCOLATAL BAHIA SOLANO', '236551', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '236551')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'IRMA LUCY SANCHEZ TEJADA', 'irma-lucy-sanchez-tejada-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3188086592', 'irmasanchez8@gmail.com', 'En la primera línea de playa bonita en el corregimiento de Joví', '236543', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '236543')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES SIABATOURS', 'agencia-de-viajes-siabatours-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3225683699', 'siacay26@gmail.com', 'CALLE 26  NO. 8  08 PISO 2', '235999', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '235999')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AROMAS Y SABORES MERLYN', 'aromas-y-sabores-merlyn-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3235069195', 'sernpinca12@gmail.com', 'CARRERA         4         27  28 BRR CRISTO REY', '235927', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '235927')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALMACÉN J&F', 'almacen-j-f-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3123289407', 'jfredyu30@gmail.com', 'CALLE 25 # 5-14 BARRIO YESCA GRANDE', '235885', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '235885')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PARQUE MIRADOR AGROFORESTAL', 'parque-mirador-agroforestal-acandi', 'hotel', 'glamping', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3117600391', 'nebapo57@hotmail.com', 'VÍA CAPURGANA SAPZAURRO', '235644', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '235644')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL VIAJERO DE QUIBDO', 'hotel-el-viajero-de-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3144216871', 'monicaposadat30@gmail.com', 'CARRERA 2  NO. 24  69 B/ YESCA GRANDE', '235631', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '235631')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALEJANDRO ANTONIO ARBELAEZ MENDOZA', 'alejandro-antonio-arbelaez-mendoza-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '6043515525', 'alejandroarbelaez1969@gmail.com', 'Barrio El  Carmen- Via a la ESSO', '235613', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '235613')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ORIGEN ZELVAMAR', 'origen-zelvamar-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3122154029', 'joherlatinjazz@hotmail.com', 'CORR EL VALLEPLAYA CUEVITAKM3SECQUEBRADA COREDO', '234965', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234965')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL COLONIAL DE ISTMINA', 'hotel-colonial-de-istmina-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3108249692', 'hotelcolonial2018@gmail.com', 'CARRERA 6 A 24  43', '234805', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234805')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'COMITE 2 DE MAYO', 'comite-2-de-mayo-bojaya-bellavista', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BOJAYA'))), '3117146228', 'comite2demayo2002@gmail.com', 'CALLE 1 # 2 - 4 Barrio la Union Sector el Mirador', '234702', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234702')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JENNY''S FEEL ZAPATA MUÑOZ', 'jenny-s-feel-zapata-munoz-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3107667908', 'ecohotelkirita@gmail.com', 'CORREGIMIENTO DE  MECANA MUNICIPIO DE BAHIA SOLANO', '234551', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234551')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NAIME YANYNE POSSO VALOYES', 'naime-yanyne-posso-valoyes-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3215597907', 'gerencia@oropendolatropical.com', 'CALLE PRINCIPAL BARRIO UNION', '234504', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234504')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS LOS MANGLARES', 'cabanas-los-manglares-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3135701598', 'yeirymoscoso1@gmail.com', 'CRR EL VALLE BARRIO LA INVASION', '234378', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234378')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RECREARTE TOURS', 'recrearte-tours-quibdo', 'otro', 'operadores profesionales de congresos, ferias y convenciones', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6714170', 'donaldoeventosybanquetes@gmail.com donaldoeventosylogisticasas@hotmail.com', 'CALLE 22  12  - 27', '234284', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234284')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ASOCIACION ECO-MEDIO AMBIENTAL', 'asociacion-eco-medio-ambiental-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3226579891', 'ecotur1484@gmail.com', 'CORREGIMIENTO DE SAN FRANCISCO DE ICHO', '234043', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234043')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ASOCIACION ECO-MEDIO AMBIENTAL', 'asociacion-eco-medio-ambiental-quibdo-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3226579891', 'ecotur1484@gmail.com', 'CORREGIMIENTO DE SAN FRANCISCO DE ICHO', '234042', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '234042')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARISOL  SANCHEZ SANCHEZ', 'marisol-sanchez-sanchez-el-carmen', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3117424240', 'marisolsanches2015@hotmail.com', 'VEREDA GUADUAS. FINCA EL PEDRAL', '233789', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233789')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GUSTAVO ADOLFO VELEZ VASQUEZ', 'gustavo-adolfo-velez-vasquez-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '6043128141', 'contabilidad@livseguros.com', 'Playa Mecana - Cabaña Rincón del Alma', '233731', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233731')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESTAURANTE EL PUNTO CLAVE DE RIOSUCIO', 'restaurante-el-punto-clave-de-riosucio-riosucio', 'otro', 'establecimientos de gastronomía', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3226832463', 'analuisaramirezflorez@yahoo.es', 'SEGUNDA CALLE', '233722', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233722')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESTAURANTE BAR Y CAFETERIA EL RINCON ANCESTRAL', 'restaurante-bar-y-cafeteria-el-rincon-ancestral-riosucio', 'otro', 'establecimientos de gastronomía', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3225648206', 'murillocucha23@gmail.com', 'B/ CENTRO CLL PRINCIPAL', '233719', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233719')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESTAURANTE BAR Y CAFETERIA EL RINCON ANCESTRAL', 'restaurante-bar-y-cafeteria-el-rincon-ancestral-riosucio-2', 'otro', 'establecimientos de gastronomía', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3225648206', 'murillocucha23@gmail.com', 'B/ CENTRO CLL PRINCIPAL', '233710', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233710')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CORPORACIÓN AMBIENTAL Y TURISTICA DEL PACIFICO Y EL CARIBE COLOMBIANO', 'corporacion-ambiental-y-turistica-del-pacifico-y-el-caribe-colombiano-quibdo', 'otro', 'operadores profesionales de congresos, ferias y convenciones', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217780117', 'neilarivas@gmail.com', 'CALLE 25 A 11  - 04', '233702', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233702')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LAS PEÑAS', 'hotel-las-penas-riosucio', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3106231076', 'air.esteban@hotmail.com', 'BARRIO ESCOLAR', '233687', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233687')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PENSION NACHO', 'pension-nacho-riosucio', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3216474571', 'licenia1296@hotmail.com', 'CALLE PRINCIPAL', '233661', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233661')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS TUCAN', 'cabanas-tucan-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146258754', 'cabanatucan@hotmail.com', 'SECTOR PLAN PAREJO CAPURGANA', '233454', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233454')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JOSE LUIS SOLANO OSPINO', 'jose-luis-solano-ospino-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '6015510038', 'joselsolano@gmail.com', 'CALLE 1 # 1 Calle 1 Casa 1 Pangui', '233444', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233444')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BRISAS DEL ATRATO RIOSUCIO', 'hotel-brisas-del-atrato-riosucio-riosucio', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3146155048', 'libiaamparoortiz@gmail.com', 'CALLE PRINCIPAL', '233314', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233314')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS JAVIER NUQUI', 'cabanas-javier-nuqui-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3127682533', 'javiernuqui@gmail.com', 'BARRIO ROMA', '233048', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '233048')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LUDY SANDRITH BONILLA LOPEZ', 'ludy-sandrith-bonilla-lopez-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3122029561', 'dulce-maria04@live.com.mx', 'AVENIDA CALLE 3 # 1 - 85 Barrio Las Malvinas, cerca a la quebrada', '232538', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '232538')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'INMOBILIARIA SAGRADO CORAZÓN DE JESUS SAS', 'inmobiliaria-sagrado-corazon-de-jesus-sas-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3118464160', 'inmobiliariacorazondejesus@gmail.com', 'CALLE 29 # 6 - 47 BARRIO Cesar Conto PISO 1 APARTAMENTO 101', '232410', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '232410')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GUEVARA MURILLO ENEIDA', 'guevara-murillo-eneida-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3122453178', 'posadaelesfuerzo@gmail.com', 'termales, Nuqui ,choco', '232038', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '232038')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LA POSADA DEL GECKO S.A.S.', 'la-posada-del-gecko-s-a-s-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3145256037', 'laposadadelgecko@gmail.com', 'CALLE LA IGLESIA', '231870', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '231870')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANDRES FELIPE MUÑOZ VELEZ', 'andres-felipe-munoz-velez-acandi-3', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104457216', 'andresmunoz85@gmail.com', 'CALLE 1 A NORTE # 1A NORTE capurgana', '231483', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '231483')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GINA PAOLA FLOREZ DIAZ', 'gina-paola-florez-diaz-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3122096029', 'gflorezd@hotmail.com', 'KILOMETRO 1, vìa hacia Tribuga, SECTOR La Playa', '231119', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '231119')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PLAYA SAN JUAN', 'hotel-playa-san-juan-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3102052251', 'asoconfiad1@gmail.com', 'BARRIO CUBIS SEC LAS BOMBAS', '230675', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '230675')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DEHYL S.A.S.', 'dehyl-s-a-s-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '6045914028', 'hola@sancibrian.com', 'ENTRADA Playa Bonita Sapzurro', '230628', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '230628')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA JARA', 'posada-jara-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3186705076', 'jaralaura@gmail.com', 'CORREGIMIENTO DE JOVI CALLE PRINCIPLA - FRENDE DE LA IGLESIA', '230434', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '230434')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MUSEO CAROLINA DEL MAR', 'hotel-museo-carolina-del-mar-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3104656318', 'ronaldcuriche@hotmail.com', 'BARRIO EL CARMEN', '229626', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '229626')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL LA KASONA CAPURGANA', 'hostal-la-kasona-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3154430707', 'jhonbryam515@gmail.com', 'CALLE 3  NO. 6  23', '228936', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '228936')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA LA KUMBANCHA', 'posada-la-kumbancha-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3137056289', 'lakumbancha95@gmail.com', 'CORREGIMIENTO PARTADO', '228746', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '228746')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHAVERRA OREJUELA JAIRO ENRIQUE', 'chaverra-orejuela-jairo-enrique-quibdo', 'guia_turismo', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6707760', 'jaenriquechave@hotmail.com', NULL, '226335', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '226335')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'COMIDAS NATIVAS EL CHOCOLATE', 'comidas-nativas-el-chocolate-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3186915561', 'y_i_vaca@hotmail.com', 'CORREGIMIENTO DE COQUI  BARRIO LA PLAYA', '226125', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '226125')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MELÓ PARTY HOSTEL CAPURGANA', 'melo-party-hostel-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3015448683', 'dasw16@hotmail.com', 'BARRIO PLAN PAREJO', '225958', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '225958')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YALAKU LODGE', 'yalaku-lodge-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3504735769', 'migem24@gmail.com', 'BARRIO CAMPO ALEGRE', '225957', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '225957')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA Y TRANSPORTE LA PANGUISEÑA', 'posada-y-transporte-la-panguisena-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3178177449', 'bm2214@outlook.com', 'CORREGIMIENTO PANGUI', '225723', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '225723')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA OLIVA', 'posada-oliva-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3128268378', 'isidroalvaradopalacios@gmail.com', 'CORREGIMIENTO EL VALLE VIA EL ALMEJAL', '225257', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '225257')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL RESTAURANTE Y CENTRO RECREACIONAL MELANIE', 'hotel-restaurante-y-centro-recreacional-melanie-certegui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('CERTEGUI'))), '3147558726', 'egidioteran@hotmail.com', 'VIA LAS ANIMAS', '225012', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '225012')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA OPERADORA A MAR Y SELVA', 'agencia-operadora-a-mar-y-selva-nuqui-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3113078481', 'vedaamaryselva@gmail.com', 'BARRIO LA UNIÓN', '224485', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '224485')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PLAYA SOLEDAD CAPURGANA', 'hotel-playa-soledad-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '8281282', 'fundacionbiencomuncolombia@gmail.com', 'CORR PLAYA SOLEDAD', '224269', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '224269')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHIPANTIZA PALACIOS JUANA AURA', 'chipantiza-palacios-juana-aura-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6718330', 'jchipantiza@yahoo.com', 'CARRERA 12 A # 28 - 51', '224065', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '224065')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOTURISMO CON EBLIN', 'ecoturismo-con-eblin-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3213811350', 'ecoturismoconeblin@gmail.com', 'CALLE 1  1  PRINCIPAL CORREGIMIENTO DE EL VALLE', '223966', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '223966')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALTAIR  DUQUE  TORO', 'altair-duque-toro-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3123789516', 'altair.duque@gmail.com', 'CARRERA 1 A OESTE # 2A OESTE - 1 A OESTE ZONA CORREGIMIENTO DE JURUBIRA RPW9+C5 Nuquí, Chocó', '222352', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '222352')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL ISABELLA CAPURGANA', 'hostal-isabella-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3234881689', 'm4620210@gmail.com', 'CALLE CENTRO CORR CAPURGANA', '221778', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '221778')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PACIFIC WAVES HOSTEL & SURF', 'pacific-waves-hostel-surf-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3216409424', 'erika.restrepo.vasquez@gmail.com', 'CORREGIMIENTO EL VALLE', '221630', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '221630')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CAROLINA  OLARTE MORALES', 'carolina-olarte-morales-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3136988262', 'compras@almacenesfuller.com.co', 'CALLE 30 # 16A - 124', '221373', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '221373')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VICTOR ANDRES MEZA MENA', 'victor-andres-meza-mena-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3046315085', 'victormeza41@gmail.com', 'Sapzurro Chocó, frente al parque principal', '220996', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '220996')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MENESES BARREIRO CATALINA', 'meneses-barreiro-catalina-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3105849574', 'catalinameneses17@gmail.com', 'ZONA TERMALES CASA PAL MAR', '220950', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '220950')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ASOCIACIÓN AGROPECUARIA ECOLÓGICA Y TURÍSTICA GUADUAS', 'asociacion-agropecuaria-ecologica-y-turistica-guaduas-el-carmen', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3202739248', 'agroecoturguaduas@gmail.com', 'CORREGIMIENTO DE GUADUAS MUNICPIO DEL CARMEN DE ATRATO', '220937', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '220937')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA LA VIRGEN', 'posada-turistica-la-virgen-nuqui', 'hotel', 'apartahotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3205102714', 'heylermena.83@icloud.com', 'BRR LA VIRGEN CALLE PRINCIPAL', '220480', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '220480')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASTRO VALENCIA YIRLA MAREYDA', 'castro-valencia-yirla-mareyda-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3114082018', '123castrodaniela@gmail.com', 'ZONA TERMALES', '220173', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '220173')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE PICHINDE', 'hospedaje-pichinde-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3207718865', 'geyupabe@hotmail.com', 'BARRIO LA UNIÓN AL LADO DEL OBEGA', '219683', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '219683')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PALACIOS MURILLO INDELIDA', 'palacios-murillo-indelida-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3173105853', 'lida2016pa@gmail.com', 'Corregimiento de Coqui-Casa frente a la playa', '219543', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '219543')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PIEDRA VIVA - CAPURGANA ACANDI', 'hotel-piedra-viva-capurgana-acandi-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3225775703', 'hotelpiedraviva@gmail.com', 'BARRIO LAS PALMAS', '219290', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '219290')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'IS LINE HOUSE', 'is-line-house-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '6713080', 'liapalacio222@gmail.com', 'BARRIO EL CARMEN AL FRENTE DE BIENESTAR FAMILIAR', '219221', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '219221')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MORALES DEL RIO DIEGO ROBERTO', 'morales-del-rio-diego-roberto-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104678803', 'hostalcasaalma@gmail.com', 'CORREGIMIENTO BAHIA AGUACATE', '219002', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '219002')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA MALAMBO', 'cabana-malambo-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3117190825', 'marcelogarcia25@outlook.com', 'CORREGIMIENTO TERMALES DE M NUQUI', '218995', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '218995')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SARA INES LOPEZ BETANCUR', 'sara-ines-lopez-betancur-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3212453921', 'saraines.lopez@gmail.com', 'PLAYA DE POTES', '218606', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '218606')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PETRA HOTEL', 'petra-hotel-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3214044768', 'DAVIDQP88+1@GMAIL.COM', 'CALLE 1 # 88 BARRIO LA UNION  AVENIDA EL AERO PUERTO', '218199', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '218199')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CAROLINA  OLARTE MORALES', 'carolina-olarte-morales-quibdo-2', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3136988262', 'compras@almacenesfuller.com.co', 'CALLE 30 # 16', '218161', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '218161')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA Y TRANSPORTE LOS CHEOS', 'posada-y-transporte-los-cheos-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3173595725', 'mariadellisvaldez@gmail.com', 'CORREGIMIENTO DE JOVI EN NUQUI', '217007', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '217007')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'INVERSIONES AFLOAT S.A.S', 'inversiones-afloat-s-a-s-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '6042689681', 'inversiones.afloat@gmail.com', 'PLAYA LARGA', '216853', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '216853')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASTAÑEDA MONA MARIA DEL CARMEN', 'castaneda-mona-maria-del-carmen-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3147009679', 'h.lafrontera@hotmail.com', 'CASA AVENIDA AL AEROPUERTO', '216508', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '216508')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GRAN MADRE SELVA S.A.S', 'gran-madre-selva-s-a-s-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3114569420', 'halesargin@gmail.com', 'CORREGIMIENTO DE TERMALES CLL P', '216136', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '216136')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LUCY MARIELA DIAZ CEBALLOS', 'lucy-mariela-diaz-ceballos-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3104757399', 'ldiaz@iiap.org.co', 'CARRETERA  VIA  TRIBUGA', '216077', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '216077')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BONITO AMANECER', 'bonito-amanecer-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3146838847', 'jovisena1@gmail.com', 'PLAYA GUACHALITO CORREGIMINETO DE NUQUI.', '215835', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215835')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA TURISTICA LOS ROJALES', 'cabana-turistica-los-rojales-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3117194032', 'lesbiacordobam@gmail.com', 'CORREGIMIENTO PEÑALOZA', '215736', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215736')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA JURUBIRA', 'posada-jurubira-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3146026771', 'reservas.posada.jurubira.nuqui@gmail.com', 'CORREGIMIENTO JURUBIRA', '215658', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215658')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOHOTEL IRAKA', 'ecohotel-iraka-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3105314978', 'riomarmecana@gmail.com', 'PLAYA MECANA DE BAHIA SOLANO1', '215350', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215350')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HINESTROZA LARGACHA EDDY LUZ', 'hinestroza-largacha-eddy-luz-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '6836117', 'nuquilomejor@gmail.com', 'CARRERA 3 # 4 - 32 APARTAMENTO 203 Barrio unión', '215251', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215251')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SALVAJE TRIP', 'salvaje-trip-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3206405778', 'tripsalvajetrip@gmail.com', 'CORREGIMIENTO TERMALES EN MC NUQUI', '215165', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215165')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BAHIA NATIVA', 'bahia-nativa-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3105314978', 'riomarmecana@gmail.com', 'EL CARMEN DE BAHIA SOLANO', '215139', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '215139')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NAISATOURS CONDOTO', 'naisatours-condoto-condoto', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('CONDOTO'))), '3106412012', 'naisatours@hotmail.com', 'CLL 5, CRA 7 ESQUINA', '214761', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '214761')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS BRISAS DEL MAR EL VALLE', 'cabanas-brisas-del-mar-el-valle-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3215496612', 'diliaedith@hotmail.com', 'VIA EL ALMEJAL CABAÑA 0516', '214585', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '214585')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LAS CONCHITAS DE SUCY', 'las-conchitas-de-sucy-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3235733747', 'riascosmorenomaria67@gmail.com', 'CORREGIMIENTO DE TERMALES CALLE PRINCIPAL MUNICIPIO DE NUQUI', '214404', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '214404')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EL CAPI NANDO', 'el-capi-nando-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3218153294', 'alanaelrey14@gmail.com', 'BARRIO LAS CONCHITAS', '213316', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '213316')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LOS ARRASTRES DEL RÍO', 'los-arrastres-del-rio-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3213994408', 'amove7777@gmail.com', 'CORR CAPITAN', '213263', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '213263')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JULIANA CANDELARIA GONZALEZ GIRALDO', 'juliana-candelaria-gonzalez-giraldo-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3124003548', 'candelariagonzalezgiraldo@gmail.com', 'ZONA rural  BARRIO miramar Corregimiento de arusi', '213021', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '213021')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESTAURANTE Y HOSPEDAJE PALMA DE TRUPA', 'restaurante-y-hospedaje-palma-de-trupa-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3225626849', 'palmadetrupa@gmail.com', 'CORREGIMIENTO ARUSI CALLE SEGUNDA', '211974', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '211974')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PARAISO VERDE LODGE', 'paraiso-verde-lodge-quibdo', 'hotel', 'albergue', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3234929262', 'paraisoverdetutunendo@gmail.com', 'B/ SAN ANTONIO - TUTUNENDO', '211739', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '211739')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL RUBY DE TADÓ', 'hotel-ruby-de-tado-tado', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('TADO'))), '3146051886', 'notariatado@hotmail.com', 'CALLE 5  15 A 19', '211584', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '211584')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EBATOURS', 'ebatours-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3166944899', 'neablare@gmail.com', 'CLL 24 CR 18', '211581', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '211581')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DANIELA  ACOSTA GIRALDO', 'daniela-acosta-giraldo-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '6014132', 'daniela.acosta04@gmail.com', 'CARRETERA 1 # 1 SAPZURRO', '211453', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '211453')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JENENE'' LODGE', 'jenene-lodge-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3102944065', 'jenenelodge@gmail.com', 'VEREDA GUACHALITO', '210886', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '210886')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MAGISTRAL SUITER', 'hotel-magistral-suiter-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3116313415', 'berenice2089@hotmail.com', 'CARRERA 4 N 25 - 35 BARRIO PAN DEYUCA', '209956', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '209956')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL CLAUS', 'hostal-claus-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3188875288', 'davidqp88@gmail.com', 'BARRIO LA UNION', '209462', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '209462')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MAJAGUA. MAGIA DEL PACIFICO', 'majagua-magia-del-pacifico-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3148696422', 'majagua.pacifico@gmail.com jjsernaitis@gmail.com', 'PLAYA MECANA DE BAHIA SOLANO', '208924', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '208924')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES ACANDÍ TOURS', 'agencia-de-viajes-acandi-tours-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3203085434', 'anamariagrave@gmail.com', 'CALLE HABANA', '208890', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '208890')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PACIFIC DESCUBRE', 'pacific-descubre-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3208156338', 'pacificdescubre@gmail.com', 'BARRIO CASTILLOS  # 2 MANZANA PRIMERA', '208696', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '208696')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GRUPO KAJUYALI 8 S.A.S.', 'grupo-kajuyali-8-s-a-s-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '2144011', 'mmendez@kajuyali.com', 'Entre la Punta Nabugá y Playa Las Flores. Ubicación entre  los 06º39''00,7'''' de latitud norte y 077º38''39.7'''' de latitud oeste', '208176', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '208176')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'YADIS ALEXA CUESTA PALACIOS', 'yadis-alexa-cuesta-palacios-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3107723871', 'merlinpalacios1938@gmail.com', 'CALLE 1 # 10A - 10 Barrio la Union', '208093', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '208093')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TRANSRIO ACANDÍ', 'transrio-acandi-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146886639', 'transrioacandisas@gmail.com', 'CALLE 4 1 6', '207726', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '207726')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MI FARAON', 'hotel-mi-faraon-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3122000993', 'danielalbertoarango11@gmail.com', 'CARRERA 5 CALLE 25 - 26', '207073', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '207073')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE DONDE GLORIA', 'hospedaje-donde-gloria-el-carmen', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3136905742', 'manuortiz2001@gmail.com', 'VDA EL SIETE', '206992', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '206992')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS ECOPOSADA LOS MORROS', 'cabanas-ecoposada-los-morros-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3214783566', 'dianapia.vidal@gmail.com', 'CARRETERA VÍA AEROPUERTO', '206802', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '206802')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SERRANO VANEGAS LUZ MYRIAN', 'serrano-vanegas-luz-myrian-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146665210', 'posadalapunta@gmail.com', 'La Armada', '206775', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '206775')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA EL TAMBO', 'posada-nativa-el-tambo-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3206710425', 'eltambodesofiayjulieta@gmail.com', 'CORREGIMIENTO ARUSI  - NUIQUI', '206435', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '206435')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PUNTA PINORROA GASTROBAR', 'hotel-punta-pinorroa-gastrobar-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3117274189', 'edwinsernadavid@gmail.com', 'CALLE LA PLAYA', '206308', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '206308')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GARCIA MURILLO CRISTIAN', 'garcia-murillo-cristian-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3137716370', 'kristian-14@hotmail.com', 'Playa el almejal, Punta Roca', '206062', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '206062')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES ROMA', 'agencia-de-viajes-roma-quibdo-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3506120463', 'cesarmq28@hotmail.com', 'CALLE 27  2  28 LOCAL 5 BARRIO ROMA', '205276', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '205276')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DROGUERIA, RESTAURANTE Y HOSTAL YAMI', 'drogueria-restaurante-y-hostal-yami-nuqui', 'otro', 'establecimientos de gastronomía', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3206762921', 'alba-eu@hotmail.com', 'CORREGIMIENTO DE ARUSI', '205274', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '205274')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MORADA DEL MAR', 'morada-del-mar-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3218661449', 'jesusoned17@outlook.com', 'BRR PORVENIR DE NUQUI', '205253', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '205253')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA LA VERANERA', 'posada-nativa-la-veranera-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3206618860', 'dalajaramillo802@gmail.com', 'BRR PORVENIR', '205009', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '205009')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE LIMONAR', 'hospedaje-limonar-bajo-baudo-pizarro', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAJO BAUDO'))), '3135498370', 'humbertotamayo1948@gmail.com', 'BARRIO LAS BRISAS - PIZARRO', '204788', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '204788')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA PANDALES BRUMILDA', 'mosquera-pandales-brumilda-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3193634183', 'hostalarusi2018@gmail.com', 'CALLE 1 A SUR # 1A BARRIO Arusi', '204240', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '204240')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA DOÑA CONCHA', 'posada-dona-concha-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3176589568', 'yoryinaagulo@gmail.com', 'BRR MIRAMAR DE JOVI', '204051', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '204051')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE-RESTAURANTE EL PARADOR', 'hospedaje-restaurante-el-parador-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3114241063', 'marydi3028@gmail.com', 'PUENTE CABI VIA YUTO', '202932', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202932')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE KAIROS CAPURGANA', 'hospedaje-kairos-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3122948875', 'yennyossa@yahoo.com', 'CAPURGANA CALLE PRIMERA AL LADO DE HERTOR HOUSE', '202931', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202931')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES TOUR ARANGO', 'agencia-de-viajes-tour-arango-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3114178383', 'transarango28@hotmail.com', 'CALLE 27 # 9-24 BARRIO SILENCIO', '202563', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202563')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA ECOTURISTICA Y CULTURAL CARACOLI', 'posada-ecoturistica-y-cultural-caracoli-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3173116127', 'posadacaracoli.nuqui@gmail.com', 'BARRIO SANTANDER', '202432', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202432')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MANGATA LODGE', 'mangata-lodge-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3168336601', 'claudiacossio1991@hotmail.com', 'PLAYA GUACHALITO NUQUI2', '202134', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202134')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NICHILA ECOHOTEL', 'nichila-ecohotel-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3168336601', 'claudiacossio1991@hotmail.com', 'PLAYA GUACHALITO NUQUI1', '202131', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202131')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL Y RESTAURANTE EL PORTAL LA YE', 'hotel-y-restaurante-el-portal-la-ye-union-panamericana', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('UNION PANAMERICANA'))), '3147668799', 'contadoreseqm@gmail.com', 'CARRERA LA Y', '202066', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '202066')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA VIENTOS DE YUBARTA', 'posada-turistica-vientos-de-yubarta-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3147129949', 'ameliahurtado1702@gmail.com', 'BARRIO LA UNION  DE NUQUI', '201920', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '201920')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS SONONA', 'cabanas-sonona-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3505040148', 'jovisonona@gmail.com', 'CORREGIMIENTO DE JOVI NUQ', '201871', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '201871')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PALACIOS PALACIOS JOSE ARIEL', 'palacios-palacios-jose-ariel-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3122645924', 'yatescapurgana@gmail.com', 'SECTOR El muelle', '201391', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '201391')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'WONTANARA, HOSTAL AFROCULTURAL', 'wontanara-hostal-afrocultural-quibdo', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3127656916', 'wontanara.quibdo@gmail.com', 'CARRERA 4  NO. 30  19', '201218', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '201218')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE EL CAMINO', 'hospedaje-el-camino-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3233651519', 'jhonmaximo1978@gmail.com', 'KM 7 VIA TANANDO FRENTE A LA CARCEL DE MENORES', '200913', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200913')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VIAJES VIVE MAR', 'viajes-vive-mar-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3165477475', 'adriancamilo171@gmail.com', 'CALLE 20  22  101', '200737', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200737')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE LOS FINOS', 'hospedaje-los-finos-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146187659', 'enadishernandezm7@gmail.com', 'BARRIO LOS OLIVOS CAPURGANÁ', '200735', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200735')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BELIMAR', 'hotel-belimar-el-carmen', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3122934953', 'laquicenom@gmail.com', 'CALLE CORAZON DE MARIA', '200734', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200734')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JUNÁ ECOTOURS', 'juna-ecotours-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3147830382', 'vanessajb1510@gmail.com', 'CORREGIMIENTO DEL VALLE', '200464', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200464')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA MAMA NATY', 'posada-nativa-mama-naty-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3206470327', 'dagh2010@hotmail.com', 'BARRIO PORVENIR CORREGIMIENTO DE ARUSI', '200340', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200340')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MORRO TERCO', 'morro-terco-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '4036948', 'soportecomercial@crino.com.co', 'MORRO TERCO - CORREGIMIENTO DE TERMALES', '200130', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '200130')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TIENDA & POSADA NATIVA LA CHONTADURA', 'tienda-posada-nativa-la-chontadura-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3215507529', 'lelajovi@hotmail.com', 'CORREGIMIENTO JOVÍ', '199951', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '199951')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NAISA TOURS NUQUI', 'naisa-tours-nuqui-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3106412012', 'naisatours@hotmail.com', 'BRR UNION FRENTE AL AEROPUERTO', '199824', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '199824')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA Y HELADOS VIKANA', 'cabana-y-helados-vikana-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3156944798', 'palaciosmartinezanamaria8@gmail.com', 'CORREGIMIENTO PANGUI', '199798', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '199798')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES PACIFICO AZUL LTDA', 'agencia-de-viajes-pacifico-azul-ltda-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6721515', 'pacificoazulquibdo@hotmail.com', 'CALLE 20 NO 4  - 57', '198773', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '198773')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LAS BRISAS DE ASIS', 'hotel-las-brisas-de-asis-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3206159658', 'ceneliarestrepo15@gmail.com', 'CALLE 26  4  42', '198343', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '198343')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL IMPERIO QUIBDÓ', 'hotel-el-imperio-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3043658100', 'pao_gr08@hotmail.com', 'CARRERA 5 N 21 - 26', '197939', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '197939')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LINSEY ANN RANKIN', 'linsey-ann-rankin-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3178468970', 'prana.pacifico@gmail.com', 'CASA PRANA PACIFICO. Paraje Neco, Corregimiento de Termales.', '197691', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '197691')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JUAN FELIPE SIERRA DE LA ROSA', 'juan-felipe-sierra-de-la-rosa-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3046666268', 'juanfelipesierradelarosa@gmail.com', 'AVENIDA 1 # 1 ENTRADA Boca Vieja, Coqui Boca Vieja, Coquí. Chocó', '197260', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '197260')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PARAISO VIA ICHO', 'paraiso-via-icho-quibdo', 'hotel', 'albergue', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3104392694', 'mchampion9@gmail.com', 'CORREGIMIENTO DE TUTUNENDO - VIA ICHO', '196901', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '196901')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL RAFA & MELISSA', 'hotel-rafa-melissa-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3161224124', 'riomarhotel3@gmail.com', 'NUQUI (LA PUNTA ) B/ SANTANDER', '195634', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '195634')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RIO: PUEBLO DE LA ALEGRIA CENTRO CULTURAL', 'rio-pueblo-de-la-alegria-centro-cultural-quibdo', 'otro', 'establecimientos de gastronomía', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3228889654', 'riopueblodelaalegria@hotmail.com', 'CARRERA 29  24  50 SECTOR HELICONIAS', '195512', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '195512')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VALENCIA MORENO MILIZAR LUZ YENNY', 'valencia-moreno-milizar-luz-yenny-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3126283298', 'posadasolymar16@gmail.com', 'VEREDA Termales', '194983', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '194983')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ASOCIACION DE TURISMO COMUNITARIO ENCANTO NATURAL JANANO', 'asociacion-de-turismo-comunitario-encanto-natural-janano-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3218385559', 'asociacionjanano@gmail.com', 'CORREGIMIENTO DE ARUSI MUNICIPIO DE NUQUI DEPARTAMENTO DEL CHOCO', '194054', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '194054')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ASOCIACION ECO-MEDIO AMBIENTAL', 'asociacion-eco-medio-ambiental-quibdo-3', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3226579891', 'ecotur1484@gmail.com', 'CORREGIMIENTO DE SAN FRANCISCO DE ICHO', '193939', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '193939')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CAROLINA  OLARTE MORALES', 'carolina-olarte-morales-quibdo-3', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3136988262', 'compras@almacenesfuller.com.co', 'CALLE 30 # 16 - 124', '193862', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '193862')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JARLID', 'jarlid-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3218812864', 'margothorejuela42@gmail.com', 'BRR MIRA FLOREZ', '193428', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '193428')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHOCOANIZANDO', 'chocoanizando-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147877245', 'chocoanizandoc@gmail.com', 'CALLE 24  22  53', '193267', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '193267')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARIA  LUNA ORTIZ RODRIGUEZ', 'maria-luna-ortiz-rodriguez-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3008268634', 'marialu-96@hotmail.com', 'CALLE Calle Cristobal Colon', '193065', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '193065')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EDWIN ALEXANDER CARDENAS', 'edwin-alexander-cardenas-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3015462570', 'milcolorespyf@gmail.com', 'Cabaña El Palmar, Corregimiento Capurgana', '192638', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '192638')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JAVIER ORLANDO PEREZ JIMENEZ', 'javier-orlando-perez-jimenez-el-carmen', 'guia_turismo', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3148948933', 'volandoalto73@gmail.com', 'CL 4 N 3   11 BRR GUAYAQUIL', '192456', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '192456')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOLODGE LA JOVISEÑA S.A.S.', 'ecolodge-la-jovisena-s-a-s-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3163043221', 'ecolodgelajovisena@gmail.com', 'Corregimiento de joví-Playa Guachalito', '189623', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '189623')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA MORENO ANDRES FELIPE', 'mosquera-moreno-andres-felipe-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217093442', 'andresfelipemosqueram@gmail.com', 'cll 22 # 5-82 segundo piso apto 206', '189176', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '189176')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA MORENO ANDRES FELIPE', 'mosquera-moreno-andres-felipe-quibdo-2', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217093442', 'andresfelipemosqueram@gmail.com', 'cll 22 # 5-82 segundo piso apto 205', '189173', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '189173')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA MORENO ANDRES FELIPE', 'mosquera-moreno-andres-felipe-quibdo-3', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217093442', 'andresfelipemosqueram@gmail.com', 'cll 22 # 5-82 segundo piso apto 202', '189172', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '189172')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA MORENO ANDRES FELIPE', 'mosquera-moreno-andres-felipe-quibdo-4', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217093442', 'andresfelipemosqueram@gmail.com', 'cll 22 # 5-82 segundo piso aprtamento 201', '189171', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '189171')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL MANGLAR', 'posada-el-manglar-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3202303813', 'sandramarcela1622@gmail.com', 'CARRERA        48         12 SUR 161 AP 161', '185754', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '185754')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EMALU M&C', 'hotel-emalu-m-c-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3105220360', 'margi-isabelita@hotmail.com', 'CARRERA 5 # 25 - 81', '185753', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '185753')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ENRIQUE DE JESUS VALENCIA MOSQUERA', 'enrique-de-jesus-valencia-mosquera-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3233271371', 'valencia3@gmail.com', 'CR 7 24 65, Piso 2', '185585', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '185585')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOLODGE AZUL PARADISE', 'ecolodge-azul-paradise-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3123447330', 'ecolodgeazulparadise@gmail.com', 'CORREGIMIENTO DE COQUI', '184790', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '184790')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MELEMAR', 'hotel-melemar-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3103872690', 'jayumorri@hotmail.com', 'BARRIO BELLAVISTA', '184488', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '184488')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'COCOMAR HOSTAL', 'cocomar-hostal-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3202770085', 'cocomarsanpacho@gmail.com', 'CORREGIMIENTO SA FRANCISCO', '183274', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '183274')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'THE WAGO TRAVEL', 'the-wago-travel-acandi', 'hotel', 'centro vacacional', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3043549827', 'guzmancruz.paula@gmail.com', 'BAHIA EL AGUACATE', '182788', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '182788')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MICHELLY ABANET ZAPATA', 'michelly-abanet-zapata-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3174380066', 'abaneth76@gmail.com', 'Sapzurro', '182665', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '182665')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PENTHOUSE', 'hotel-penthouse-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3117576082', 'leparis20@hotmail.com', 'BARRIO PANQUIACO', '181964', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '181964')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GILMAR AUGUSTO MENA ABADIA', 'gilmar-augusto-mena-abadia-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3122453731', 'manisatrespalacios@gmail.com', 'via yuto km 19 FINCA SAN JOAQUIN', '179638', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '179638')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JESSICA  BUILES RIOS', 'jessica-builes-rios-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3186953942', 'contabilidad@ideastangibles.co', 'Bahía Solano-Playa Juná', '179226', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '179226')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BEAUTIFUL ISLAND', 'beautiful-island-jurado', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('JURADO'))), '3122609402', 'aydeerivas@hotmail.com', 'B/ PUEBLO VIEJO', '179224', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '179224')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES JEINS TRAVEL S.A.S.', 'agencia-de-viajes-jeins-travel-s-a-s-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147773096', 'jeinstravelagencia@gmail.com', 'BARRIO JARDIN SECTOR LA 19 CALLE 25A # 19-43', '178904', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '178904')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BOHO BOUTIQUE', 'hotel-boho-boutique-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3136174491', 'dianimar@hotmail.es', 'CARRERA 3  25  32 B/PANDE YUCA', '178450', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '178450')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RAMIREZ CUJAR ANDRES MAURICIO', 'ramirez-cujar-andres-mauricio-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3117606950', 'andresenter1@gmail.com', 'barrio la union - zona playa', '177291', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '177291')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DULCE TOURS', 'dulce-tours-bojaya-bellavista', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BOJAYA'))), '3146305621', 'dulcejohana18@gmail.com', 'BELLAVISTA CABECERA', '177140', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '177140')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AQUAGEM COLOMBIA S.A.S.', 'aquagem-colombia-s-a-s-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3205961359', 'karyrittcr@gmail.com', 'BAHIA AGUACATE', '176565', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '176565')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANDROS GRUPO INTEGRAL S.A.S.', 'andros-grupo-integral-s-a-s-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3182691115', 'gerencia.andros@gmail.com', 'URBANIZACION LOS CASTILLOS 2 MANZANA 3 CASA 20 OFICINA 101', '176272', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '176272')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CAPURGANA DESTINO IDEAL  AGENCIA DE VIAJES', 'capurgana-destino-ideal-agencia-de-viajes-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3102189625', 'carolinarendona73@gmail.com', 'VIA QUINCE DE MAYO, CASA IRENE - CORREGIMIENTO CAPURGANA', '176037', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '176037')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LADY MAR', 'hotel-lady-mar-nuqui-2', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3208327421', 'carlosmurillo29@outlook.com', 'B/ROMA 10 MINUTOS DEL AEROPUERTO', '174293', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '174293')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CANITA', 'hotel-canita-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3216637244', 'ediester91@hotmail.com', 'BRR LA UNION', '173568', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '173568')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VIVI(VIVE, VIAJE)', 'vivi-vive-viaje-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3225067956', 'bermudezyuriaba@gmail.com', 'BARRIO LA UNION, ARRIBA DE AGUAS', '173365', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '173365')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ENCANTO NUQUI', 'encanto-nuqui-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3146847626', 'yennyasprilla01@gmail.com', 'SECTOR LA PLAYA', '172921', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '172921')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LAVADERO Y ESTADERO EL MIRADOR', 'lavadero-y-estadero-el-mirador-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3103508844', 'viacneygarcias034@gmail.com', 'BARRIO LA CASCORBA', '171374', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '171374')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA LAURA SOFIA', 'posada-laura-sofia-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3116150587', 'especialidadeslaquintasas@gmail.com', 'CORREGIMIENTO ARUSI', '171090', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '171090')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PLAYA DUBAI', 'hotel-playa-dubai-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3135518414', 'katerinemosqueralargacha@gmail.com', 'PLAYA DE LOS CUESTAS', '170869', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '170869')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL TORRE DORADA ALAMEDA CHOCÓ', 'hotel-torre-dorada-alameda-choco-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3216398140', 'antocampo84@hotmail.com', 'CALLE 26  5  8 B/ALAMEDA REYES', '170670', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '170670')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA LA PALMERA', 'posada-la-palmera-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3216319134', 'martinezagudelovillalba@gmail.com', 'CORREGIMIENTO DEL HUINA', '170331', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '170331')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VILLA INESITA', 'villa-inesita-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3148119934', 'lassicecy@hotmail.com', 'PLAYA PANGUI', '170222', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '170222')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ZAMORA FERNANDEZ ESTEFANIA', 'zamora-fernandez-estefania-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3216675376', 'popochosbeach@gmail.com', 'Km 1 Playa Olimpica', '169746', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '169746')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES Y OPERADORA DE TURISMO NAYITOUR', 'agencia-de-viajes-y-operadora-de-turismo-nayitour-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6716791', 'nayi.mosquera123@gmail.com', 'CARRERA 12  24 A 52', '169745', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '169745')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OSTIONAL RIVER', 'ostional-river-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3226772542', 'reservas1ostionalriver@gmail.com', 'CRR TERMALES', '168978', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '168978')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CAICEDO MOSQUERA BERNABETH', 'caicedo-mosquera-bernabeth-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3105314978', 'riomarmecana@gmail.com', 'playa mecana', '168578', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '168578')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANDREA  MAZO GIL', 'andrea-mazo-gil-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104253734', 'andreagilamg@gmail.com', 'CALLE 1 NORTE # 1 - 1 sapzurro playa ica', '168191', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '168191')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BHACOC', 'bhacoc-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3188153082', 'bhacoc.web@gmail.com;bhanny97@gmail.com', 'CARRERA 6  32  19 BARRIO HUAPANGO', '167933', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '167933')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECO RESERVACHURULEJA', 'eco-reservachuruleja-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3114087313', 'kmanyomadiaz@gmail.com', 'CORREGIMIENTO DE PANGUI', '167697', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '167697')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA DASMA', 'posada-dasma-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3217094113', 'changovalle17@gmail.com', 'CORREGIMIENTO DEL VALLE', '167695', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '167695')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ITZAYANA QUIBDO', 'itzayana-quibdo-quibdo', 'hotel', 'albergue', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3202342655', 'gerenciaitzayanasas@gmail.com', 'CARRERA 18  33 A 134 (201)', '167357', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '167357')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ITZAYANA CARMEN DE ATRATO', 'itzayana-carmen-de-atrato-el-carmen', 'hotel', 'albergue', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3202342655', 'gerenciaitzayanasas@gmail.com', 'SECTOR EL PUENTE AV AL 7', '167356', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '167356')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NUQUI TOURS', 'nuqui-tours-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3162946829', 'nuquitours@gmail.com', 'BRR CALLE LA VIRGEN', '166828', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '166828')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL NUEVO HORIZONTE M. G.', 'hotel-el-nuevo-horizonte-m-g-condoto', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('CONDOTO'))), '3137024677', 'hemgenrique@gmail.com', 'BARRIO VILLA FRANCO', '166399', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '166399')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MAMA ORBE FAMILY ECO-FARM', 'mama-orbe-family-eco-farm-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3148043474', 'mamaorbefamily@gmail.com', 'CORREGIMIENTO DEL VALLE', '164388', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '164388')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL ESTEFANIA QUIBDO', 'hotel-estefania-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3015850644', 'sarleygonzalo@gmail.com', 'CALLE 26 ENTRE 6 Y 7', '163270', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '163270')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NUQUIMEX SAS', 'nuquimex-sas-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3158190370', 'nuquimagico@gmail.com', 'PLAYA GUACHALITO', '160779', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '160779')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE CESAR CONTO', 'hospedaje-cesar-conto-quibdo', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6725161', 'mzora74@gmail.com', 'CALLE 29 CON CARRERA 6 Nº 5  58', '160460', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '160460')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PAKORÉ WERÁ', 'pakore-wera-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3216825181', 'linatere77@hotmail.com', 'AVENIDA AL AEROPUERTO', '160439', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '160439')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RAFAEL ANDRES GUEVARA HINCAPIE', 'rafael-andres-guevara-hincapie-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3107321857', 'rafael.guevara013@gmail.com', 'Eco Hotel Luzzul, sector bellavista, corregimiento de Arusí.', '160227', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '160227')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA VAMOS PA''L MAR CAPURGANÁ', 'agencia-vamos-pa-l-mar-capurgana-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3014477870', 'bevema8319@hotmail.com', 'B/ LA CAROLINA CAPURGANÁ', '159995', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '159995')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA CRUZ DEL MAR', 'cabana-cruz-del-mar-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3212154272', 'cabanacruzdelmar@outlook.com', 'VEREDA LA MORA', '159983', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '159983')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LA CASA DE IRIS SABOR A PACIFICO', 'la-casa-de-iris-sabor-a-pacifico-nuqui', 'hotel', 'refugio', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3144312125', 'nimiairisgonzalez@gmail.com', 'NUQUI,CHOCO PLAYA GUACHALITO', '159642', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '159642')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA YOW SURF', 'casa-yow-surf-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3157820375', 'casayowsurfnuqui@gmail.com', 'CALLE LA VIRGEN', '159375', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '159375')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA LA ROSA MARINA', 'posada-la-rosa-marina-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127031914', 'bridny.lc@gmail.com', 'CORREGIMIENTO DEL VALLE', '159374', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '159374')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL LAS FLORES CAPURGANÁ', 'hostal-las-flores-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3122148493', 'edgar22moreno@gmail.com', 'B/ LAS FLORES CAPURGANÁ', '158432', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '158432')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESTAURANTE Y POSADAS NATIVAS YULI MAR', 'restaurante-y-posadas-nativas-yuli-mar-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147432295', 'posadanativayulimar@gmail.com', 'CORREGUIMIENTO DE ARUSI', '157834', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '157834')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SAPAYOA NATURE TOURS', 'sapayoa-nature-tours-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3206057614', 'asesoriacontable1563@gmail.com', 'BARRIO EL CARMEN', '157428', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '157428')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PARAISO SOÑADO', 'paraiso-sonado-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3225039334', 'freddcalderon@gmail.com', 'CALLE 3 # 2 - 34', '157148', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '157148')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BLACK CHOCO TOURS S.A.S', 'black-choco-tours-s-a-s-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3122473968', 'blackchocotours@gmail.com', 'CALLE 26  30  26', '156019', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '156019')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS EL REFUGIO', 'cabanas-el-refugio-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3226772542', 'salomoncastro40@gmail.com', 'CORREGIMIENTO TERMALES', '155497', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '155497')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LAALDEADELPRIMITIVO', 'laaldeadelprimitivo-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3225224649', 'laaldeadelprimitivo@gmail.com', 'CORREGIMIENTO TERMALES', '155492', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '155492')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DIANA CAROLINA CUERVO URIBE', 'diana-carolina-cuervo-uribe-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3225439905', 'carocuervo16@gmail.com', 'BARRIO LOS GUAYBALES', '155169', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '155169')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LAS ROCAS VILLAGE ECOHOTEL', 'las-rocas-village-ecohotel-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3207503158', 'sandrina242003@yahoo.es', 'CALLE PRINCIPAL VIA TRIGANA', '154182', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '154182')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA TURISTICA JAIRO TOURS', 'agencia-turistica-jairo-tours-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6707760', 'jaenriquechave@hotmail.com', 'CARRERA 12 CALLE  11 MEDRANO LA PLAYITA', '153909', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '153909')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL BRAINER', 'hostal-brainer-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3136003027', 'fedecapurgana@gmail.com', 'CALLE DEL COMERCIO CAPURGANA', '153345', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '153345')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DARIEN ADVENTURES S.A.S', 'darien-adventures-s-a-s-jurado', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('JURADO'))), '3183608132', 'darienadventures@gmail.com', 'CORREGIMIENTO PUNTA ARDITA', '152621', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '152621')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'INNOVACIONES A&S SERVICIOS Y SUMINISTROS', 'innovaciones-a-s-servicios-y-suministros-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3226117835', 'gingersanchezpanesso1703@gmail.com', 'CALLE 26-A CARRRERA 12 # 13 BARRIO LA ESMERALDA SECTOR MONTE FRIO', '149005', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '149005')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL TORTUGA BAY', 'hotel-tortuga-bay-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3113102966', 'alberto-rozo@live.com', 'PLAYA CUEVITAS, CORREGIMIENTO EL VALLE', '149002', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '149002')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LA 8VA', 'hotel-la-8va-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3117619515', 'alreyprimero@hotmail.com', 'CARRERA 8 # 26 - 61', '148270', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '148270')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LUZ MARINA TOBON TORREGLOSA', 'luz-marina-tobon-torreglosa-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104920676', 'marina.tobon@hotmail.com', 'Barrio campo alegre n de contador 4600494533', '147434', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '147434')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VERONICA  HENAO POSADA', 'veronica-henao-posada-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3131962', 'verohenao@gmail.com', 'Cabaña La Playa, limita con la población de Sapzurro en su costado Sur Occidental.', '147348', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '147348')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ORIGENES ECO REFUGIO', 'origenes-eco-refugio-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3155003926', 'admin@origencolombia.co', 'PLAYA MAJAGUAL', '147098', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '147098')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL MI CASA ES TU CASA', 'hostal-mi-casa-es-tu-casa-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146207606', 'angelamate69@hotmail.com', 'PLAN PAREJO CAPURGANA', '144887', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '144887')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SANTIAGO PLAZA ACANDI', 'hotel-santiago-plaza-acandi-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3144198070', 'hotelsantiagop@gmail.com', 'CALLE NARIÑO', '144711', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '144711')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JOHNNY  RUEDA PATIÑO', 'johnny-rueda-patino-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '2120286', 'johnnymavics@gmail.com', 'Barrio Plan parejo Corregimiento Capurgana " Magic""', '144706', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '144706')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ESCOMBROS DEL MAR HOSTAL', 'escombros-del-mar-hostal-nuqui', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3233212849', 'yil.quinto@hotmail.com', 'BARRIO LA UNION', '141538', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '141538')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE DOÑA NEL', 'hospedaje-dona-nel-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3118449211', 'hdonanel@gmail.com', 'PLAYA LA CUEVITA CORREGIMIENTO DEL VALLE', '141075', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '141075')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'INMOBILIARIA SURGIR Y ASOCIADOS LIMITADA', 'inmobiliaria-surgir-y-asociados-limitada-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6712221', 'inmobiliariasurgir@gmail.com', 'Tutunendo barrrio la inmaculada', '138881', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '138881')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BOUTIQUE SHALOM', 'hotel-boutique-shalom-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '4730564', 'yomasegura@hotmail.com', 'BAHIA TRIGANA', '138546', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '138546')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EL RETOÑO NEGRO GOZÓN', 'el-retono-negro-gozon-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3113586101', 'fernandochaverra@gmail.com', 'CORREGIMIENTO PARTADO ARUSI', '138542', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '138542')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALOJAMIENTO SELVA MOJADA', 'alojamiento-selva-mojada-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3506352683', 'diazhenri064@gmail.com', 'PLAYA CUMBILINCHERO ARUSI', '138540', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '138540')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA BALAE', 'casa-balae-nuqui', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3205735973', 'nicogomez186@hotmail.com;casabalae@gmail.com', 'PLAYA TERQUITO, NUQUI, CHOCO', '138538', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '138538')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MURILLO GARCIA GITA ASHTARUT', 'murillo-garcia-gita-ashtarut-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3155080458', 'gmiovinelli@gmail.com', 'Playa Neverland, Nuqui, Choco', '137433', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '137433')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHANGUERO TOURS', 'changuero-tours-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3168968091', 'calvivale2017@gmail.com', 'BRR MIRA FLORES', '137432', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '137432')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SANDRA PATRICIA GUZMAN MARTINEZ', 'sandra-patricia-guzman-martinez-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3203945689', 'spgm1970@gmail.com', 'Sector la diana', '136009', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '136009')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'FEDERICO  RESTREPO MADRID', 'federico-restrepo-madrid-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3113644021', 'federicorestrepomadrid@hotmail.com', 'Sapzurro, Chocó', '136007', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '136007')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EL HONGO CAPURGANA', 'el-hongo-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3168771146', 'elhongocapurgana@gmail.com', 'FINCA EL HONGO CAPURGANA', '135433', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '135433')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LAS PALMERAS ACANDI', 'hotel-las-palmeras-acandi-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3206433987', 'accionsocial006@yahoo.com', 'CALLE ECHEVERRY DIAGONAL OLAYA HERRERA', '135428', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '135428')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOWASI VERA''S', 'ecowasi-vera-s-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3002109142', 'ecowasiveras18@gmail.com', 'CORREGIMIENTO CAPURGANA', '135424', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '135424')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGUIRRE TORO EL AGUILA DESCALZA S.A.S.', 'aguirre-toro-el-aguila-descalza-s-a-s-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '6043228415', 'asisadministrativa@aguiladescalza.com.co', 'VALLE CHOCO - CABAÑA AGUILA DESCALZA', '134378', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '134378')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL EL PORTAL DEL SOL CAPURGANA', 'hostal-el-portal-del-sol-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3168014675', 'maricelabuendiamartinez@gmail.com', 'BARRIO LA CAROLINA CAPURGANA', '134377', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '134377')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'INVERSIONES ALOJA-T S.A.S.', 'inversiones-aloja-t-s-a-s-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3207009109', 'alojatecolombia@gmail.com', 'Cra 5a # 2a - 50', '134371', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '134371')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JULIAN  CADAVID MOLINA', 'julian-cadavid-molina-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3526657', 'juliankdavid18@gmail.com', 'Vda Termales', '134370', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '134370')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BRISAS DEL SAN JUAN', 'hotel-brisas-del-san-juan-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3154911206', 'pabloz27@hotmail.es', 'CARRERA 7  21 A 51 B', '134368', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '134368')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARADENTRO INVESTIGACION', 'maradentro-investigacion-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '7502465', 'maradentrof@gmail.com', 'BARRIO FLORESTA', '134363', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '134363')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RUBIELA DEL CARMEN GAMBOA BASTIDAS', 'rubiela-del-carmen-gamboa-bastidas-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3128176715', 'rubieladelc@hotmail.com', 'CALLE 30 # 5 - 39 APARTAMENTO Tercer Piso', '133722', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '133722')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL ACUARIO', 'posada-el-acuario-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3206578120', 'bonisen06@gmail.com', 'B/ EL CARMEN', '129835', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '129835')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TRANSPORTE LAIDA', 'transporte-laida-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3205180351', 'aidelis1102@gmail.com', 'BARRIO ROMA', '129826', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '129826')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'IRANA PACIFIC', 'irana-pacific-nuqui', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3003534121', 'marcep9312@gmail.com', 'PLAYA DE COQUÍ', '128818', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '128818')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MORENO VASQUEZ DANIELA ANDREA', 'moreno-vasquez-daniela-andrea-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3218199001', 'danimoreno200725@gmail.com', 'El muelle', '128816', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '128816')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CORREA CAÑAS PAULA ANDREA', 'correa-canas-paula-andrea-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3126017450', 'pirataexpresshostal@gmail.com', 'Playa Los Pescadores', '128294', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '128294')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ABSAVENTOUR', 'absaventour-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3117307620', 'absaloncaizamo@gmail.com', 'CORREGIMIENTO DEL VALLE', '128292', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '128292')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL SAFIO', 'posada-el-safio-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127769551', 'anibal.murillo@casur.gov.co', 'CORREGIMIENTO DEL VALLE COCHÓ', '127855', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '127855')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALESSIO  BATTI', 'alessio-batti-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3213745084', 'alessiobatti@gmail.com', 'Corregimiento Capurgana', '127854', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '127854')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PRIMAVERALES', 'hotel-primaverales-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3106446700', 'fergiraldo2017@gmail.com', 'CARRERA 5  27  47 PISO 2', '126398', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '126398')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHOWA LODGE', 'chowa-lodge-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3147359936', 'g70783943@gmail.com', 'CORREGIMIENTO DE TERMALES - NUQUI', '126395', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '126395')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOCABAÑA COLIBRÍ', 'ecocabana-colibri-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3103939778', 'cogestorpazdarien@gmail.com', 'BARRIO VILLANUEVA', '125746', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '125746')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL DE PRIMERA', 'hotel-de-primera-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3113153689', 'hoteldeprimera@gmail.com', 'CARRERA 1  27  30', '124159', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '124159')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RAMIREZ MONTOYA LILIANA MARIA', 'ramirez-montoya-liliana-maria-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3206923900', 'lilyramirez2787@gmail.com', 'Vía Tribuga', '123701', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '123701')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BAHIA AGUACATE', 'hotel-bahia-aguacate-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3008561465', 'colombiadivingtours@gmail.com', 'VEREDA EL AGUACATE', '123698', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '123698')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALEJANDRO  MARULANDA CASAS', 'alejandro-marulanda-casas-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3207977614', 'alejofranla10@gmail.com', 'Cabaña Los Longos, Playa El Almejal, Corregimiento El Valle.', '123693', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '123693')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA TELLIN', 'cabana-tellin-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3167211699', 'cabanatellinnuqui@gmail.com', 'CORREGIMIENTO DE TERMALES', '122970', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '122970')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DIAZ PEREA MARGARITA', 'diaz-perea-margarita-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3213042289', 'diazpereamargarita@gmail.com', 'Barrio La union', '122967', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '122967')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PARAISO AZUL MAS QUE UN HOTEL', 'hotel-paraiso-azul-mas-que-un-hotel-certegui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('CERTEGUI'))), '3225536964', 'jhonpalacios993@gmail.com', 'CALLE 3 # 4-92 BARRIO SANTANDER', '122857', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '122857')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL MONO NUQUI', 'hotel-el-mono-nuqui-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3113511300', 'hotelelmononuqui@gmail.com', 'B/ BELLAVISTA', '122852', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '122852')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES KEREZI', 'agencia-de-viajes-kerezi-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3206737235', 'agenciakerezi@gmail.com', 'CALLE 23 NO 29  05', '119693', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '119693')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SAMANTI HOTEL', 'samanti-hotel-riosucio', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '2642522', 'jotauribece@yahoo.es', 'CALLE 10  15 C 02 CORR BELEN DE BAJIRA BRR EL BINOMIO', '118836', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '118836')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LIPSY PATRICIA ROJAS ARANGO', 'lipsy-patricia-rojas-arango-acandi-2', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3147995652', 'lipsypatricia@gmail.com', 'Sapzurro', '118097', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '118097')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SERRANÍA DEL DARIÉN', 'hotel-serrania-del-darien-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3216897816', 'isabeelcristina24@gmail.com', 'CARRERA 4  26  68', '117531', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '117531')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL VILLANUEVA DEL PACIFICO', 'hotel-villanueva-del-pacifico-medio-baudo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('MEDIO BAUDO'))), '3114172329', 'lozaba191@gmail.com', 'BARRIO VILLA NUEVA', '116862', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '116862')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA EL NATIVO', 'posada-turistica-el-nativo-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3022218867', 'cabañaelnativo@hotmail.com', 'CORREGIMIENTO DEL VALLE', '116860', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '116860')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'NAISA TOURS SAS', 'naisa-tours-sas-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3106412012', 'naisatours@hotmail.com', 'VÍA PRINCIPAL BARRIO EL CARMEN', '116231', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '116231')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL KATAMARAN ORILLAS DEL DARIEN', 'hotel-katamaran-orillas-del-darien-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3003450827', 'mejiaorozcocarlosandres@gmail.com', 'CORR MUELLE DE CAPURGANA', '115514', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '115514')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA ROCAS DE CABO MARZO', 'posada-rocas-de-cabo-marzo-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3116225502', 'enriquegr48@gmail.com', 'B/  EL CARMEN', '115507', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '115507')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA GALU', 'casa-galu-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3106373317', 'c_scheider@hotmail.com', 'CORREGIMIETO DE CAPURGANA', '115304', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '115304')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POR EL MUNDO VIAJES Y TURISMO', 'por-el-mundo-viajes-y-turismo-quibdo-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3163253589', 'porelmundoviajesyturismo@gmail.com', 'CARRERA 8  25  08 BR ALAMEDA', '114086', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '114086')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA CLEO', 'cabana-cleo-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3112386965', 'viejotaba@gmail.com', 'CORREGIMIENTO DE JURUBIRÁ', '112987', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '112987')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TUNDO TOURS', 'tundo-tours-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3105380486', 'tundotours.otl@gmail.com', 'CORREGIMIENTO EL VALLE', '112398', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '112398')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CLAUDIA MARCELA CORREA MAYA', 'claudia-marcela-correa-maya-el-carmen', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3104574659', 'clamacoma@hotmail.com', 'El Tonusco', '112092', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '112092')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ESTACIÓN BIOLÓGICA EL AMARGAL', 'estacion-biologica-el-amargal-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3187769515', 'reservaelamargal@gmail.com', 'ESTACIÓN BIOLÓGICA EL AMARGAL, PLAYA EL AMARGAL, ARUSI', '111049', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '111049')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TECHO ROJO SAPZURRO', 'techo-rojo-sapzurro-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3105424201', 'juangangel@hotmail.com', 'CORREGIMIENTO SAPZURRO', '107543', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '107543')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MERAKI NUQUI', 'meraki-nuqui-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3217544752', 'merakigerenciasas@gmail.com', 'GUACHALITO -NUQUI', '104126', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '104126')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA MI ESPERANZA SAPZURRO', 'cabana-mi-esperanza-sapzurro-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3143632647', 'pilena13@hotmail.com', 'CORRE SAPZURRO', '102754', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '102754')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'REFUGIO MR JERRY ECO HOSTAL', 'refugio-mr-jerry-eco-hostal-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3013322896', 'arangoa493@gmail.com', 'CORREGIMIENTO DE HUINA', '102163', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '102163')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MADRE AGUA COLOMBIA', 'madre-agua-colombia-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3105250023', 'CAMILOZU@GMAIL.COM', 'B/ EL CARMEN', '101981', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '101981')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'COCOLOCO LODGE', 'cocoloco-lodge-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3137134534', 'andresitotour@hotmail.com', 'CORREGIMIENTO DEL VALLE', '101210', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '101210')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL ZONA LIBRE', 'hotel-zona-libre-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3117567678', 'yarlisvillerosmartinez@gmail.com', 'CALLE COMERCIO CAPURGANA', '100552', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '100552')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CIRCUITO DE TURISMO ALTERNATIVO LA CUMBANCHA', 'circuito-de-turismo-alternativo-la-cumbancha-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3193454770', 'circuitolacumbancha@gmail.com', 'B/LA UNION', '100183', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '100183')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HILLTOP SAPZURRO', 'hilltop-sapzurro-acandi', 'hotel', 'centro vacacional', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146886698', 'hilltopamericas@gmail.com', 'SAPZURRO FRENTE AL MAR', '99703', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '99703')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HILLTOP CAPURGANA', 'hilltop-capurgana-acandi', 'hotel', 'centro vacacional', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146886698', 'hilltopamericas@gmail.com', 'PLAN PAREJO  FRENTE AL MAR', '99701', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '99701')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ENTRESELVAS GLAMPING', 'entreselvas-glamping-quibdo', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3104299856', 'entreselvasglamping@gmail.com', 'KM7 VÍA A YUTO', '99418', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '99418')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TRANSPORTE PROGRESO DEL CHOCO LIMITADA', 'transporte-progreso-del-choco-limitada-quibdo', 'otro', 'empresas de transporte terrestre automotor', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3206940061', 'trans.progresochoco@gmail.com', 'CALLE 28  3  46', '99181', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '99181')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AL VAIVEN DE HAMACAS', 'al-vaiven-de-hamacas-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3216431171', 'al.vaiven@gmail.com', 'CORREGIMIENTO SAN FRANCISCO', '99064', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '99064')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GRAN HOTEL MARINILLA', 'gran-hotel-marinilla-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3235718759', 'donagioc1983@gmail.com', 'CARRERA 4  25  29 PISO 2', '98984', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '98984')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BAHIA SOLANO ME LLAMA', 'bahia-solano-me-llama-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3145525787', 'juandriascos@gmail.com', 'CARRERA 1  3 A BAHIA SOLANO', '98837', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '98837')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE CABI', 'hospedaje-cabi-quibdo', 'hotel', 'albergue', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3137459113', 'osoriocarvajal.ac@gmail.com', 'CABI, DIAGONAL OREWA', '98307', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '98307')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL KAMALEB FARALLONES', 'hotel-kamaleb-farallones-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3218748058', 'sagoro_18@hotmail.com', 'CALLE 28 # 1-70', '98132', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '98132')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES SEGUIR VOLANDO TOUR', 'agencia-de-viajes-seguir-volando-tour-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3202188609', 'seguirvolandotuor2021@hotmail.com', 'BARRIO MINUTO DE DIOS', '98084', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '98084')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LA TERCERA', 'hotel-la-tercera-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3206816905', 'hotelfaraondelaquinta02@gmail.com', 'CARRERA 3  24 A 108', '97793', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '97793')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'COLOMBIA PACIFIC TOURS NUQUI', 'colombia-pacific-tours-nuqui-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3155744678', 'colombiapacifictours@gmail.com', 'VEREDA TERMALES', '97681', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '97681')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL GRAN TESORO DE BAJIRA', 'hotel-el-gran-tesoro-de-bajira-riosucio', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('RIOSUCIO'))), '3136156932', 'eltesoroh@gmail.com', 'CLL PRINCIPAL', '97025', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '97025')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS IRACAS DEL MAR', 'cabanas-iracas-del-mar-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3163837615', 'daypangan12@gmail.com', 'BARRIO SECTOR LA PLAYA', '96635', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '96635')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JAIME DARIO CASAS ARANGO', 'jaime-dario-casas-arango-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '4955539', 'casasarangoj@gmail.com', 'SECTOR LOS MAGOS - SAPZURRO', '96235', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '96235')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MECANA ECOHOTEL', 'mecana-ecohotel-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3137082354', 'hildaescobar89@hotmail.com', 'PLAYA MECANA', '95845', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '95845')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CALLE REAL ISTMINA', 'hotel-calle-real-istmina-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3206918403', 'hotelcallereal2018@gmail.com', 'CARRERA 7  18  35', '95274', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '95274')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LAS AMERICAS DEL SAN JUAN M.S', 'hotel-las-americas-del-san-juan-m-s-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3206918403', 'hotelcallereal2018@gmail.com', 'CARRERA 7  19  22 PISO 2 Y 3', '94917', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '94917')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SHAIRA HOTEL', 'shaira-hotel-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3137972917', 'mejiabedoyakatherine@gmail.com', 'CARRERA 5  25  68', '94915', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '94915')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA "DON AI"', 'posada-don-ai-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3005729350', 'posadadonai@hotmail.com', 'CORREGIMIENTO DEL VALLE PLAYA ALMEJAL', '94494', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '94494')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL NICOVA', 'hotel-nicova-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3233656448', 'r.losnativos@hotmail.com', 'CARRERA 8  22  51 PISO 2', '94418', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '94418')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA BRISA Y MAR', 'posada-nativa-brisa-y-mar-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3203182967', 'posadabrisaymar@gmail.com', 'CORREGIMIENTO DE TERMALES', '94035', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '94035')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA KEVELIN', 'posada-nativa-kevelin-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3148547530', 'posadakevelin@gmail.com', 'CORREGIMIENTO DE TERMALES', '93584', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '93584')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA CHILA', 'cabana-chila-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3137493501', 'cabanachila@gmail.com', 'CALLE LA CRUZ DE MAYO SAPZURRO', '93026', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '93026')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA LA BAYKA ALOJAMIENTO RURAL EN NUQUI', 'posada-nativa-la-bayka-alojamiento-rural-en-nuqui-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3146838847', 'jovisena1@gmail.com', 'CORREGIMIENTO  GUACHALITO', '93025', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '93025')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA VILLA MARIA', 'cabana-villa-maria-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3117628742', 'maruquin1234@hotmail.com', 'CALLE DE LA POLICIA CON PLAYA PESCADORES', '92193', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '92193')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL TEMATICO ETNIAS', 'hotel-tematico-etnias-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6713325', 'viajestruando1@gmail.com', 'CARRERA 3  NO. 30  43 HOTEL TEMÁTICO ETNIAS', '91544', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '91544')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE OPERACIONES TURISTICAS Y CULTURALES DEL CHOCO DASHI ENJUA', 'agencia-de-operaciones-turisticas-y-culturales-del-choco-dashi-enjua-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3217124399', 'agotch_daenltda@gmail.com', 'CALLE 27  6  72', '90903', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '90903')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE ZINGARA', 'hospedaje-zingara-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3206874678', 'clemacan@gmail.com', 'CAMINO A LA MIEL SAPZURRO', '88267', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '88267')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LOS KUNAS DEL DARIEN', 'hotel-los-kunas-del-darien-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3217790429', 'hotelloskunascapurgana@gmail.com', 'AVENIDA PRINCIPAL CAPURGANA', '87395', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '87395')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PACIFICO AZUL', 'hotel-pacifico-azul-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3214283917', 'natidcroz@hotmail.com', 'CR 3 BRR EL CARMEN', '87134', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '87134')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MOSQUERA MORENO MOISES', 'mosquera-moreno-moises-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3504735769', 'migem24@gmail.com', 'Capurgana', '87133', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '87133')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA SAMANTHA', 'cabana-samantha-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3135698239', 'etutino312@hotmail.com', 'BARRIO LAS PALMAS CAPURGANA', '86918', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '86918')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL J.L', 'hostal-j-l-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3108661259', 'sherlyayola@gmail.com', 'CALLE LAS FLORES SAPZURRO', '86915', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '86915')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DOBLE VISTA', 'doble-vista-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3212884693', 'hostaldoblevista@gmail.com', 'VEREDA EL AGUACATE', '86157', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '86157')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SAN BLAS CAPURGANA', 'hotel-san-blas-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3154660524', 'padilla.12_p@yahoo.es', 'CALLE DEL COMERCIO', '86154', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '86154')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DIVEANDGREEN CENTRO DE BUCEO', 'diveandgreen-centro-de-buceo-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3115784021', 'info@diveandgreen.com', 'CALLE DEL MUELLE #8', '85772', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '85772')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARTHA KOSCETH MENDOZA CASTRO', 'martha-kosceth-mendoza-castro-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3207506615', 'paraisocangejales@gmail.com', 'corregimiento sapzurro', '84550', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '84550')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA NATURAL BOHEMIA', 'casa-natural-bohemia-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3115320689', 'thejunglecapurgana@gmail.com', 'CORREGIMIENTO CAPURGANA', '84549', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '84549')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OSCAR  HURTADO FRANCO', 'oscar-hurtado-franco-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3158190370', 'ohf2611@gmail.com', 'Corregimiento  Jovi', '84124', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '84124')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE CASA LA MARIELA', 'hospedaje-casa-la-mariela-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3006168064', 'info@casahotellamariela.com', 'CALLE ALCIDES FERNANDEZ CORR SAPZURRO', '84120', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '84120')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ALVAREZ USUGA LUISA FERNANDA', 'alvarez-usuga-luisa-fernanda-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3013846733', 'latarimadelcolibri@gmail.com', 'Playa el almejal- corregimiento el valle', '83758', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '83758')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA VILLA SOFI - NUQUI', 'cabana-villa-sofi-nuqui-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3108441887', 'ajapasa@yahoo.es', 'SECTOR LA PLAYA - CONDOMINIO 7 CABAÑAS', '83258', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '83258')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA DARIUS', 'cabana-darius-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146225638', 'reservas@dariuscapurgana.com', 'SECTOR PLAN PAREJO  CAPURGANA', '82716', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '82716')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ANKLA AZUL', 'ankla-azul-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3112811079', 'contact@anklaazul.com', 'CARRERA 2 PUEBLO PRINCIPAL BAHÍA SOLANO', '82485', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '82485')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ACUALI ECOHOSTAL', 'acuali-ecohostal-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3136858048', 'alinacastrour@hotmail.com', 'KILOMETRO 1 CAMINO VIEJO A SAPZURRO, CAPURGANA', '82402', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '82402')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BAHIA SOLANO', 'hotel-bahia-solano-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3147247893', 'juanbahiasolano@hotmail.com', 'B/ EL CARMEN', '82349', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '82349')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GIRALDO ALZATE MAURICIO', 'giraldo-alzate-mauricio-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3104137438', 'madreaguahotel@gmail.com', 'Arusí Barrio Miramar', '81494', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '81494')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'GALÚ HOTEL', 'galu-hotel-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3016961757', 'admon.galuhotel@gmail.com', 'CALLE 28  1  - 124', '81331', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '81331')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'JAIME ELIECER HENAO ARIAS', 'jaime-eliecer-henao-arias-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '6042297313', 'jaimehenao1010@hotmail.com naturacapurgana@gmail.com', 'Capurgana', '79598', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '79598')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHALALANGA SURF', 'chalalanga-surf-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3215158362', 'angelaparaisurf@gmail.com', 'NUQUI PLAYA TERQUITO', '79150', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '79150')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA MILAGRO DE DIOS', 'posada-milagro-de-dios-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3142888993', 'posadamilagrodedios@gmail.com', 'CORREGIMIENTO DE TERMALES', '78920', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '78920')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL ESFUERZO', 'posada-el-esfuerzo-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3122453178', 'posadaelesfuerzo@gmail.com', 'CORREGIMIENTO DE TERMALES', '78918', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '78918')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'IRI MAR TERMALES', 'iri-mar-termales-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3176259770', 'posadairimar@gmail.com', 'CORREGIMIENTO DE TERMALES', '78915', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '78915')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA KAKIRI', 'casa-kakiri-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3147000021', '1ponyza@gmail.com', 'CORREGIMIENTO GUACHALITO', '78906', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '78906')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA KOSTA AZUL CAPURGANA', 'cabana-kosta-azul-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3228379187', 'alojamientocapurgana@gmail.com', 'CLL DEL AEROPUERTO, CAPURGANA', '78903', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '78903')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL MARAZUL CAPURGANÁ', 'hostal-marazul-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3156932661', 'jhodismosquera@gmail.com', 'BARRIO MIRAMAR CAPURGANA', '77131', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '77131')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADAS ECOTURISTICAS CHACHITA SAS', 'posadas-ecoturisticas-chachita-sas-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3215870509', 'ecoposadaschachita@gmail.com', 'CORREGIMIENTO DE PANGUI', '76927', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '76927')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARLYNGS AZUL', 'marlyngs-azul-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3165280873', 'lacolina1687@gmail.com', 'PLAYA LOS PESCADORES CAPURGANA', '76921', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '76921')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DIAZ RUIS ERIS', 'diaz-ruis-eris-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3205364555', 'lasirenanegra2018@gmail.com', 'CORRIMIENTO DE TERMALES', '76446', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '76446')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DESTINO CAPURGANA', 'destino-capurgana-acandi', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3164823665', 'planesdestinocapurgana@gmail.com', 'CORREGIMIENTO CAPURGANA', '75329', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '75329')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OPERADORA DE TURISMO Y VARIEDADES SMUCAST', 'operadora-de-turismo-y-variedades-smucast-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3105229887', 'smoperadora@gmail.com', 'CARRERA 9 N° 18 - 164 BARRIO MEDRANO', '74665', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '74665')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'A&A ECOTURISMO S.A.S.', 'a-a-ecoturismo-s-a-s-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3212449529', 'a.contoz@gmail.com', 'Treegana Hostal, Caserio Sardi, Entrada Reserva Natural Sasardi, TRIGANA', '73601', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '73601')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MADONA', 'hotel-madona-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3128263647', 'luiscuadrado297@gmail.com', 'CALLE SANTANDER', '73466', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '73466')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TOUR DE RIOS', 'tour-de-rios-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3126027257', 'edrengifo14@gmail.com', 'CLL PRINCIPAL B/ LA INMACULADA CORR. TUTUNENDO', '73447', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '73447')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL COSTA CHOCO', 'hotel-costa-choco-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127871834', 'izzo.inversiones@gmail.com', 'CARRERA 2  6  73', '72734', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '72734')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VASQUEZ MEJIA MARIA CECILIA', 'vasquez-mejia-maria-cecilia-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3006855445', 'ceciliavasquezm@yahoo.com', 'Hostla Caracoli', '72486', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '72486')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CENTRO RECREACIONAL LA MECA', 'centro-recreacional-la-meca-istmina', 'hotel', 'centro vacacional', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '6702059', 'danielvt300@gmail.com', 'KILOMETRO 1 QUEBRADA QUIEBRA HUESO', '72480', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '72480')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SAFIO', 'safio-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3108234297', 'juazulu@gmail.com', 'CALLE 40 AA 50 BB 33', '72478', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '72478')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HAKUNA MATATA HOSTAL CHOCO', 'hakuna-matata-hostal-choco-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3165262776', 'hakuna.matata.hostal@gmail.com', 'CORREGIMIENTO DEL VALLE', '72448', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '72448')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OBEGA PACIFIC', 'obega-pacific-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3137215110', 'hotelobegapacific@gmail.com', 'BARRIO LA UNION', '71638', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '71638')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA HANNANY', 'posada-nativa-hannany-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3173825430', 'crisriascos30@gmail.com', 'CORREGIMIENTO DE ARUSI', '70950', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '70950')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL ESTACIÓN LA 70', 'hotel-estacion-la-70-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3136629532', 'nubiaossa597@hotmail.com', 'BARRIO CUBIS SECTOR LA SETENTA', '70229', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '70229')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL C. PLAZA', 'hotel-c-plaza-el-carmen', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3215579825', 'jhon.jimenezv88@gmail.com', 'CALLE CORAZON DE MARIA', '70199', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '70199')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ILEWA', 'ilewa-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3022539026', 'ilewaturismo@gmail.com', 'CARRERA 2 N° 26A - 32 PISO 2', '69222', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '69222')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS ANAYANSI', 'cabanas-anayansi-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3206979026', 'cholo_triga@hotmail.es', 'BAHIA TRIGANÁ', '69214', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '69214')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RUIZ GONZALEZ MARIA EUGENIA', 'ruiz-gonzalez-maria-eugenia-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3116306699', 'mariuruiz64@gmail.com', 'Capurgana', '66645', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '66645')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BAHIA PINORROA LODGE CAPURGANA', 'hotel-bahia-pinorroa-lodge-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '8272340', 'contacto@hotelbahiapinorroa.com', 'CORR CAPURGANA BR LAS PALMAS', '66188', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '66188')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL MANERO', 'hotel-el-manero-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3232310413', 'JULIANACJ1229@ICLOUD.COM', 'BARRIO LAS MERCEDES', '66082', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '66082')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PIEDRA PIEDRA LODGE', 'piedra-piedra-lodge-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3183833271', 'contadoresasesoreslanc@hotmail.com', 'PIEDRA PIEDRA', '65900', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '65900')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BLACK SANDS FISHING', 'black-sands-fishing-bahia-solano-2', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '4481458', 'bsfishing2018@gmail.com', 'PARAJE PARIDERA DEL CORREGIMIENTO DE HUACA', '65899', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '65899')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RESTAURANTE Y HOTEL EL BUEN GUSTO DE PIZARRO', 'restaurante-y-hotel-el-buen-gusto-de-pizarro-bajo-baudo-pizarro', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAJO BAUDO'))), '3207399335', 'elcontadorsercontri@gamil.com', 'BARRIO LAS BRISAS - PIZARRO', '64186', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '64186')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECO HOTEL ARENA AZUL', 'eco-hotel-arena-azul-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3207796023', 'gberthaomir@yahoo.es', 'CALLE 13 AVENIDA EL MAR', '63873', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '63873')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PALOQUEMAO TUTUNENDO', 'hotel-paloquemao-tutunendo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6710307', 'bettyayc@hotmail.com', 'BARRIO SAN ANTONIO CORREGIMIENTO TUTUNENDO', '63848', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '63848')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ASOCIACIÓN ECOTURISTICA Y CULTURAL CHAMPA MIA', 'asociacion-ecoturistica-y-cultural-champa-mia-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3118085114', 'asociacion.champamia@gmail.com', 'CALLE 26 CON CARRERA 1ERA FRENTE A LA CATEDRAL', '62547', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '62547')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA LA ESQUINA DEL MAR', 'cabana-la-esquina-del-mar-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3147089200', 'cabanalaesquinadelmar@outlook.es', 'CALLE CRISTOBAL COLON', '61865', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61865')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES RUAJ', 'agencia-de-viajes-ruaj-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3146860215', 'agenciadeviajesruaj@gmail.com', 'BARRIO OBAPO', '61600', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61600')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EDEN DE LA QUINTA', 'hotel-eden-de-la-quinta-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147012365', 'bycard31@hotmail.com', 'CARRERA 5  24  151', '61383', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61383')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL LOS CABOS', 'hostal-los-cabos-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3126440126', 'contaloscabos@gmail.com', 'B/EL CARMEN', '61382', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61382')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS EL CHILENO', 'cabanas-el-chileno-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3136859862', 'cabanaelchileno@outlook.es', 'CORREGIMIENTO SAPZURRO', '61381', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61381')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'BELCY´S HOUSE CABAÑA', 'belcy-s-house-cabana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3217906463', 'belcy111@hotmail.com', 'LA PLAYA SAPZURRO', '61264', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61264')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MARCELO', 'hotel-marcelo-tado', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('TADO'))), '3137333278', 'isortiz@ccq.org.co', 'CARRERA 8 CALLE 3A ESQUINA', '61117', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '61117')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS MAR Y RIO', 'cabanas-mar-y-rio-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3164261009', 'elmardediego@gmail.com', 'CORREGIMIENTO DE GUACHALITO', '60770', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '60770')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SAN FRANCISCO DE QUIBDÓ', 'hotel-san-francisco-de-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6713574', 'omarquintero63@hotmail.com', 'CALLE 24  7  99', '59996', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '59996')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'IRIACA SAS', 'iriaca-sas-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3506421217', 'wdiaz@oxohotel.com', 'BR. LOS ANGELES AEROPUERTO EL CARAÑO', '59818', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '59818')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL PARAISO COMO EN CASA', 'hostal-paraiso-como-en-casa-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3234963681', 'mercadeohotelero9@gmail.com', 'BARRIO LAS PALMAS CAPURGANA', '59316', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '59316')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL MEDELLIN LA CUARTA', 'hotel-medellin-la-cuarta-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3133841966', 'eimo3012@hotmail.com', 'B/ CABI SECTOR LAS MALLES', '58883', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '58883')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PLAYA MORROMICO', 'playa-morromico-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3127956321', 'melissamorromico@gmail.com', 'CORREGIMIENTO DE JURUBIRA', '58822', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '58822')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL ARCA', 'posada-el-arca-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '308312798', 'elarcabahiasolano@gmail.com', 'PLAYA JUNACITO', '58339', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '58339')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA PALO DE AGUA', 'cabana-palo-de-agua-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '6713438', 'famobo67@hotmail.com', 'CORREGIMIENTO DE COQUÍ', '58214', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '58214')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL PATIO BONITO CARPURGANÁ', 'hostal-patio-bonito-carpurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3218338170', 'mariagironibarguen@gmail.com', 'BARRIO LAS PALMAS CAPURGANÁ', '58081', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '58081')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SHAIRA 2', 'hotel-shaira-2-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6707092', 'hotelshaira@yahoo.com', 'CARRERA 5  27  15', '57468', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '57468')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'DESTINOS HAS TRAVEL S.A.S', 'destinos-has-travel-s-a-s-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3104226288', 'hyllyviviana@hotmail.com', 'CARRERA 8 NO. 25 115', '56972', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '56972')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CABAÑAS EL PARAISO SAPZURRO', 'hotel-cabanas-el-paraiso-sapzurro-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3106153887', 'apro39@hotmail.com', 'ACANDI-CHOCO', '56167', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '56167')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL EL CADO', 'hotel-el-cado-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3113123', 'sylvain.schultz@wanadoo.fr', 'PLAN PAJERO', '54136', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '54136')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL FULL DESCANSO', 'hotel-full-descanso-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3104317982', 'dalysdelcarmen@hotmail.es', 'CRA 5 ENTRE 25 Y 24 #174', '53938', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '53938')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SELVA MAR NUQUI', 'hotel-selva-mar-nuqui-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '2385417', 'johnfenelhincapie@hotmail.com', 'NUQUI- BARRIO LA UNION', '53593', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '53593')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL ACUALI', 'hotel-acuali-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3134453653', 'deprisauib1@yahoo.com', 'BARRIO UNIDO FRENTE AL AEROPUERTO', '51254', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '51254')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL KIPARA EL VALLE', 'hotel-kipara-el-valle-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3116344428', 'gladysherrera333@gmail.com', 'CORREGIMIENTO DEL VALLE', '50305', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '50305')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CONQUISTADORES QUIBDO', 'hotel-conquistadores-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3232228794', 'oscarmauricioramirezgomez71@gmail.com', 'CARRERA 4  26  18 PISO 2', '50300', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '50300')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OLEAJES CAPURGANÁ', 'oleajes-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3105002625', 'claracc434@hotmail.com', 'PARQUE PRINCIPAL CAPURGANÁ', '49888', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '49888')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA PURA VIDA', 'cabana-pura-vida-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3164680651', 'cabanacapurgana@gmail.com', 'PLAN PAREJO CAPURGANA', '49697', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '49697')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LA KUKA S.A.S.', 'hotel-la-kuka-s-a-s-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3225571', 'contabilidad@tecnovasa.com', 'NUQUI- CORREGIMIENTO JOVI - PLAYA GUACHALITO', '47440', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '47440')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL DELFIN REAL', 'hotel-delfin-real-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3136773759', 'celenival292@yahoo.es', 'BARRIO LA UNION', '46956', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '46956')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOLODGE PLAYA ALEGRE S.A.S.', 'ecolodge-playa-alegre-s-a-s-bahia-solano', 'hotel', 'centro vacacional', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3103824460', 'claraclararg@gmail.com', 'CORREGIMIENTO EL VALLE SECTOR ALMEJAL FINCA PORCILOVE', '46185', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '46185')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL Y PARQUEADERO LA PRIMAVERA', 'hotel-y-parqueadero-la-primavera-union-panamericana', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('UNION PANAMERICANA'))), '3146179903', 'servicentrolaprimavera@gmail.com', 'CARRERA 7 BARRIO LOURDES KM 00477', '44546', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '44546')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CIELITO', 'cielito-nuqui', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3142958367', 'rogereyes4@gmail.com', 'LOTE 1 ARUSI', '44544', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '44544')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MUNDI TOURS', 'mundi-tours-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3147760947', 'munditoursviaje@gmail.com', 'CALLE 24 5 82', '44005', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '44005')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SERVICIOS Y SUMINISTROS YUBARTA', 'servicios-y-suministros-yubarta-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3144476319', 'samy_pach@hotmail.com', 'LOS CASTILLOS SECTOR OASIS 1 MANZANA  08', '43580', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '43580')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA NATIVA CASA COLIBRI', 'posada-nativa-casa-colibri-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3218385559', 'mariaburitica51@gmail.com', 'CORREGIMIENTO DE ARUSI', '43272', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '43272')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL MIRAMAR CARIBE', 'hostal-miramar-caribe-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3162713772', 'miramarcpg@gmail.com', 'CALLE DEL COMERCIO CAPURGANA', '41940', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '41940')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VIAJES BAHIA', 'viajes-bahia-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3136950853', 'viajesbahia@hotmail.com', 'BARRIO EL CARMEN', '41659', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '41659')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE OPERACIÓN TURISTICA MAGIA CHOCOANA', 'agencia-de-operacion-turistica-magia-chocoana-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3128975143', 'adielafaj@yahoo.es', 'CORREGIMIENTO DEL VALLE', '40979', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '40979')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'EL MORRO HOSTERIA', 'el-morro-hosteria-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3207092389', 'monidasilva@me.com', 'CORREGIMIENTO DEL VALLE', '40585', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '40585')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'KIPARA TÉ', 'kipara-te-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3135077806', 'sauzasanapi@gmail.com', 'VEREDA COMUNIDAD BOCA DE JAGUA', '40270', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '40270')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'MARES LODGE CAPURGANA', 'mares-lodge-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3105436858', 'discostu2@msn.com', 'VIA EL AEROPUERTO CAPURGANA', '38869', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '38869')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CASA LILY S.A.S.', 'hotel-casa-lily-s-a-s-el-carmen', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('EL CARMEN DE ATRATO'))), '3128367985', 'hotelcasalily@gmail.com', 'CARRERA 4  6  76', '38867', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '38867')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CENTRAL J.M.', 'hotel-central-j-m-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '6702006', 'hotelcentraljm@gmail.com', 'CARRERA 6  27  15 PISO 2', '38866', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '38866')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VARIEDADES PAOLY-HOSTAL VILLA VINDA', 'variedades-paoly-hostal-villa-vinda-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3127733953', 'villavinda@hotmail.com', 'CALLE PRINCIPAL CAPURGANÁ', '37841', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '37841')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PALMAS DEL PACIFICO', 'hotel-palmas-del-pacifico-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '6836010', 'bertulfo@hotmail.com', 'CALLE DEL COMERCIO', '37000', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '37000')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL SAFIO', 'posada-el-safio-bahia-solano-2', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127769551', 'anibal.murillo@casur.gov.co', 'CORREGIMIENTO DEL VALLE COCHÓ', '36998', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '36998')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OPERADORA DE TURISMO COMUNITARIO MANO CAMBIADA SAS', 'operadora-de-turismo-comunitario-mano-cambiada-sas-nuqui', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3142182100', 'ventas@manocambiada.org', 'BARRIO LA  UNION', '36997', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '36997')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA CHACHITA', 'posada-turistica-chachita-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3215870509', 'posadaturisticachachita@gmail.com', 'CORREGIMIENTO DE PANGUI', '36996', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '36996')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL DOÑA TRINY', 'hotel-dona-triny-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3127518626', 'alexandermera@gmail.com', 'CALLE PRINCIPAL SAPZURRO', '36631', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '36631')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'OPERADORA DE TURISMO EL ALMEJAL NATURE TRAVEL', 'operadora-de-turismo-el-almejal-nature-travel-bahia-solano', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '4125050', 'info@almejal.com.co', 'PLAYA EL ALMEJAL- CORREGIMIENTO EL VALLE', '36464', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '36464')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA LA NAGUALA', 'posada-la-naguala-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3207227537', 'johana.cordoba07@yahoo.com.ar', 'CORREGIMIENTO DEL VALLE', '36317', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '36317')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SHAKI', 'hotel-shaki-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3106339649', 'glaboflo@yahoo.es', 'BARRIO VILLA OLGA', '35162', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '35162')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA EL BIEN GERMINA YA', 'posada-el-bien-germina-ya-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3208412694', 'c.elbiengerminaya@gmail.com', 'PLAYA EL ALMEJAL', '34996', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '34996')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VIAJES LA AMISTAD', 'viajes-la-amistad-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3146809503', 'anavity13@gmail.com', 'CALLE 21 4 101', '34665', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '34665')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL TOLÓN', 'hotel-tolon-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3122597051', 'juanatolonmoreno@gmail.com', 'CARRERA 9  44  05', '33819', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '33819')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA TURISTICA BRISAS DEL MAR', 'posada-turistica-brisas-del-mar-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3116150587', 'posadabrisadelmar@gmail.com', 'CORREGIMIENTO DEL HUINA', '32984', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '32984')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SONIA JAIMES COBOS', 'sonia-jaimes-cobos-quibdo', 'otro', 'operadores profesionales de congresos, ferias y convenciones', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6043742', 'licitaciones@qgeneracion.com', 'CALLE 24  NO. 22  21', '32427', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '32427')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES Y TURISMO "VIAJES HANSA"', 'agencia-de-viajes-y-turismo-viajes-hansa-istmina', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3146519272', 'gutierreznereida101@gmail.com', 'BRR CUBIS', '32163', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '32163')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL QUIBDO PLAZA', 'hotel-quibdo-plaza-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6713574', 'omarquintero63@hotmail.com', 'CARRERA 4  24  174', '32030', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '32030')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE LAS PALMERAS CAPURGANA', 'hospedaje-las-palmeras-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3104513011', 'contactenos@laspalmerascapurgana.com', 'BARRIO LAS PALMAS CAPURGANA', '32027', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '32027')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES GILAUTOURS', 'agencia-de-viajes-gilautours-condoto', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('CONDOTO'))), '3137074856', 'carmenzaesmas@hotmail.com', 'CALLE 15 2 B 175', '31419', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '31419')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL HAIDDY', 'hotel-haiddy-tado', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('TADO'))), '3103789133', 'hotelhaiddy@hotmail.com', 'CALLE 6  11  19', '31254', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '31254')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL FEDERAL', 'hotel-federal-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6713550', 'hotelaquinta5@gmail.com', 'CARRERA 5  21  13', '31145', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '31145')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PUNTA BRAVA', 'punta-brava-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '2354892', 'ecohotelpuntabrava@gmail.com', 'PLAYA PUNTA BRAVA - ZONA CABO CORRIENTES - ARUSI', '30432', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '30432')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL Y RESIDENCIA LA FRONTERA', 'hotel-y-residencia-la-frontera-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3147009679', 'h.lafrontera@hotmail.com', 'BARRIO EL CARMEN', '30111', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '30111')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LOS ANGELES A E HIJOS', 'hotel-los-angeles-a-e-hijos-istmina', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '3206201212', 'morenol2084@gmail.com', 'CARRERA 9  32 A 22 BRR CUBIS', '29729', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '29729')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LAS M.M.M.', 'hotel-las-m-m-m-tado', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('TADO'))), '3206201212', 'morenol2084@gmail.com', 'BRR SAN PEDRO', '29728', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '29728')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL DANI', 'hotel-dani-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6715783', 'hoteldani1@hotmail.com', 'CARRERA 11  26 A 40', '29022', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '29022')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AVIATUR CORTES & CIA', 'aviatur-cortes-cia-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3817111', 'y_moreno@aviatur.com', 'CARRERA 2  24  00 PISO 1', '28285', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '28285')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL LA TORTUGA JOROBADA', 'hostal-la-tortuga-jorobada-bahia-solano', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127563439', 'thehumpbackturtle@gmail.com', 'CORREGIMIENTO DEL VALLE', '27468', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '27468')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL BAHIA YUBARTA', 'hotel-bahia-yubarta-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '6827455', 'bahiayubarta@hotmail.com', 'B/ EL CARMEN', '27261', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '27261')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PALACIOS MOSQUERA EDINSON', 'palacios-mosquera-edinson-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3127096497', 'lindajudith1@gmail.com', 'PLAYA PUNTA HUINA- BAHIA SOLANO', '27128', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '27128')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CHOIBANA CASA', 'choibana-casa-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3125482969', 'nanak1971@yahoo.com', 'CORREGIMIENTO HUINA', '25355', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '25355')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES "COMFACHOCO"', 'agencia-de-viajes-comfachoco-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '946711597', 'agenciadeviajes@comfachoco.com.co', 'CALLE 23  4  31', '25014', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '25014')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOHOTEL PLAYAS DE CAPURGANA', 'ecohotel-playas-de-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3105424201', 'nora@capurgana.net', 'PLAN PAREJO CAPURGANA', '24938', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '24938')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA ARRECIFES', 'cabana-arrecifes-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3146107486', 'utrialamasbella1@gmail.com', 'CORREGIMIENTO DEL VALLE', '24866', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '24866')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS PATIO BONITO', 'cabanas-patio-bonito-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3146805736', 'arleyjose@hotmail.com', 'CALLE QUIBDO', '23953', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '23953')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL NUQUIMAR', 'hotel-nuquimar-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '6046091074', 'gerencia@hotelnuquimar.com', 'AVENIDA LA PLAYA', '23770', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '23770')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CENTRO RECREACIONAL Y VACACIONAL COMFACHOCO', 'centro-recreacional-y-vacacional-comfachoco-quibdo', 'hotel', 'centro vacacional', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '946711597', 'agenciadeviajes@comfachoco.com.co', 'CALLE 23  4  31', '23576', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '23576')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL Y CENTRO COMERCIAL DIVINO ECCEHOMO', 'hotel-y-centro-comercial-divino-eccehomo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6712092', 'hoteldivinoeccehomoquibdo@gmail.com', 'CARRERA 4  26  98', '20959', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20959')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'AGENCIA DE VIAJES Y DE TURISMO AEROPACIFICO TOURS', 'agencia-de-viajes-y-de-turismo-aeropacifico-tours-istmina', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ISTMINA'))), '6703911', 'aeropacificotours@hotmail.com', 'CARRERA 8  23  50 P2', '20886', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20886')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA PUNTARROCA', 'posada-puntarroca-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3117363773', 'jmateo323@hotmail.com', 'CORREGIMIENTO DEL VALLE', '20857', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20857')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSPEDAJE LOS BALCONES', 'hospedaje-los-balcones-quibdo', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6711088', 'Cupitracindypaola1@gmail.com', 'CARRERA 5  24  138', '20797', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20797')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'PRIMITIVO LODGE', 'primitivo-lodge-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3052233378', 'primitivolodge@gmail.com', 'PLAYA HUINA', '20287', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20287')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA VILLA MAGA', 'posada-villa-maga-bahia-solano', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3148540444', 'magapacifico@yahoo.com.mx', 'CORREGIMIENTO DEL VALLE', '20280', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20280')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS PLAYA TERCO', 'cabanas-playa-terco-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3147427806', 'cplayatrerco@yahoo.es', 'CORREGIMIENTO DE TERMALES', '20267', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '20267')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'POSADA DEL MAR BAHIA SOLANO', 'posada-del-mar-bahia-solano-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3106625842', 'posadadelmarbahiasolano@yahoo.es', 'B/ EL CARMEN', '19425', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '19425')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'SOL Y LUNA SOLARIUM', 'sol-y-luna-solarium-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3123186812', 'arualvasquez@hotmail.com', 'CORREGIMIENTO CAPURGANA', '17626', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '17626')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOHOTEL VALLE', 'ecohotel-valle-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3122445572', 'hotelvalle@hotmail.com', 'CORREGIMIENTO DEL VALLE', '17341', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '17341')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL SU PAPA', 'hotel-su-papa-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6707336', 'olgacop@hotmail.com', 'CALLE 26  3  23  ALAMEDA', '16844', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '16844')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CASA BLANCA LODGE CAPURGANA', 'casa-blanca-lodge-capurgana-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '6828789', 'turismo@lodgecasablanca.com', 'CORREGIMIENTO DE CAPURGANÁ', '15855', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '15855')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL LOS ROBLES', 'hotel-los-robles-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6707191', 'hotelroble@hotmail.com', 'CALLE 28  1  88', '15590', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '15590')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL CAPURGANA', 'hostal-capurgana-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3182064282', 'hostalcapurgana@gmail.com', 'CARRERA 2  5  32', '15293', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '15293')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL QUIBDO NO.2', 'hotel-quibdo-no-2-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6708838', 'hotelquibdo2rodriguez@gmail.com', 'CALLE 25  5  19 P 2', '15248', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '15248')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL QUIBDO', 'hotel-quibdo-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '3215988193', 'keisymarce1117@hotmail.com', 'CARRERA 6  25  86', '15247', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '15247')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CHOCO', 'hotel-choco-quibdo', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6707812', 'mash6911@gmail.com', 'CARRERA 6  25  36', '15246', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '15246')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'LOS ALMENDROS CAPURGANÁ', 'los-almendros-capurgana-acandi', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3163591150', 'losalmendros.resa@gmail.com', 'LOS ALMENDROS', '13784', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '13784')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOSTAL HELADERIA LUZ DE ORIENTE', 'hostal-heladeria-luz-de-oriente-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3103714902', 'luzdeoriente@hotmail.com', 'CALLE DEL COMERCIO CAPURGANA', '13149', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '13149')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑAS PIJIBA LODGE - 2', 'cabanas-pijiba-lodge-2-nuqui', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3117623763', 'gonzatrujillot@gmail.com', 'PLAYA TERQUITO TERMALES', '11687', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '11687')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'RASAMAR', 'rasamar-acandi', 'hotel', 'hostal', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3122211626', 'rasamar124@hotmail.com', 'CALLE CONSISTORIAL', '10896', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '10896')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CABAÑA LOS TERMALES', 'cabana-los-termales-nuqui', 'hotel', 'vivienda_turistica', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('NUQUI'))), '3226387812', 'lina1cori13@hotmail.com', 'CORREGIMIENTO DE TERMALES', '10115', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '10115')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL CALIPSO', 'hotel-calipso-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3116431261', 'ledyvasquez.c@gmail.com', 'CORREGIMIENTO CAPURGANA', '9543', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '9543')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL ECOLOGICO LAS MAÑANITAS S.A.S.', 'hotel-ecologico-las-mananitas-s-a-s-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '2663048', 'capurgana.lasmananitas@gmail.com', 'CORREGIMIENTO DE CAPURGANA', '7537', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '7537')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'CORTES & CIA SAS', 'cortes-cia-sas-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6046717022', 'cortesyciasas@gmail.com', 'CALLE 2  24  00', '6333', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '6333')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'VIAJES TRUANDO LIMITADA', 'viajes-truando-limitada-quibdo', 'agencia_viajes', NULL, (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('QUIBDO'))), '6713325', 'viajestruando1@gmail.com', 'CARRERA 3  30  - 43 PISO 2 HOTEL TEMÁTICO ETNIAS', '5249', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '5249')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'ECOLODGE EL ALMEJAL S.A.S.', 'ecolodge-el-almejal-s-a-s-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '4125050', 'info@almejal.com.co', 'PLAYA EL ALMEJAL CORREG EL VALLE', '4309', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '4309')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'TACARCUNA LODGE', 'tacarcuna-lodge-acandi', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('ACANDI'))), '3136518457', 'admon@hotelesdecostaacosta.com', 'CAPURGANA PARQUE PRINCIPAL', '2567', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '2567')
ON CONFLICT DO NOTHING;

INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)
SELECT 'HOTEL PLAYA DE ORO', 'hotel-playa-de-oro-bahia-solano', 'hotel', 'hotel', (SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower('BAHIA SOLANO'))), '3136518457', 'admon@hotelesdecostaacosta.com', 'PLAYA HUINA, DEL MUNICIPIO DE BAHIA SOLANO DEL DEPARTAMENTO CHOCO', '2538', TRUE, TRUE
WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = '2538')
ON CONFLICT DO NOTHING;
