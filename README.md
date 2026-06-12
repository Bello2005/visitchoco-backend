# VisitChocó — Backend API

API REST para **VisitChocó**: plataforma de datos geográficos, turísticos, culturales y de biodiversidad del departamento de **Chocó, Colombia**. Expone información estructurada sobre municipios, distribución étnica, fauna, fiestas, patrimonio, prestadores de servicios turísticos (RNT), clima y autenticación.

Documentación interactiva disponible en **`/api/docs`** (Swagger UI).

---

## Stack tecnológico

| Capa | Tecnología |
|------|-----------|
| Runtime | Node.js 20+ |
| Framework | Express 5 |
| Base de datos | PostgreSQL (pg) |
| Documentación | OpenAPI 3 + Swagger UI |
| Validación | Zod |
| Autenticación | JWT (Bearer token) |
| Tests | Jest + ts-jest + Supertest |
| Package manager | pnpm |

---

## Requisitos

- **Node.js** 20+
- **pnpm** 10+
- **PostgreSQL** con el schema de VisitChocó aplicado (`src/schema/`)

---

## Inicio rápido

```bash
cd visitchoco-backend
pnpm install
cp .env.example .env.local
# Editar .env.local con credenciales reales
pnpm dev
```

El servidor escucha en el puerto configurado en `PORT` (por defecto **8000**).

### Build de producción

```bash
pnpm build
pnpm start
```

---

## Variables de entorno

| Variable | Descripción |
|----------|-------------|
| `DATABASE_URL` | URL completa de Postgres (activa SSL automáticamente). Tiene prioridad sobre las variables individuales |
| `DB_HOST` | Host de Postgres (cuando no se usa `DATABASE_URL`) |
| `DB_USER` | Usuario de Postgres |
| `DB_PASSWORD` | Contraseña de Postgres |
| `DB_NAME` | Nombre de la base de datos |
| `DB_PORT` | Puerto de Postgres (por defecto `5432`) |
| `PORT` | Puerto HTTP del servidor (por defecto `8000`) |
| `NODE_ENV` | `development` relaja CORS para localhost |
| `JWT_SECRET` | Secreto para firmar tokens JWT (**requerido** en producción) |
| `JWT_EXPIRES_IN` | Tiempo de vida del token (por defecto `1h`) |
| `WEATHER_API_KEY` | API key de OpenWeatherMap (solo backend, nunca expuesta al cliente) |
| `API_BASE_URL` | URL pública del servidor para la definición `servers` de Swagger |

> Nunca commitees secretos reales. Usa las variables de entorno de la plataforma (Vercel, Railway, etc.) en producción.

### Variables de entorno del admin

| Variable | Descripción | Si falta |
|----------|-------------|----------|
| `RESEND_API_KEY` | API key de Resend para los emails de acceso | No falla: el código y el enlace se imprimen en consola (`[EMAIL DEV] …`) |
| `RESEND_FROM` | Remitente, ej. `VisitChocó <acceso@visitchoco.cloud>` | Usa `RESEND_FROM_NAME <onboarding@resend.dev>` (válido sin dominio verificado) |
| `ADMIN_URL` | URL del panel para construir el enlace del email | Usa `ADMIN_FRONTEND_URL` o `https://admin.visitchoco.cloud` |
| `MAGIC_LINK_EXPIRES_MIN` | Minutos de vida del enlace/código (por defecto `15`) | — |
| `R2_ACCOUNT_ID` | Cuenta de Cloudflare R2 | `/api/admin/media/upload-url` responde `501 media_no_configurado`; el resto del admin funciona |
| `R2_ACCESS_KEY_ID` / `R2_SECRET_ACCESS_KEY` | Credenciales del API token de R2 | Ídem |
| `R2_BUCKET` | Bucket de media (ej. `visitchoco-media`) | Ídem |
| `R2_PUBLIC_URL` | Dominio público del bucket (ej. `https://media.visitchoco.cloud`) | Ídem |
| `UMAMI_API_URL` / `UMAMI_API_KEY` / `UMAMI_WEBSITE_ID` | Analytics opcional | `/api/admin/metrics/global` responde `error: analytics_no_configurado` |

Notas:
- `JWT_SECRET` es compartido con el resto de la API y es **requerido** para el admin.
- Con `DATABASE_URL` definida el pool usa `@neondatabase/serverless` (WebSocket, mitiga el cold start de Neon); sin ella usa `pg` contra `DB_HOST` (dev local).
- Flujo completo con `curl` en [POSTMAN_ADMIN.md](./POSTMAN_ADMIN.md).

