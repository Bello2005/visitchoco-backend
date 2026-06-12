import pool from '../../config/db';

interface EnqueueParams {
  entidad_tipo: string;
  entidad_id: string;
  cambios: Record<string, unknown>;
  solicitado_por: string;
  comentario?: string | null;
}

export async function encolarCambio(params: EnqueueParams): Promise<string> {
  const snapshotQ = await pool.query(
    `SELECT * FROM establecimientos WHERE id = $1::uuid`,
    [params.entidad_id]
  );
  const estadoAnterior = snapshotQ.rows[0] ?? {};

  const autoaprobacionAt = new Date(Date.now() + 7 * 24 * 60 * 60_000);

  const result = await pool.query(
    `INSERT INTO approval_queue
      (entidad_tipo, entidad_id, cambios, estado_anterior,
       solicitado_por, comentario_solicitante, autoaprobacion_at)
     VALUES ($1,$2,$3,$4,$5,$6,$7)
     RETURNING id`,
    [
      params.entidad_tipo,
      params.entidad_id,
      JSON.stringify(params.cambios),
      JSON.stringify(estadoAnterior),
      params.solicitado_por,
      params.comentario ?? null,
      autoaprobacionAt,
    ]
  );

  return result.rows[0].id as string;
}

export async function aplicarCambio(queueId: string, revisadoPor: string): Promise<void> {
  const qQ = await pool.query(
    `SELECT * FROM approval_queue WHERE id = $1 AND estado = 'pendiente'`,
    [queueId]
  );
  if (qQ.rows.length === 0) throw new Error('queue_item_no_encontrado');
  const item = qQ.rows[0];

  const cambios = item.cambios as Record<string, unknown>;
  const fields = Object.keys(cambios);
  if (fields.length === 0) throw new Error('sin_cambios');

  const sets = fields.map((f, i) => `${f} = $${i + 1}`).join(', ');
  const values = Object.values(cambios);
  values.push(item.entidad_id);

  if (item.entidad_tipo === 'establecimiento') {
    await pool.query(
      `UPDATE establecimientos SET ${sets} WHERE id = $${values.length}::uuid`,
      values
    );
  }

  await pool.query(
    `UPDATE approval_queue
       SET estado = 'aprobado', revisado_por = $1, revisado_at = NOW()
     WHERE id = $2`,
    [revisadoPor, queueId]
  );
}
