import pool from '../../config/db';

// Mapa entidad_tipo (CHECK de approval_queue) → tabla real + tipo de PK.
const ENTIDAD_TABLA: Record<string, { tabla: string; idCast: 'uuid' | 'int' }> = {
  establecimiento: { tabla: 'establecimientos', idCast: 'uuid' },
  municipio: { tabla: 'municipalities', idCast: 'int' },
  fiesta_patronal: { tabla: 'fiestas_patronales', idCast: 'int' },
  patrimonio_inmaterial: { tabla: 'patrimonio_inmaterial', idCast: 'int' },
  indigenous_reserve: { tabla: 'indigenous_reserves', idCast: 'int' },
  entidad: { tabla: 'entidades', idCast: 'int' },
};

interface EnqueueParams {
  entidad_tipo: string;
  entidad_id: string;
  cambios: Record<string, unknown>;
  solicitado_por: string;
  comentario?: string | null;
}

function entidadInfo(entidadTipo: string) {
  const info = ENTIDAD_TABLA[entidadTipo];
  if (!info) throw new Error('entidad_tipo_no_soportado');
  return info;
}

export async function encolarCambio(params: EnqueueParams): Promise<string> {
  const { tabla, idCast } = entidadInfo(params.entidad_tipo);

  // Snapshot solo de las columnas que cambian (los nombres vienen de la
  // whitelist Zod de cada ruta, nunca del body crudo).
  const columnas = Object.keys(params.cambios);
  const select = columnas.map(c => `"${c}"`).join(', ');
  const snapshotQ = await pool.query(
    `SELECT ${select} FROM ${tabla} WHERE id = $1::${idCast}`,
    [params.entidad_id]
  );
  if (snapshotQ.rows.length === 0) throw new Error('entidad_no_encontrada');
  const estadoAnterior = snapshotQ.rows[0];

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
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    const qQ = await client.query(
      `SELECT * FROM approval_queue WHERE id = $1 AND estado = 'pendiente' FOR UPDATE`,
      [queueId]
    );
    if (qQ.rows.length === 0) throw new Error('queue_item_no_encontrado');
    const item = qQ.rows[0];

    const { tabla, idCast } = entidadInfo(item.entidad_tipo as string);

    const cambios = item.cambios as Record<string, unknown>;
    const fields = Object.keys(cambios);
    if (fields.length === 0) throw new Error('sin_cambios');

    const sets = fields.map((f, i) => `"${f}" = $${i + 1}`).join(', ');
    const values = Object.values(cambios);
    values.push(item.entidad_id);

    await client.query(
      `UPDATE ${tabla} SET ${sets} WHERE id = $${values.length}::${idCast}`,
      values
    );

    await client.query(
      `UPDATE approval_queue
         SET estado = 'aprobado', revisado_por = $1, revisado_at = NOW()
       WHERE id = $2`,
      [revisadoPor, queueId]
    );

    await client.query('COMMIT');
  } catch (err) {
    await client.query('ROLLBACK');
    throw err;
  } finally {
    client.release();
  }
}
