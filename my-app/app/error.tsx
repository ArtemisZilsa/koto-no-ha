'use client'

import { useEffect } from 'react'
import Link from 'next/link'

export default function Error({
  error,
  unstable_retry,
}: {
  error: Error & { digest?: string }
  unstable_retry: () => void
}) {
  useEffect(() => {
    console.error(error)
  }, [error])

  return (
    <main className="min-h-screen bg-paper flex items-center justify-center px-4 py-12">
      <div className="w-full max-w-[420px] bg-surface rounded-2xl border border-[var(--border)] shadow-[0_8px_40px_rgba(13,13,18,0.08)] p-8 text-center">
        <Link href="/" className="inline-block no-underline mb-6">
          <div className="font-serif text-3xl font-semibold text-ink tracking-tight">言の葉</div>
          <div className="text-xs text-muted tracking-widest uppercase mt-1">Koto no Ha</div>
        </Link>

        <h1 className="font-serif text-xl font-semibold text-ink mb-2">Terjadi kesalahan</h1>
        <p className="text-sm text-muted leading-[1.7] mb-6">
          Halaman ini gagal dimuat. Biasanya ini sementara — coba muat ulang sebentar lagi.
        </p>

        <div className="flex flex-col gap-2.5">
          <button
            type="button"
            onClick={() => unstable_retry()}
            className="text-sm font-medium px-6 py-3 rounded-lg bg-ink text-paper hover:opacity-90 transition-opacity cursor-pointer"
          >
            Coba lagi
          </button>
          <Link
            href="/"
            className="text-sm px-6 py-3 rounded-lg text-ink no-underline hover:bg-paper-dark transition-colors"
            style={{ border: '0.5px solid var(--border)' }}
          >
            Kembali ke Beranda
          </Link>
        </div>

        {error.digest && (
          <p className="text-[11px] text-muted mt-6">Kode: {error.digest}</p>
        )}
      </div>
    </main>
  )
}
