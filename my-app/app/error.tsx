'use client'

import { useEffect } from 'react'
import Link from 'next/link'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error(error)
  }, [error])

  return (
    <main className="min-h-screen flex items-center justify-center px-5">
      <section className="relative text-center py-20 overflow-hidden">
        <span
          className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 font-serif select-none pointer-events-none"
          style={{ fontSize: 'clamp(160px, 26vw, 260px)', color: 'var(--ink)', opacity: 0.05, lineHeight: 1 }}
          aria-hidden
        >
          雨
        </span>
        <div className="relative">
          <p className="font-serif text-lg text-muted italic mb-2">ごめんなさい</p>
          <h1 className="font-serif text-2xl font-semibold text-ink mb-3">Terjadi kesalahan</h1>
          <p className="text-[14px] text-muted max-w-[420px] mx-auto mb-8 leading-[1.8]">
            Ada yang tidak beres saat memuat halaman ini. Coba muat ulang — biasanya
            masalahnya hanya sementara.
          </p>
          <div className="flex flex-wrap items-center justify-center gap-3">
            <button
              type="button"
              onClick={reset}
              className="text-sm font-medium px-7 py-3 rounded-lg cursor-pointer text-paper hover:opacity-90 transition-opacity"
              style={{ background: 'var(--ink)' }}
            >
              Coba Lagi
            </button>
            <Link
              href="/"
              className="text-sm px-6 py-3 rounded-lg border text-ink hover:bg-paper-dark transition-colors no-underline"
              style={{ borderColor: 'var(--border)' }}
            >
              Ke Beranda
            </Link>
          </div>
        </div>
      </section>
    </main>
  )
}
