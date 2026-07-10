/**
 * Genera src/schema/seed_establecimientos_rnt.sql a partir del Excel
 * de la Cámara de Comercio del Chocó (BASE DE DATOS DE RNT.xlsx).
 *
 * Uso:  pnpm tsx scripts/generate-rnt-seed.ts <ruta al .xlsx>
 *
 * NO ejecuta nada contra la base de datos — solo escribe el .sql,
 * que se corre manualmente en pgAdmin.
 */
import * as XLSX from 'xlsx';
import { writeFileSync } from 'fs';
import { resolve, join } from 'path';

// Cabeceras que esperamos encontrar en el Excel (Hoja1)
const EXPECTED_HEADERS = [
  'Razon_Social',
  'Desc_Municipio',
  'Codigo_Rnt',
  'Descripcion_Categoria',
  'Descripcion_Subcategoria',
  'Descripcion_Estado_Rnt',
  'Correo_Electronico',
  'Telefono_Reportado_1',
  'Direccion_Comercial',
] as const;

interface Row {
  Razon_Social?: string;
  Desc_Municipio?: string;
  Codigo_Rnt?: number | string;
  Descripcion_Categoria?: string;
  Descripcion_Subcategoria?: string;
  Descripcion_Estado_Rnt?: string;
  Correo_Electronico?: string;
  Correo_Electronico_Reportado?: string;
  Telefono_Reportado_1?: string | number;
  Telefono_Reportado_2?: string | number;
  Direccion_Comercial?: string;
}

/** Escapa comillas simples para literal SQL; null/vacío → NULL */
function sqlStr(value: unknown): string {
  const s = String(value ?? '').trim();
  if (!s) return 'NULL';
  return `'${s.replace(/'/g, "''")}'`;
}

/** Quita acentos y normaliza para comparar */
function normalize(s: string): string {
  return s
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
    .toUpperCase();
}

