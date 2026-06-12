-- ════════════════════════════════════════════════════════════════════
-- VISITCHOCÓ ADMIN — schema completo
-- Ejecutar en orden. Cada bloque es idempotente.
-- Nota: usa admin_roles y admin_users para no colisionar con tablas existentes.
-- ════════════════════════════════════════════════════════════════════

-- 1. Extensiones
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS unaccent;
CREATE EXTENSION IF NOT EXISTS citext;

-- 2. Función helper: trigger updated_at
CREATE OR REPLACE FUNCTION trigger_set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ────────────────────────────────────────────────────────────────────
-- ESTABLECIMIENTOS — negocios y lugares turísticos
-- ────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS establecimientos (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nombre          TEXT NOT NULL,
  categoria       TEXT NOT NULL,
  subcategoria    TEXT,
  descripcion     TEXT,
  municipio_id    INTEGER REFERENCES municipalities(id),
  telefono        TEXT,
  email           CITEXT,
  whatsapp        TEXT,
  sitio_web       TEXT,
  direccion       TEXT,
  lat             DOUBLE PRECISION,
  lng             DOUBLE PRECISION,
  ubicacion       geometry(Point, 4326),
  especialidades  TEXT[] DEFAULT '{}',
  horario         JSONB DEFAULT '{}'::jsonb,
  rango_precio    TEXT CHECK (rango_precio IN ('$','$$','$$$','$$$$')),
  rnt             TEXT,
  activo          BOOLEAN NOT NULL DEFAULT TRUE,
  verificado      BOOLEAN NOT NULL DEFAULT FALSE,
  updated_by      TEXT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_estab_municipio  ON establecimientos(municipio_id);
CREATE INDEX IF NOT EXISTS idx_estab_categoria  ON establecimientos(categoria);
CREATE INDEX IF NOT EXISTS idx_estab_activo     ON establecimientos(activo);
CREATE INDEX IF NOT EXISTS idx_estab_verificado ON establecimientos(verificado);

DROP TRIGGER IF EXISTS trg_estab_updated ON establecimientos;
CREATE TRIGGER trg_estab_updated
  BEFORE UPDATE ON establecimientos
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();

-- ────────────────────────────────────────────────────────────────────
-- AUTH — roles, usuarios, sesiones, magic links
-- Usa admin_roles y admin_users para evitar conflicto con tablas existentes
-- ────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS admin_roles (
  id          SMALLSERIAL PRIMARY KEY,
  slug        TEXT UNIQUE NOT NULL,
  nombre      TEXT NOT NULL,
  descripcion TEXT,
  permisos    JSONB NOT NULL DEFAULT '[]'::jsonb,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO admin_roles (slug, nombre, descripcion, permisos) VALUES
  ('super_admin', 'Super Administrador',
   'Acceso total a todos los módulos y entidades.',
   '["*"]'::jsonb),
  ('editor_institucional', 'Editor Institucional',
   'Edita contenido cultural curado según dominio asignado.',
   '["cultura.read","cultura.write","fauna.read","municipios.read","municipios.write"]'::jsonb),
  ('dueno_negocio', 'Dueño de Negocio',
   'Edita únicamente su(s) propio(s) establecimiento(s).',
   '["mi_negocio.read","mi_negocio.write","mis_metricas.read"]'::jsonb)
ON CONFLICT (slug) DO UPDATE
  SET nombre = EXCLUDED.nombre,
      descripcion = EXCLUDED.descripcion,
      permisos = EXCLUDED.permisos;

CREATE TABLE IF NOT EXISTS admin_users (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email           CITEXT UNIQUE NOT NULL,
  nombre          TEXT,
  telefono        TEXT,
  avatar_url      TEXT,
  role_id         SMALLINT NOT NULL REFERENCES admin_roles(id),
  estado          TEXT NOT NULL DEFAULT 'activo'
                  CHECK (estado IN ('pendiente_email','activo','suspendido','eliminado')),
  email_verified  BOOLEAN NOT NULL DEFAULT FALSE,
  ultimo_login_at TIMESTAMPTZ,
  invitado_por    UUID REFERENCES admin_users(id),
  notas_admin     TEXT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_ausers_role   ON admin_users(role_id);
CREATE INDEX IF NOT EXISTS idx_ausers_estado ON admin_users(estado);
CREATE INDEX IF NOT EXISTS idx_ausers_email  ON admin_users(email);

DROP TRIGGER IF EXISTS trg_ausers_updated ON admin_users;
CREATE TRIGGER trg_ausers_updated
  BEFORE UPDATE ON admin_users
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();

-- Magic links
CREATE TABLE IF NOT EXISTS magic_links (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id       UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
  token_hash    TEXT NOT NULL,
  ip_solicitud  INET,
  user_agent    TEXT,
  expira_at     TIMESTAMPTZ NOT NULL,
  consumido_at  TIMESTAMPTZ,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_magic_user      ON magic_links(user_id);
CREATE INDEX IF NOT EXISTS idx_magic_token     ON magic_links(token_hash);
CREATE INDEX IF NOT EXISTS idx_magic_expiracion ON magic_links(expira_at) WHERE consumido_at IS NULL;

-- Sesiones
CREATE TABLE IF NOT EXISTS admin_sessions (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id       UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
  jti           TEXT UNIQUE NOT NULL,
  ip            INET,
  user_agent    TEXT,
  ultimo_uso_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  expira_at     TIMESTAMPTZ NOT NULL,
  revocado_at   TIMESTAMPTZ,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_sessions_user   ON admin_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_sessions_jti    ON admin_sessions(jti);
CREATE INDEX IF NOT EXISTS idx_sessions_active ON admin_sessions(expira_at) WHERE revocado_at IS NULL;

-- Invitaciones
CREATE TABLE IF NOT EXISTS invitations (
  id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email              CITEXT NOT NULL,
  role_id            SMALLINT NOT NULL REFERENCES admin_roles(id),
  invitado_por       UUID NOT NULL REFERENCES admin_users(id),
  establecimiento_id UUID REFERENCES establecimientos(id) ON DELETE CASCADE,
  mensaje_personal   TEXT,
  token_hash         TEXT NOT NULL,
  expira_at          TIMESTAMPTZ NOT NULL,
  consumido_at       TIMESTAMPTZ,
  consumido_por      UUID REFERENCES admin_users(id),
  created_at         TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_invitations_email ON invitations(email);
CREATE INDEX IF NOT EXISTS idx_invitations_token ON invitations(token_hash);

-- ────────────────────────────────────────────────────────────────────
-- BUSINESS CLAIMS — flujo "Reclamar mi negocio"
-- ────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS business_claims (
  id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  establecimiento_id   UUID NOT NULL REFERENCES establecimientos(id) ON DELETE CASCADE,
  solicitante_user_id  UUID REFERENCES admin_users(id) ON DELETE SET NULL,
  email                CITEXT NOT NULL,
  nombre_completo      TEXT NOT NULL,
  telefono             TEXT NOT NULL,
  cargo                TEXT,
  cedula               TEXT,
  evidencia_urls       TEXT[] DEFAULT '{}',
  estado               TEXT NOT NULL DEFAULT 'pendiente'
                       CHECK (estado IN ('pendiente','en_revision','aprobado','rechazado','expirado')),
  metodo_verificacion  TEXT CHECK (metodo_verificacion IN ('email_match','rnt_match','manual','telefono_rnt')),
  revisado_por         UUID REFERENCES admin_users(id),
  revisado_at          TIMESTAMPTZ,
  motivo_rechazo       TEXT,
  notas_admin          TEXT,
  created_at           TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_claims_estab   ON business_claims(establecimiento_id);
CREATE INDEX IF NOT EXISTS idx_claims_estado  ON business_claims(estado);
CREATE INDEX IF NOT EXISTS idx_claims_solicit ON business_claims(solicitante_user_id);
CREATE INDEX IF NOT EXISTS idx_claims_email   ON business_claims(email);

DROP TRIGGER IF EXISTS trg_claims_updated ON business_claims;
CREATE TRIGGER trg_claims_updated
  BEFORE UPDATE ON business_claims
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();

-- Asociación user ↔ establecimientos
CREATE TABLE IF NOT EXISTS user_establecimientos (
  user_id            UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
  establecimiento_id UUID NOT NULL REFERENCES establecimientos(id) ON DELETE CASCADE,
  rol_negocio        TEXT NOT NULL DEFAULT 'propietario'
                     CHECK (rol_negocio IN ('propietario','administrador','editor')),
  asignado_por       UUID REFERENCES admin_users(id),
  asignado_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, establecimiento_id)
);

CREATE INDEX IF NOT EXISTS idx_userestab_user  ON user_establecimientos(user_id);
CREATE INDEX IF NOT EXISTS idx_userestab_estab ON user_establecimientos(establecimiento_id);

-- ────────────────────────────────────────────────────────────────────
-- APROBACIONES
-- ────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS approval_queue (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entidad_tipo    TEXT NOT NULL CHECK (entidad_tipo IN
                    ('establecimiento','municipio','fiesta_patronal',
                     'patrimonio_inmaterial','indigenous_reserve','entidad')),
  entidad_id      TEXT NOT NULL,
  cambios         JSONB NOT NULL,
  estado_anterior JSONB NOT NULL,
  solicitado_por  UUID NOT NULL REFERENCES admin_users(id),
  comentario_solicitante TEXT,
  estado          TEXT NOT NULL DEFAULT 'pendiente'
                  CHECK (estado IN ('pendiente','aprobado','rechazado','autoaprobado','obsoleto')),
  revisado_por    UUID REFERENCES admin_users(id),
  revisado_at     TIMESTAMPTZ,
  comentario_revisor TEXT,
  autoaprobacion_at TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_aqueue_estado    ON approval_queue(estado);
CREATE INDEX IF NOT EXISTS idx_aqueue_entidad   ON approval_queue(entidad_tipo, entidad_id);
CREATE INDEX IF NOT EXISTS idx_aqueue_solicit   ON approval_queue(solicitado_por);
CREATE INDEX IF NOT EXISTS idx_aqueue_pendiente ON approval_queue(autoaprobacion_at) WHERE estado = 'pendiente';

DROP TRIGGER IF EXISTS trg_aqueue_updated ON approval_queue;
CREATE TRIGGER trg_aqueue_updated
  BEFORE UPDATE ON approval_queue
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();

-- ────────────────────────────────────────────────────────────────────
-- AUDIT LOG
-- ────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS audit_log (
  id           BIGSERIAL PRIMARY KEY,
  user_id      UUID REFERENCES admin_users(id),
  user_email   CITEXT,
  user_role    TEXT,
  accion       TEXT NOT NULL,
  entidad_tipo TEXT,
  entidad_id   TEXT,
  cambios      JSONB,
  ip           INET,
  user_agent   TEXT,
  metadata     JSONB DEFAULT '{}'::jsonb,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_audit_user    ON audit_log(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_entidad ON audit_log(entidad_tipo, entidad_id);
CREATE INDEX IF NOT EXISTS idx_audit_accion  ON audit_log(accion);
CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_log(created_at DESC);

-- ────────────────────────────────────────────────────────────────────
-- MEDIA ASSETS
-- ────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS media_assets (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entidad_tipo TEXT NOT NULL,
  entidad_id   TEXT NOT NULL,
  r2_key       TEXT NOT NULL UNIQUE,
  url_publica  TEXT NOT NULL,
  mime_type    TEXT NOT NULL,
  size_bytes   BIGINT NOT NULL,
  width_px     INT,
  height_px    INT,
  alt_text     TEXT,
  caption      TEXT,
  credito      TEXT,
  posicion     INT NOT NULL DEFAULT 0,
  es_principal BOOLEAN NOT NULL DEFAULT FALSE,
  subido_por   UUID REFERENCES admin_users(id),
  activo       BOOLEAN NOT NULL DEFAULT TRUE,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_media_entidad   ON media_assets(entidad_tipo, entidad_id);
CREATE INDEX IF NOT EXISTS idx_media_principal ON media_assets(entidad_tipo, entidad_id) WHERE es_principal = TRUE;

DROP TRIGGER IF EXISTS trg_media_updated ON media_assets;
CREATE TRIGGER trg_media_updated
  BEFORE UPDATE ON media_assets
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();

-- ────────────────────────────────────────────────────────────────────
-- SEED — usuario super admin inicial
-- ────────────────────────────────────────────────────────────────────

INSERT INTO admin_users (email, nombre, role_id, estado, email_verified)
SELECT 'ldbello@miuniclaretiana.edu.co', 'Deiner D. Bello',
       (SELECT id FROM admin_roles WHERE slug = 'super_admin'),
       'activo', TRUE
WHERE NOT EXISTS (SELECT 1 FROM admin_users WHERE email = 'ldbello@miuniclaretiana.edu.co');

-- ────────────────────────────────────────────────────────────────────
-- VISTAS útiles
-- ────────────────────────────────────────────────────────────────────

CREATE OR REPLACE VIEW v_establecimientos_admin AS
SELECT
  e.id, e.nombre, e.categoria, e.subcategoria,
  e.activo, e.verificado,
  m.name AS municipio_nombre, m.id AS municipio_id,
  e.rnt, e.telefono, e.email,
  (SELECT url_publica FROM media_assets ma
   WHERE ma.entidad_tipo = 'establecimiento'
     AND ma.entidad_id = e.id::text
     AND ma.es_principal = TRUE
     AND ma.activo = TRUE
   LIMIT 1) AS foto_url,
  EXISTS(SELECT 1 FROM user_establecimientos ue WHERE ue.establecimiento_id = e.id) AS reclamado,
  EXISTS(SELECT 1 FROM approval_queue aq
         WHERE aq.entidad_tipo = 'establecimiento' AND aq.entidad_id = e.id::text
           AND aq.estado = 'pendiente') AS tiene_cambios_pendientes,
  e.created_at, e.updated_at
FROM establecimientos e
LEFT JOIN municipalities m ON m.id = e.municipio_id;

-- ════════════════════════════════════════════════════════════════════
-- VALIDACIÓN: ejecutar para verificar
-- SELECT slug, nombre FROM admin_roles ORDER BY id;
-- SELECT email, role_id, estado FROM admin_users;
-- ════════════════════════════════════════════════════════════════════
