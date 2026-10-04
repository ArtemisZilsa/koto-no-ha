'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

/**
 * Verifikasi 2 langkah (TOTP) untuk area admin.
 * hasFactor=false → pasang authenticator (scan QR) lalu verifikasi.
 * hasFactor=true  → cukup masukkan kode 6 digit.
 */
export default function MfaGate({ hasFactor }: { hasFactor: boolean }) {
  const router = useRouter()
  const [factorId, setFactorId] = useState<string | null>(null)
  const [qr, setQr] = useState<string | null>(null)
  const [secret, setSecret] = useState<string | null>(null)
  const [code, setCode] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  useEffect(() => {
    const supabase = createClient()
    let cancelled = false
    ;(async () => {
      const { data, error } = await supabase.auth.mfa.listFactors()
      if (error) return setError(error.message)
      if (hasFactor) {
        const verified = data.totp[0]
        if (!cancelled) setFactorId(verified?.id ?? null)
        return
      }
      // Bersihkan pendaftaran lama yang belum selesai, lalu daftar baru.
      for (const f of data.all.filter((f) => f.status === 'unverified')) {
        await supabase.auth.mfa.unenroll({ factorId: f.id })
      }
      const enrolled = await supabase.auth.mfa.enroll({ factorType: 'totp', friendlyName: 'Koto no Ha Admin' })
      if (enrolled.error) return setError(enrolled.error.message)
      if (cancelled) return
      setFactorId(enrolled.data.id)
      setQr(enrolled.data.totp.qr_code)
      setSecret(enrolled.data.totp.secret)
    })()
    return () => {
      cancelled = true
    }
  }, [hasFactor])

  const verify = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!factorId) return
    setBusy(true)
    setError(null)
    const { error } = await createClient().auth.mfa.challengeAndVerify({ factorId, code: code.trim() })
    setBusy(false)
    if (error) {
      setError('Kode salah atau kedaluwarsa. Coba kode terbaru.')
      return
    }
    router.refresh()
  }

  return (
    <main className="px-5 py-16 max-w-md mx-auto">
      <h1 className="font-serif text-[24px] font-semibold mb-2" style={{ color: 'var(--text)' }}>
        Verifikasi 2 langkah
      </h1>
      {hasFactor ? (
        <p className="text-[14px] leading-[1.7] mb-6" style={{ color: 'var(--muted)' }}>
          Buka aplikasi authenticator di HP-mu, lalu masukkan kode 6 digit untuk Koto no Ha.
        </p>
      ) : (
        <div className="text-[14px] leading-[1.7] mb-6" style={{ color: 'var(--muted)' }}>
          <p className="mb-3">Sekali saja: pasang pengaman area admin.</p>
          <ol className="list-decimal pl-5 mb-4 space-y-1">
            <li>Pasang <b>Google Authenticator</b> atau <b>Microsoft Authenticator</b> di HP.</li>
            <li>Di aplikasi, pilih tambah akun lalu scan QR di bawah.</li>
            <li>Masukkan kode 6 digit yang muncul.</li>
          </ol>
          {qr ? (
            // eslint-disable-next-line @next/next/no-img-element -- QR berupa data URI SVG dari Supabase
            <img src={qr} alt="QR authenticator" width={200} height={200} className="rounded-lg bg-white p-2 mb-2" />
          ) : (
            !error && <p>Menyiapkan QR…</p>
          )}
          {secret && (
            <p className="text-[12px] break-all">
              Tidak bisa scan? Ketik kode ini di aplikasi: <code>{secret}</code>
            </p>
          )}
        </div>
      )}

      <form onSubmit={verify} className="flex gap-2">
        <input
          value={code}
          onChange={(e) => setCode(e.target.value.replace(/\D/g, '').slice(0, 6))}
          inputMode="numeric"
          autoComplete="one-time-code"
          placeholder="123456"
          aria-label="Kode 6 digit"
          className="flex-1 rounded-lg px-3 py-2.5 text-[18px] tracking-[0.3em] tabular-nums"
          style={{ border: '1px solid var(--brand-line)', background: 'var(--surface)', color: 'var(--text)' }}
        />
        <button
          type="submit"
          disabled={busy || code.length !== 6 || !factorId}
          className="rounded-lg px-5 text-[14px] font-medium cursor-pointer disabled:opacity-50"
          style={{ background: 'var(--crimson)', color: '#FAFAFA' }}
        >
          {busy ? '…' : 'Verifikasi'}
        </button>
      </form>
      {error && <p className="text-[13px] mt-3" style={{ color: 'var(--crimson)' }}>{error}</p>}
    </main>
  )
}