/** nombre → kebab-case sin acentos (misma convención de los slugs existentes en la DB) */
function kebab(s: string): string {
  return s
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

/** Mapeo categoría del Excel → (categoria, subcategoria) del schema */
function mapCategoria(cat: string, subcat: string): { categoria: string; subcategoria: string | null } {
  const c = normalize(cat);
  const s = normalize(subcat);

  if (c.includes('ALOJAMIENTO TURISTICO')) {
    if (s.includes('HOTEL') && !s.includes('APARTAHOTEL')) return { categoria: 'hotel', subcategoria: 'hotel' };
    if (s.includes('HOSTAL')) return { categoria: 'hotel', subcategoria: 'hostal' };
    // otras formas de alojamiento (apartahotel, albergue, centro vacacional, glamping…)
    return { categoria: 'hotel', subcategoria: subcat.trim().toLowerCase() || null };
  }
  if (c.includes('VIVIENDAS TURISTICAS')) return { categoria: 'hotel', subcategoria: 'vivienda_turistica' };
  if (c.includes('AGENCIAS DE VIAJES')) return { categoria: 'agencia_viajes', subcategoria: null };
  if (c.includes('GUIAS DE TURISMO')) return { categoria: 'guia_turismo', subcategoria: null };
  return { categoria: 'otro', subcategoria: cat.trim().toLowerCase() || null };
}

/**
 * Municipio del Excel → expresión SQL para municipio_id.
 * Normaliza paréntesis ("BOJAYA (BELLAVISTA)") y espacios dobles.
 * 'NUEVO BELEN DE BAJIRA' → NULL (deslinde IGAC pendiente).
 * 'EL CARMEN' → El Carmen de Atrato (jurisdicción de la Cámara del Chocó).
 */
function municipioSql(raw: string): string {
  let name = normalize(raw).replace(/\s*\(.*\)\s*/g, ' ').replace(/\s+/g, ' ').trim();
  if (name === 'NUEVO BELEN DE BAJIRA') return 'NULL';
  if (name === 'EL CARMEN') name = 'EL CARMEN DE ATRATO';
  return `(SELECT id FROM municipalities WHERE unaccent(lower(name)) = unaccent(lower(${sqlStr(name)})))`;
}

// ── main ────────────────────────────────────────────────────────
const inputPath = process.argv[2];
if (!inputPath) {
  console.error('Uso: pnpm tsx scripts/generate-rnt-seed.ts <ruta al .xlsx>');
  process.exit(1);
}

const wb = XLSX.readFile(resolve(inputPath));
const sheet = wb.Sheets[wb.SheetNames[0]];
const headerRow = (XLSX.utils.sheet_to_json(sheet, { header: 1 })[0] ?? []) as string[];

const missing = EXPECTED_HEADERS.filter((h) => !headerRow.includes(h));
if (missing.length > 0) {
  console.error('❌ El Excel no tiene las cabeceras esperadas.');
  console.error('   Faltan:', missing.join(', '));
  console.error('   Cabeceras detectadas:', JSON.stringify(headerRow));
  console.error('   Ajusta el mapeo manualmente en EXPECTED_HEADERS antes de continuar.');
  process.exit(1);
}

const rows = (XLSX.utils.sheet_to_json(sheet) as Row[]).filter(
  (r) => r.Razon_Social && String(r.Razon_Social).trim()
);

const seenRnt = new Set<string>();
const seenSlugs = new Map<string, number>();
const inserts: string[] = [];
let omitidasEstado = 0;
let omitidasDuplicadas = 0;

/** slug único dentro del lote: nombre-municipio, colisiones → sufijo -2, -3… */
function uniqueSlug(nombre: string, municipioRaw: string): string {
  const base = kebab(`${nombre} ${municipioRaw}`);
  const n = (seenSlugs.get(base) ?? 0) + 1;
  seenSlugs.set(base, n);
  return n === 1 ? base : `${base}-${n}`;
}

for (const r of rows) {
  // Solo registros ACTIVOS del RNT — un registro suspendido/cancelado no debe entrar como verificado
  if (normalize(String(r.Descripcion_Estado_Rnt ?? '')) !== 'ACTIVO') {
    omitidasEstado++;
    continue;
  }

  const rnt = String(r.Codigo_Rnt ?? '').trim();
  if (rnt && seenRnt.has(rnt)) {
    omitidasDuplicadas++;
    continue;
  }
  if (rnt) seenRnt.add(rnt);

  const { categoria, subcategoria } = mapCategoria(
    String(r.Descripcion_Categoria ?? ''),
    String(r.Descripcion_Subcategoria ?? '')
  );

  const email = String(r.Correo_Electronico ?? '').trim() || String(r.Correo_Electronico_Reportado ?? '').trim();
  const telefono = String(r.Telefono_Reportado_1 ?? '').trim() || String(r.Telefono_Reportado_2 ?? '').trim();
  const slug = uniqueSlug(String(r.Razon_Social), String(r.Desc_Municipio ?? ''));

  // Idempotente por rnt (clave natural del registro) + ON CONFLICT como guarda del slug único
  inserts.push(
    `INSERT INTO establecimientos (nombre, slug, categoria, subcategoria, municipio_id, telefono, email, direccion, rnt, activo, verificado)\n` +
      `SELECT ${sqlStr(r.Razon_Social)}, ${sqlStr(slug)}, ${sqlStr(categoria)}, ${sqlStr(subcategoria)}, ${municipioSql(String(r.Desc_Municipio ?? ''))}, ` +
      `${sqlStr(telefono)}, ${sqlStr(email)}, ${sqlStr(r.Direccion_Comercial)}, ${sqlStr(rnt)}, TRUE, TRUE\n` +
      `WHERE NOT EXISTS (SELECT 1 FROM establecimientos WHERE rnt = ${sqlStr(rnt)})\n` +
      `ON CONFLICT DO NOTHING;`
  );
}

const fecha = new Date().toISOString().slice(0, 10);
const header = `-- ============================================================
-- Seed de establecimientos — Registro Nacional de Turismo (RNT)
-- Fuente: BASE DE DATOS DE RNT.xlsx — Cámara de Comercio del Chocó
-- Generado: ${fecha} por scripts/generate-rnt-seed.ts (NO editar a mano)
-- Total de INSERTs: ${inserts.length}
--   (omitidas por estado != ACTIVO: ${omitidasEstado}, por RNT duplicado: ${omitidasDuplicadas})
--
-- Orden: si la tabla aún no tiene columna slug, correr PRIMERO
-- src/schema/2026_07_slug_establecimientos.sql. Luego este seed.
-- Idempotente: cada INSERT se salta si ya existe una fila con el mismo rnt.
--
-- Verificación: correr este SELECT antes y después del seed
--   SELECT COUNT(*) FROM establecimientos;
-- ============================================================

`;

const outPath = join(__dirname, '..', 'src', 'schema', 'seed_establecimientos_rnt.sql');
writeFileSync(outPath, header + inserts.join('\n\n') + '\n');
console.log(`✓ ${inserts.length} INSERTs escritos en ${outPath}`);
if (omitidasEstado) console.log(`  (${omitidasEstado} filas omitidas por estado != ACTIVO)`);
if (omitidasDuplicadas) console.log(`  (${omitidasDuplicadas} filas omitidas por RNT duplicado)`);
