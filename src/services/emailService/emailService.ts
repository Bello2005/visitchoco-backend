import { Resend } from 'resend';

interface LoginEmailParams {
  to: string;
  token: string;
  codigo: string;
}

const ADMIN_URL =
  process.env.ADMIN_URL ??
  process.env.ADMIN_FRONTEND_URL ??
  'https://admin.visitchoco.cloud';

const FROM =
  process.env.RESEND_FROM ??
  `${process.env.RESEND_FROM_NAME ?? 'VisitChocó'} <onboarding@resend.dev>`;

const EXPIRES_MIN = Number(process.env.MAGIC_LINK_EXPIRES_MIN ?? 15);

let resendClient: Resend | null = null;

function getResend(): Resend | null {
  if (!process.env.RESEND_API_KEY) return null;
  if (!resendClient) resendClient = new Resend(process.env.RESEND_API_KEY);
  return resendClient;
}

interface EmailParams {
  to: string;
  subject: string;
  html?: string;
  text?: string;
}

/** Envío genérico con el mismo fallback a consola que el email de login. */
export async function sendEmail({ to, subject, html, text }: EmailParams): Promise<void> {
  const resend = getResend();
  if (!resend) {
    console.log(`[EMAIL DEV] para=${to} asunto="${subject}"`);
    if (text) console.log(`[EMAIL DEV] ${text}`);
    return;
  }
  const result = await resend.emails.send({ from: FROM, to, subject, html, text: text ?? '' });
  console.log('[email] respuesta Resend:', JSON.stringify(result));
}

/** Formato legible "123 456" para el código de 6 dígitos. */
function formatearCodigo(codigo: string): string {
  return `${codigo.slice(0, 3)} ${codigo.slice(3)}`;
}

export async function sendLoginEmail({ to, token, codigo }: LoginEmailParams): Promise<void> {
  const url = `${ADMIN_URL}/auth/verify?token=${token}`;
  const codigoLegible = formatearCodigo(codigo);

  const resend = getResend();
  if (!resend) {
    console.log(`[EMAIL DEV] para=${to} codigo=${codigoLegible} enlace=${url}`);
    return;
  }

  console.log('[email] enviando login a:', to);
  console.log('[email] enlace (usar si no llega):', url);

  const result = await resend.emails.send({
    from: FROM,
    to,
    subject: 'Tu acceso a VisitChocó',
    html: loginEmailHTML({ url, codigo: codigoLegible, expiresMin: EXPIRES_MIN }),
    text: [
      'Hola,',
      '',
      'Usa este enlace para entrar a VisitChocó:',
      url,
      '',
      `O escribe este código: ${codigoLegible}`,
      '',
      `Expiran en ${EXPIRES_MIN} minutos. Si no fuiste tú, ignora este correo.`,
      '',
      '— Equipo VisitChocó',
    ].join('\n'),
  });

  console.log('[email] respuesta Resend:', JSON.stringify(result));
}

function loginEmailHTML({ url, codigo, expiresMin }: { url: string; codigo: string; expiresMin: number }) {
  return `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"></head>
<body style="margin:0;padding:0;background:#f6f5f2;font-family:-apple-system,Segoe UI,Helvetica,sans-serif;">
  <div style="max-width:520px;margin:48px auto;padding:48px 32px;background:white;border-radius:12px;">
    <div style="text-align:center;margin-bottom:32px;">
      <h1 style="font-family:Georgia,serif;font-size:22px;font-weight:600;color:#0d2a1f;margin:16px 0 0;letter-spacing:-0.02em;">
        VisitChocó
      </h1>
    </div>
    <p style="color:#3a3a3a;font-size:15px;line-height:1.6;margin:0 0 24px;">
      Hola — para entrar, toca el botón. El enlace es válido por <strong>${expiresMin} minutos</strong>
      y solo puede usarse una vez.
    </p>
    <div style="text-align:center;margin:32px 0;">
      <a href="${url}" style="display:inline-block;padding:14px 32px;background:#1a5c45;color:white;text-decoration:none;border-radius:8px;font-weight:600;font-size:14px;">
        Entrar a VisitChocó
      </a>
    </div>
    <p style="color:#3a3a3a;font-size:14px;line-height:1.6;margin:0 0 8px;text-align:center;">
      O escribe este código:
    </p>
    <p style="font-family:'SF Mono',Menlo,Consolas,monospace;font-size:32px;font-weight:700;letter-spacing:0.12em;color:#0d2a1f;text-align:center;margin:8px 0 32px;">
      ${codigo}
    </p>
    <p style="color:#888;font-size:12px;line-height:1.5;margin:32px 0 0;">
      Si no solicitaste este acceso, simplemente ignora este correo.
    </p>
    <hr style="border:none;border-top:1px solid #eee;margin:32px 0 16px;">
    <p style="color:#aaa;font-size:11px;text-align:center;margin:0;">
      VisitChocó · Quibdó, Colombia · 5.69° N, 76.66° W
    </p>
  </div>
</body>
</html>`;
}
