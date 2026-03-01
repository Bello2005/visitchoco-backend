# visitChoco — Backend API

REST API para la plataforma **visitChoco**, una guía interactiva de turismo, biodiversidad y datos demográficos del departamento del Chocó, Colombia.

- **Repositorio:** [github.com/Bello2005/visitchoco-backend](https://github.com/Bello2005/visitchoco-backend)
- **Frontend:** [github.com/Bello2005/visitchoco-frontend](https://github.com/Bello2005/visitchoco-frontend)
- **Desplegado en:** Vercel (Serverless Node.js)

---

## Stack tecnológico

| Categoría | Tecnología |
|-----------|-----------|
| Runtime | Node.js 20+ |
| Framework | Express 5 |
| Lenguaje | TypeScript 5 |
| Base de datos | PostgreSQL 16 + PostGIS |
| Query layer | `pg` (driver nativo) |
| Autenticación | JWT (`jsonwebtoken`) + bcrypt |
| Validación | Zod 4 |
| Documentación | Swagger (swagger-jsdoc + swagger-ui-express) |
| Testing | Jest 30 + ts-jest + Supertest |
| Despliegue | Vercel (`@vercel/node`) |

---

## Arquitectura

```
src/
├── config/           # Configuraciones (CORS, DB pool, Swagger, Weather)
├── controllers/      # Lógica de negocio por dominio
│   ├── authController/
│   ├── municipalitiesController/
│   ├── indigenousController/
│   ├── ethnicDistributionController/
│   ├── populationController/
│   ├── weatherController/
│   └── dashboardController/
├── middlewares/      # verifyJWT (auth), error handler global
├── models/           # Tipos TypeScript
├── repositories/     # Capa de acceso a datos (SQL puro)
│   ├── municipalityRepository.ts
│   ├── indigenousRepository.ts
│   ├── ethnicRepository.ts
│   └── userRepository.ts
├── routes/           # Definición de rutas por dominio
│   ├── auth/
│   ├── municipalities/
│   ├── indigenous/
│   ├── ethnic/
│   ├── population/
│   ├── weather/
│   └── dashboard/
├── schema/           # Esquema SQL completo (DB.sql)
├── services/         # Servicios externos (Supabase storage)
├── utils/            # Helpers (generateJWT, etc.)
└── validators/       # Schemas Zod (authValidator)
```

### Patrón de respuesta unificado

Todos los endpoints usan el mismo formato de respuesta:

```json
// Éxito
{ "success": true, "data": { ... } }

// Error de cliente (400 / 401 / 403 / 404)
{ "success": false, "message": "Descripción del error" }

// Error de servidor (500)
{ "success": false, "message": "Error interno del servidor" }
```

---

## Base de datos

PostgreSQL 16 con extensión **PostGIS** para datos geoespaciales.

### Tablas principales

| Tabla | Descripción |
|-------|-------------|
| `municipalities` | 31 municipios del Chocó: coordenadas, geometría de territorio (MultiPolygon SRID 4326), zona, actividad principal, atracciones y transporte (JSONB) |
| `animals` | Fauna por municipio — nombre común, científico, imagen, audio |
| `attractions` | Atractivos turísticos por municipio |
| `festivals` | Festivales y eventos culturales por municipio |
| `population` | Datos censales DANE: total, cabecera municipal, centros rurales |
| `municipality_ethnic_distribution` | Distribución étnica por municipio, año y fuente (DANE) |
| `ethnicity_codes` | Catálogo de códigos étnicos DANE |
| `users` | Usuarios con hash bcrypt y referencia a rol |
| `roles` | `admin` / `user` |
| `media_uploads` | Registro de archivos multimedia subidos |
| `search_history` | Historial de búsquedas por usuario |

### Funciones y triggers automáticos

- `municipalities_set_geom()` — genera la geografía PostGIS (`POINT 4326`) al insertar/actualizar `lat`/`lon`
- `trigger_set_updated_at()` — actualiza `updated_at` en cada UPDATE
- `safe_text_to_jsonb()` — parseo tolerante de texto a JSONB (maneja comillas dobles, tipográficas, etc.)

### Vistas

| Vista | Descripción |
|-------|-------------|
| `vw_municipalities_population` | Municipios con datos de población |
| `vw_municipality_population_summary` | Resumen agregado de población por municipio |
| `vw_muni_ethnic_with_label` | Distribución étnica con etiquetas legibles y geometría |
| `v_municipality_ethnic_readable` | Distribución étnica con nombre de etnia |

### Restaurar el esquema

```bash
psql -U postgres -d visitchoco < src/schema/DB.sql
```

---

## Endpoints de la API

Base URL local: `http://localhost:8000/api`
Base URL producción: `https://visitchoco-backend.vercel.app/api`

### Autenticación — `/api/auth`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `POST` | `/auth/login` | No | Iniciar sesión → devuelve JWT |
| `POST` | `/auth/register` | No | Registrar nuevo usuario |

**Body login/register:**
```json
{ "email": "user@example.com", "password": "minimo8chars" }
```
**Respuesta login:**
```json
{ "success": true, "data": { "token": "eyJ...", "role": "user" } }
```

### Municipios — `/api/municipalities`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/municipalities` | No | Todos los municipios del Chocó |
| `GET` | `/municipalities/:slug` | No | Detalle de un municipio por slug |

### Comunidades indígenas — `/api/indigenous`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/indigenous` | No | Todas las reservas indígenas |
| `GET` | `/indigenous/:id` | No | Reserva por ID |
| `GET` | `/indigenous/municipality/:codDane` | No | Reservas de un municipio (cod DANE) |

### Distribución étnica — `/api/ethnic`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/ethnic` | No | Distribución étnica completa |
| `GET` | `/ethnic/municipality/:codDane` | No | Por municipio (cod DANE) |
| `GET` | `/ethnic/stats` | No | Estadísticas globales |
| `GET` | `/ethnic/summary/latest` | No | Resumen del año más reciente |
| `GET` | `/ethnic/summary/total` | No | Resumen total histórico |
| `GET` | `/ethnic/year/:year` | No | Por año específico |

### Población — `/api/population`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/population` | No | Datos de población de todos los municipios |
| `GET` | `/population/:codDane` | No | Población de un municipio |

### Clima — `/api/weather`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/weather/:municipalityName` | No | Clima actual vía OpenWeatherMap |

### Dashboard — `/api` (requiere JWT)

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/admin/dashboard` | Bearer JWT | Estadísticas del sistema (solo admin) |

### Documentación Swagger

```
GET /api/docs
```

---

## Variables de entorno

Crear `.env.local` en la raíz del proyecto basándose en `.env.example`:

```env
# Base de datos (PostgreSQL + PostGIS)
DB_HOST=your_db_host
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=your_db_name
DB_PORT=5432

# Servidor
PORT=8000

# Clima — https://openweathermap.org/api
WEATHER_API_KEY=your_openweathermap_api_key

# JWT (mínimo 32 caracteres aleatorios)
JWT_SECRET=your_jwt_secret

# CORS — URL del frontend desplegado
FRONTEND_URL=https://visitchoco-frontend.vercel.app
```

> `.env.local` nunca se sube a git. Solo `.env.example` (sin valores reales).

---

## Instalación y desarrollo

### Requisitos previos

- Node.js 20+
- pnpm 9+
- PostgreSQL 16 con extensión PostGIS activa

```bash
# 1. Instalar dependencias
pnpm install

# 2. Configurar variables de entorno
cp .env.example .env.local
# editar .env.local con los valores reales

# 3. Restaurar la base de datos
psql -U postgres -d visitchoco < src/schema/DB.sql

# 4. Iniciar servidor en modo desarrollo (hot reload)
pnpm dev

# 5. Compilar para producción
pnpm build

# 6. Iniciar en producción (requiere build previo)
pnpm start
```

---

## Testing

```bash
# Ejecutar todos los tests
pnpm test

# Con reporte de cobertura
pnpm test --coverage
```

| Suite | Tests | Descripción |
|-------|-------|-------------|
| `src/middlewares/auth.test.ts` | 5 | verifyJWT: sin header, formato inválido, token inválido, expirado, válido |
| `src/validators/authValidator.test.ts` | 7 | loginSchema y registerSchema con Zod |

---

## Despliegue en Vercel

```bash
# Login (primera vez)
vercel login

# Despliegue preview
vercel

# Despliegue producción
vercel --prod
```

Variables a configurar en el dashboard de Vercel (Settings → Environment Variables):

`DB_HOST` · `DB_USER` · `DB_PASSWORD` · `DB_NAME` · `DB_PORT` · `JWT_SECRET` · `WEATHER_API_KEY` · `FRONTEND_URL`

---

## Seguridad

- Contraseñas hasheadas con **bcrypt** (10 salt rounds)
- Tokens **JWT** con verificación de expiración en cada request
- Validación de inputs con **Zod** en todos los endpoints POST
- CORS restringido al dominio del frontend configurado en `FRONTEND_URL` (Express 5 compatible: `app.use(cors())` sin `app.options("*")`)
- Middleware global de errores — ningún stack trace llega al cliente en producción
- Variables sensibles exclusivamente en variables de entorno

---

## Notas de compatibilidad

- **Express 5 + path-to-regexp@8:** no usar `app.options("*", cors(...))` — incompatible. Usar únicamente `app.use(cors(corsOptions))`
- **Reservas indígenas:** el campo `territory_geom` se expone como GeoJSON vía `ST_AsGeoJSON`. Los campos de ubicación son `cod_dane`, `department_code`, `municipality_code`, `lat` y `lon`
- **Base de datos:** se usa Neon (PostgreSQL + PostGIS en la nube). El schema real puede diferir del `src/schema/DB.sql` local — verificar siempre con `\d nombre_tabla`
