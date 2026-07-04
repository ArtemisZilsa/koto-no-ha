import { createHash } from 'node:crypto'

/** Aturan kekuatan password — kembalikan pesan error (Indonesia) atau null jika lolos. */
export function validatePasswordStrength(password: string): string | null {
  if (password.length < 8) return 'Password minimal 8 karakter.'
  // bcrypt (dipakai Supabase Auth) memotong diam-diam di 72 byte.
  if (password.length > 72) return 'Password maksimal 72 karakter.'
  if (!/[a-zA-Z]/.test(password)) return 'Password harus mengandung huruf.'
  if (!/[0-9]/.test(password)) return 'Password harus mengandung angka.'
  return null
}

/**
 * Cek apakah password pernah muncul di kebocoran data, via HaveIBeenPwned range API.
 * K-anonymity: hanya 5 karakter pertama hash SHA-1 yang dikirim — password utuh
 * tidak pernah keluar dari server. Fail-open: bila API tak terjangkau/timeout,
 * pendaftaran tetap berjalan (jangan memblokir signup karena layanan pihak ketiga).
 */
export async function isPasswordPwned(password: string): Promise<boolean> {
  try {
    const hash = createHash('sha1').update(password).digest('hex').toUpperCase()
    const prefix = hash.slice(0, 5)
    const suffix = hash.slice(5)

    const res = await fetch(`https://api.pwnedpasswords.com/range/${prefix}`, {
      // Add-Padding menyamarkan ukuran respons (entri padding ber-count 0).
      headers: { 'Add-Padding': 'true' },
      signal: AbortSignal.timeout(3500),
      cache: 'no-store',
    })
    if (!res.ok) return false

    const body = await res.text()
    for (const line of body.split('\n')) {
      const [candidate, count] = line.trim().split(':')
      if (candidate === suffix && Number(count) > 0) return true
    }
    return false
  } catch {
    return false
  }
}
