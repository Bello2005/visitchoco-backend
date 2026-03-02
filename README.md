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
├── config/           # CORS, DB pool, Swagger, Weather
├── controllers/      # Lógica de negocio por dominio
│   ├── authController/
│   ├── municipalitiesController/
│   ├── indigenousController/
│   ├── ethnicDistributionController/
│   ├── populationController/
│   ├── weatherController/
│   ├── animalController/        # Fauna por municipio
│   ├── festivalController/      # Festivales por municipio
│   ├── attractionController/    # Atracciones turísticas por municipio
│   └── dashboardController/
├── middlewares/      # verifyJWT, error handler global
├── models/           # Tipos TypeScript
├── repositories/     # Capa de acceso a datos (SQL puro)
│   ├── municipalityRepository.ts
│   ├── indigenousRepository.ts
│   ├── ethnicRepository.ts
│   ├── userRepository.ts
│   ├── animalRepository.ts
│   ├── festivalRepository.ts
│   └── attractionRepository.ts
├── routes/           # Definición de rutas por dominio
│   ├── auth/   municipalities/   indigenous/   ethnic/
│   ├── population/   weather/   dashboard/
│   ├── animals/      festivals/   attractions/
├── schema/           # Esquema SQL completo (DB.sql)
├── services/         # Servicios externos
├── utils/            # Helpers (generateJWT, etc.)
└── validators/       # Schemas Zod (authValidator)
```

### Patrón de respuesta unificado

```json
// Éxito
{ "success": true, "data": { ... } }

// Error cliente (400 / 401 / 403 / 404)
{ "success": false, "message": "Descripción del error" }

// Error servidor (500)
{ "success": false, "message": "Error interno del servidor" }
```

---

## Base de datos

PostgreSQL 16 con extensión **PostGIS** alojado en **Neon**.

### Tablas principales

| Tabla | Descripción |
|-------|-------------|
| `municipalities` | 31 municipios: coordenadas, geometría PostGIS, zona, actividad, atracciones y transporte (JSONB) |
| `animals` | Fauna por municipio — nombre común, científico, imagen, audio |
| `attractions` | Atractivos turísticos por municipio |
| `festivals` | Festivales y eventos culturales — nombre, fecha inicio/fin |
| `population` | Datos censales DANE: total, cabecera, centros rurales |
| `municipality_ethnic_distribution` | Distribución étnica por municipio, año y fuente (DANE) |
| `users` | Usuarios con hash bcrypt y referencia a rol |
| `roles` | `admin` / `user` |
| `media_uploads` | Registro de archivos multimedia |
| `search_history` | Historial de búsquedas por usuario |

### Funciones y triggers

- `municipalities_set_geom()` — genera la geografía PostGIS al insertar/actualizar coordenadas
- `trigger_set_updated_at()` — actualiza `updated_at` en cada UPDATE
- `safe_text_to_jsonb()` — parseo tolerante de texto a JSONB

### Restaurar el esquema

```bash
psql -U postgres -d visitchoco < src/schema/DB.sql
```

---

## Endpoints de la API

Base URL local: `http://localhost:8000/api`

### Autenticación — `/api/auth`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `POST` | `/auth/login` | No | Login → devuelve JWT |
| `POST` | `/auth/register` | No | Registro de usuario |

### Municipios — `/api/municipalities`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/municipalities` | No | Todos los municipios del Chocó |
| `GET` | `/municipalities/:slug` | No | Municipio por slug |

### Comunidades indígenas — `/api/indigenous`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/indigenous` | No | Todas las reservas indígenas |
| `GET` | `/indigenous/:id` | No | Reserva por ID |
| `GET` | `/indigenous/municipality/:codDane` | No | Reservas de un municipio |

### Distribución étnica — `/api/ethnic`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/ethnic` | No | Distribución étnica completa |
| `GET` | `/ethnic/:codDane` | No | Por municipio (cod DANE) |
| `GET` | `/ethnic/stats` | No | Estadísticas globales |
| `GET` | `/ethnic/latest` | No | Resumen del año más reciente |
| `GET` | `/ethnic/summary/total` | No | Resumen total histórico |
| `GET` | `/ethnic/summary/by-year` | No | Agrupado por año |

### Fauna — `/api/animals`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/animals` | No | Todos los animales del Chocó |
| `GET` | `/animals/municipality/:municipalityId` | No | Fauna de un municipio |

### Festivales — `/api/festivals`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/festivals` | No | Todos los festivales |
| `GET` | `/festivals/municipality/:municipalityId` | No | Festivales de un municipio |

### Atracciones turísticas — `/api/attractions`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/attractions` | No | Todos los atractivos turísticos |
| `GET` | `/attractions/municipality/:municipalityId` | No | Atracciones de un municipio |

### Población — `/api/population`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/population` | No | Datos de población de todos los municipios |
| `GET` | `/population/:codDane` | No | Población de un municipio |

### Clima — `/api/weather`

| Método | Ruta | Auth | Descripción |
|--------|------|------|-------------|
| `GET` | `/weather/:municipalityName` | No | Clima actual (OpenWeatherMap) |

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

Crear `.env.local` en la raíz:

```env
# Base de datos (Neon / PostgreSQL + PostGIS)
DATABASE_URL=postgresql://user:pass@host/db?sslmode=require
# Fallback si DATABASE_URL no está definido:
DB_HOST=   DB_USER=   DB_PASSWORD=   DB_NAME=   DB_PORT=5432

PORT=8000
JWT_SECRET=your_jwt_secret_min_32_chars
WEATHER_API_KEY=your_openweathermap_key
FRONTEND_URL=https://visitchoco-frontend.vercel.app
```

---

## Instalación y desarrollo

```bash
# Instalar dependencias
pnpm install

# Configurar variables de entorno
cp .env.example .env.local   # completar con valores reales

# Restaurar esquema (opcional, BD Neon ya tiene datos)
psql $DATABASE_URL < src/schema/DB.sql

# Desarrollo con hot reload
pnpm dev

# Build producción
pnpm build
```

---

## Testing

```bash
pnpm test
pnpm test --coverage
```

| Suite | Tests | Descripción |
|-------|-------|-------------|
| `auth.test.ts` | 5 | verifyJWT: sin header, formato inválido, token inválido, expirado, válido |
| `authValidator.test.ts` | 7 | loginSchema y registerSchema con Zod |

---

## Despliegue en Vercel

```bash
vercel --prod
```

Variables en Vercel: `DATABASE_URL` · `JWT_SECRET` · `WEATHER_API_KEY` · `FRONTEND_URL`

---

## Seguridad

- Contraseñas hasheadas con **bcrypt** (10 salt rounds)
- Tokens **JWT** verificados en cada request protegido
- Validación de inputs con **Zod** en todos los endpoints POST
- CORS restringido al dominio del frontend (`FRONTEND_URL`)
- Middleware global de errores — sin stack traces al cliente en producción

---

## Notas de compatibilidad

- **Express 5 + path-to-regexp@8:** no usar `app.options("*", cors(...))` — usar solo `app.use(cors(corsOptions))`
- **BD Neon:** el schema real puede diferir de `src/schema/DB.sql` — verificar con `\d nombre_tabla`
- Los archivos `.js` en `src/` son los compilados que ejecuta ts-node-dev (toman precedencia sobre `.ts`)
