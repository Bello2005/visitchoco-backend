# API Admin — flujo completo con curl

Base local: `http://localhost:8000/api/admin`. En producción: `https://<backend>/api/admin`.

> Sin `RESEND_API_KEY` el backend no envía email: imprime en consola
> `[EMAIL DEV] para=… codigo=… enlace=…`. Copia el código o el token de ahí.

## 1. Login (envía enlace + código de 6 dígitos)

```bash
curl -X POST http://localhost:8000/api/admin/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"ldbello@miuniclaretiana.edu.co"}'
# → { "ok": true }   (siempre, exista o no la cuenta)
```

`POST /auth/magic-link` es un alias idéntico (es el que usa el panel).

## 2. Verify — con el código de 6 dígitos (acepta el espacio)

```bash
curl -X POST http://localhost:8000/api/admin/auth/verify \
  -H 'Content-Type: application/json' \
  -d '{"token":"123 456"}'
# → { "ok": true, "accessToken": "eyJ…", "user": { "id": "…", "email": "…", "role": "super_admin" } }
```

## 2b. Verify — con el token largo del enlace

```bash
curl -X POST http://localhost:8000/api/admin/auth/verify \
  -H 'Content-Type: application/json' \
  -d '{"token":"3f8a9c…64-hex…"}'
```

Errores: credencial inválida/expirada/ya usada → `401 { "error": "codigo_invalido" }`.
Más de 5 intentos por minuto por IP → `429 { "error": "demasiados_intentos" }`.
Verificar consume **las dos** credenciales (enlace y código) a la vez.

```bash
export TOKEN="eyJ…"   # accessToken del paso 2
AUTH="Authorization: Bearer $TOKEN"
```

## 3. Sesión

```bash
curl http://localhost:8000/api/admin/auth/me -H "$AUTH"
curl -X POST http://localhost:8000/api/admin/auth/logout -H "$AUTH"
```

## 4. Establecimientos

```bash
# Lista (sin notas_admin) — filtros: q, categoria, municipio_id, estado=activo|inactivo, reclamado=si|no
curl "http://localhost:8000/api/admin/establecimientos?q=hotel&estado=activo&limit=10" -H "$AUTH"

# Detalle (con notas_admin + media + cambios_pendientes)
curl http://localhost:8000/api/admin/establecimientos/<uuid> -H "$AUTH"

# PATCH — admin escribe directo; editor/negocio reciben { ok, en_revision: true, queue_id }
curl -X PATCH http://localhost:8000/api/admin/establecimientos/<uuid> \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"telefono":"+57 300 000 0000","verificado":true,"notas_admin":"Verificado por RNT"}'

# Soft delete (solo admin)
curl -X DELETE http://localhost:8000/api/admin/establecimientos/<uuid> -H "$AUTH"
```

## 5. Approvals

```bash
curl "http://localhost:8000/api/admin/approvals?estado=pendiente&limit=20" -H "$AUTH"

curl -X POST http://localhost:8000/api/admin/approvals/<uuid>/aprobar -H "$AUTH"

curl -X POST http://localhost:8000/api/admin/approvals/<uuid>/rechazar \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"comentario":"Falta el RNT actualizado"}'
```

## 6. Metrics

```bash
curl "http://localhost:8000/api/admin/metrics/dashboard?range=30d" -H "$AUTH"
curl "http://localhost:8000/api/admin/metrics/global?range=30d" -H "$AUTH"
# Sin Umami: { "stats": null, "pageviews": null, "events": null, "range": "30d", "error": "analytics_no_configurado" }
```

## 7. Municipios / Cultura / Fauna

```bash
curl "http://localhost:8000/api/admin/municipios?q=quib" -H "$AUTH"
curl http://localhost:8000/api/admin/municipios/1 -H "$AUTH"
curl -X PATCH http://localhost:8000/api/admin/municipios/1 \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"description":"Capital del Chocó…","main_activity":"Comercio y cultura"}'

curl "http://localhost:8000/api/admin/cultura/patrimonio?municipio=Quibdó" -H "$AUTH"
curl -X PATCH http://localhost:8000/api/admin/cultura/patrimonio/3 \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"descripcion":"…"}'        # alias de descripcion_corta

curl "http://localhost:8000/api/admin/cultura/fiestas?mes=9" -H "$AUTH"
curl -X PATCH http://localhost:8000/api/admin/cultura/fiestas/5 \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"descripcion":"Fiestas de San Pacho…","es_principal":true}'

curl "http://localhost:8000/api/admin/fauna?q=jaguar" -H "$AUTH"
curl -X PATCH http://localhost:8000/api/admin/fauna/2 \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"description":"…"}'
```

## 8. Media (R2)

```bash
# Sin vars R2 → 501 { "error": "media_no_configurado" }
curl -X POST http://localhost:8000/api/admin/media/upload-url \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"entidad_tipo":"establecimiento","entidad_id":"<uuid>","mime_type":"image/jpeg","filename":"fachada.jpg"}'
# → { "upload_url": "https://….r2.cloudflarestorage.com/…", "key": "…", "public_url": "https://media.visitchoco.cloud/…" }

# Subida directa a R2 (sin pasar por el backend)
curl -X PUT "<upload_url>" -H 'Content-Type: image/jpeg' --data-binary @fachada.jpg

curl -X POST http://localhost:8000/api/admin/media/confirm \
  -H "$AUTH" -H 'Content-Type: application/json' \
  -d '{"r2_key":"<key>","url_publica":"<public_url>","entidad_tipo":"establecimiento","entidad_id":"<uuid>","mime_type":"image/jpeg","size_bytes":204800,"es_principal":true}'

curl -X PATCH http://localhost:8000/api/admin/media/<uuid>/principal -H "$AUTH"
curl -X DELETE http://localhost:8000/api/admin/media/<uuid> -H "$AUTH"
```