---

## Scripts

| Comando | Acción |
|---------|--------|
| `pnpm dev` | Servidor en modo desarrollo con hot-reload |
| `pnpm build` | Compilación TypeScript |
| `pnpm start` | Servidor en producción |
| `pnpm test` | Suite de tests con Jest |

---

## Endpoints (resumen)

| Método | Ruta | Descripción |
|--------|------|-------------|
| `POST` | `/api/auth/register` | Registrar usuario |
| `POST` | `/api/auth/login` | Login — devuelve JWT |
| `GET` | `/api/municipalities` | Listado de 31 municipios |
| `GET` | `/api/municipalities/:slug` | Detalle de municipio |
| `GET` | `/api/indigenous` | Reservas indígenas |
| `GET` | `/api/ethnic` | Distribución étnica |
| `GET` | `/api/animals` | Especies de fauna |
| `GET` | `/api/festivals` | Festividades |
| `GET` | `/api/fiestas` | Fiestas patronales con calendario |
| `GET` | `/api/patrimonio` | Patrimonio cultural (material e inmaterial) |
| `GET` | `/api/rnt` | Prestadores de turismo (Registro Nacional de Turismo) |
| `GET` | `/api/population` | Datos de población por municipio |
| `GET` | `/api/weather/:municipio` | Clima en tiempo real vía OpenWeatherMap |
| `*` | `/api/dashboard/*` | Dashboard protegido — requiere JWT válido |
| `GET` | `/api/docs` | Documentación Swagger UI |

Consulta `/api/docs` para los schemas completos de request/response.

---

## Estructura del proyecto

```
src/
├── index.ts                  # Punto de entrada — Express app
├── config/
│   ├── db.ts                 # Pool de conexión PostgreSQL
│   ├── cors.ts               # Configuración CORS por entorno
│   ├── swagger.ts            # Definición OpenAPI
│   └── weather.ts            # Config OpenWeatherMap
├── routes/                   # Definición de rutas por dominio
│   ├── auth/, municipalities/, indigenous/, ethnic/
│   ├── animals/, festivals/, fiestas/, patrimonio/
│   ├── attractions/, rnt/, population/, weather/, dashboard/
├── controllers/              # Lógica de request/response por dominio
├── repositories/             # Consultas SQL directas a PostgreSQL
├── services/
│   ├── authService/          # Hash de contraseñas, firma JWT
│   └── weatherService/       # Integración OpenWeatherMap
├── middlewares/
│   └── auth.ts               # Middleware verifyJWT
├── models/
│   └── Users/Users.ts        # Modelo de usuario
├── validators/
│   └── authValidator.ts      # Validación Zod para auth
├── schema/                   # Scripts SQL de base de datos
│   ├── DB.sql                # Schema principal
│   ├── municipalities.sql
│   ├── indigenous_reserves.sql
│   └── rnt_resumen.sql
└── utils/
    └── geojsonUtils.ts       # Utilidades para datos geoespaciales

data/                         # GeoJSON y datos geográficos del Chocó
├── chocoGeoData.ts           # Polígonos de municipios
├── chocoMunicipalities.ts    # Datos base de municipios
└── chocoRegions.ts           # Subregiones del departamento
```

---

## CORS

Configurado en `src/config/cors.ts`:

- **Desarrollo:** permite orígenes `localhost` / `127.0.0.1`
- **Producción:** permite orígenes configurados, incluyendo patrones `*.vercel.app`

Ajusta `configureCors` si despliegas en un dominio personalizado.

---

## Tests

```bash
pnpm test
```

Jest con ts-jest. Tests existentes: `authValidator.test.ts`, `auth.middleware.test.ts`, `AuthContext.test.tsx` (compartido con frontend).

---

## Despliegue

Compatible con **Vercel** (serverless) y plataformas como Railway o Render.

1. Configurar todas las variables de entorno en la plataforma
2. Asegurarse de que `DATABASE_URL` apunte a la instancia de Postgres en producción
3. Verificar que `JWT_SECRET` sea un valor seguro y aleatorio
4. Confirmar que `API_BASE_URL` coincide con la URL pública del servicio

---

## Repositorio relacionado

**[visitchoco-frontend](../visitchoco-frontend)** — Aplicación React que consume esta API (configurada vía `VITE_API_BASE_URL`).
