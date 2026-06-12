import { S3Client, DeleteObjectCommand, PutObjectCommand } from '@aws-sdk/client-s3';
import { getSignedUrl } from '@aws-sdk/s3-request-presigner';
import crypto from 'crypto';

const client = new S3Client({
  region: 'auto',
  endpoint: `https://${process.env.R2_ACCOUNT_ID}.r2.cloudflarestorage.com`,
  credentials: {
    accessKeyId: process.env.R2_ACCESS_KEY_ID!,
    secretAccessKey: process.env.R2_SECRET_ACCESS_KEY!,
  },
});

const BUCKET = process.env.R2_BUCKET ?? 'visitchoco-media';
const PUBLIC_URL = process.env.R2_PUBLIC_URL ?? 'https://media.visitchoco.cloud';
const MAX_SIZE_BYTES = 10 * 1024 * 1024; // 10 MB

export function buildR2Key(entidadTipo: string, entidadId: string, ext: string): string {
  const rand = crypto.randomBytes(6).toString('hex');
  const ts = Date.now();
  return `${entidadTipo}/${entidadId}/${ts}-${rand}.${ext}`;
}

export function r2PublicUrl(key: string): string {
  return `${PUBLIC_URL}/${key}`;
}

export async function createUploadPresignedUrl(key: string, mimeType: string): Promise<string> {
  const command = new PutObjectCommand({
    Bucket: BUCKET,
    Key: key,
    ContentType: mimeType,
  });

  // La URL expira en 5 minutos. El límite de tamaño (10 MB) se valida en el frontend antes de subir.
  return getSignedUrl(client, command, { expiresIn: 300 });
}

export async function deleteR2Object(key: string): Promise<void> {
  await client.send(new DeleteObjectCommand({ Bucket: BUCKET, Key: key }));
}
