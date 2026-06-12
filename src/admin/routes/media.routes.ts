import { Router } from 'express';
import { z } from 'zod';
import pool from '../../config/db';
import { requireAuth } from '../middleware/auth';
import { audit } from '../middleware/audit';
import { buildR2Key, r2PublicUrl, createUploadPresignedUrl, deleteR2Object } from '../services/r2';

const router = Router();

const ALLOWED_MIMES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];

// Obtener URL pre-firmada para subir
router.post('/upload-url', requireAuth, async (req, res) => {
  const schema = z.object({
    entidad_tipo: z.string(),
    entidad_id: z.string(),
    mime_type: z.enum(['image/jpeg', 'image/png', 'image/webp', 'image/gif']),
    filename: z.string().max(200),
  });
  const parse = schema.safeParse(req.body);
  if (!parse.success) return res.status(400).json({ error: 'datos_invalidos' });

  const ext = parse.data.mime_type.split('/')[1];
  const key = buildR2Key(parse.data.entidad_tipo, parse.data.entidad_id, ext);
  const uploadUrl = await createUploadPresignedUrl(key, parse.data.mime_type);
  const publicUrl = r2PublicUrl(key);

  res.json({ upload_url: uploadUrl, key, public_url: publicUrl });
});

// Confirmar subida y registrar en DB
router.post('/confirm', requireAuth, async (req, res) => {
  const schema = z.object({
    r2_key: z.string(),
    url_publica: z.string().url(),
    entidad_tipo: z.string(),
    entidad_id: z.string(),
    mime_type: z.string(),
    size_bytes: z.number().int().positive(),
    width_px: z.number().int().optional(),
    height_px: z.number().int().optional(),
    alt_text: z.string().max(300).optional(),
    caption: z.string().max(500).optional(),
    credito: z.string().max(200).optional(),
    es_principal: z.boolean().optional(),
    posicion: z.number().int().optional(),
  });
  const parse = schema.safeParse(req.body);
  if (!parse.success) return res.status(400).json({ error: 'datos_invalidos' });

  if (!ALLOWED_MIMES.includes(parse.data.mime_type)) {
    return res.status(400).json({ error: 'mime_no_permitido' });
  }

  if (parse.data.es_principal) {
    await pool.query(
      `UPDATE media_assets SET es_principal = FALSE
        WHERE entidad_tipo = $1 AND entidad_id = $2`,
      [parse.data.entidad_tipo, parse.data.entidad_id]
    );
  }

  const result = await pool.query(
    `INSERT INTO media_assets
      (r2_key, url_publica, entidad_tipo, entidad_id, mime_type, size_bytes,
       width_px, height_px, alt_text, caption, credito, es_principal, posicion, subido_por)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14)
     RETURNING *`,
    [
      parse.data.r2_key,
      parse.data.url_publica,
      parse.data.entidad_tipo,
      parse.data.entidad_id,
      parse.data.mime_type,
      parse.data.size_bytes,
      parse.data.width_px ?? null,
      parse.data.height_px ?? null,
      parse.data.alt_text ?? null,
      parse.data.caption ?? null,
      parse.data.credito ?? null,
      parse.data.es_principal ?? false,
      parse.data.posicion ?? 0,
      req.adminUser!.id,
    ]
  );

  audit(req, { accion: 'media_upload', entidad_tipo: parse.data.entidad_tipo, entidad_id: parse.data.entidad_id });
  res.json({ ok: true, asset: result.rows[0] });
});

// Eliminar asset
router.delete('/:id', requireAuth, async (req, res) => {
  const asset = await pool.query(`SELECT * FROM media_assets WHERE id = $1`, [req.params.id]);
  if (asset.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });

  const a = asset.rows[0];
  await deleteR2Object(a.r2_key as string);
  await pool.query(`UPDATE media_assets SET activo = FALSE WHERE id = $1`, [req.params.id]);
  audit(req, { accion: 'media_delete', entidad_id: req.params.id });
  res.json({ ok: true });
});

// Marcar como principal
router.patch('/:id/principal', requireAuth, async (req, res) => {
  const asset = await pool.query(`SELECT entidad_tipo, entidad_id FROM media_assets WHERE id = $1`, [req.params.id]);
  if (asset.rows.length === 0) return res.status(404).json({ error: 'no_encontrado' });
  const a = asset.rows[0];

  await pool.query(
    `UPDATE media_assets SET es_principal = FALSE WHERE entidad_tipo = $1 AND entidad_id = $2`,
    [a.entidad_tipo, a.entidad_id]
  );
  await pool.query(`UPDATE media_assets SET es_principal = TRUE WHERE id = $1`, [req.params.id]);
  res.json({ ok: true });
});

export default router;
