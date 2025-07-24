-- schema.sql

-- 1. Roles
CREATE TABLE IF NOT EXISTS roles (
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(50) NOT NULL UNIQUE,
  description TEXT
);

-- 2. Usuarios
CREATE TABLE IF NOT EXISTS users (
  id             SERIAL PRIMARY KEY,
  name           VARCHAR(100)   NOT NULL,
  email          VARCHAR(150)   NOT NULL UNIQUE,
  password_hash  VARCHAR(200)   NOT NULL,
  role_id        INTEGER        NOT NULL REFERENCES roles(id)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
  created_at     TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
  updated_at     TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

-- 3. Municipios
CREATE TABLE IF NOT EXISTS municipalities (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(100)   NOT NULL,
  description   TEXT,
  image_url     VARCHAR(300),
  audio_url     VARCHAR(300),
  created_at    TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

-- 4. GeoJSON
CREATE TABLE IF NOT EXISTS municipality_geojson (
  id               SERIAL PRIMARY KEY,
  municipality_id  INTEGER NOT NULL
                     REFERENCES municipalities(id)
                     ON UPDATE CASCADE
                     ON DELETE CASCADE,
  geojson_data     JSONB   NOT NULL,
  uploaded_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 5. Atracciones
CREATE TABLE IF NOT EXISTS attractions (
  id              SERIAL PRIMARY KEY,
  municipality_id INTEGER REFERENCES municipalities(id)
                    ON UPDATE CASCADE
                    ON DELETE SET NULL,
  name            VARCHAR(150) NOT NULL,
  description     TEXT,
  image_url       VARCHAR(300),
  audio_url       VARCHAR(300),
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 6. Festivales
CREATE TABLE IF NOT EXISTS festivals (
  id              SERIAL PRIMARY KEY,
  municipality_id INTEGER REFERENCES municipalities(id)
                    ON UPDATE CASCADE
                    ON DELETE SET NULL,
  name            VARCHAR(150) NOT NULL,
  description     TEXT,
  start_date      DATE NOT NULL,
  end_date        DATE NOT NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 7. Animales
CREATE TABLE IF NOT EXISTS animals (
  id               SERIAL PRIMARY KEY,
  municipality_id  INTEGER REFERENCES municipalities(id)
                     ON UPDATE CASCADE
                     ON DELETE SET NULL,
  common_name      VARCHAR(100) NOT NULL,
  scientific_name  VARCHAR(150),
  description      TEXT,
  image_url        VARCHAR(300),
  audio_url        VARCHAR(300),
  created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 8. Media uploads
CREATE TABLE IF NOT EXISTS media_uploads (
  id            SERIAL PRIMARY KEY,
  uploaded_by   INTEGER REFERENCES users(id)
                    ON UPDATE CASCADE
                    ON DELETE SET NULL,
  resource_type VARCHAR(50) NOT NULL,
  resource_id   INTEGER NOT NULL,
  url           VARCHAR(300) NOT NULL,
  filename      VARCHAR(200) NOT NULL,
  mime_type     VARCHAR(100),
  file_size     INTEGER,
  uploaded_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 9. (Opcional) Historial de búsquedas
CREATE TABLE IF NOT EXISTS search_history (
  id          SERIAL PRIMARY KEY,
  user_id     INTEGER REFERENCES users(id),
  query_text  VARCHAR(200) NOT NULL,
  filters     JSONB,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
