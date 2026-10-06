'use client'

import { useEffect, useRef, useState } from 'react'

/**
 * Lembar materi PDF 3D (WebGL) di kartu harga. Desktop saja, dan three.js baru diunduh
 * saat section harga mendekati layar. Sebelum siap (dan di HP) tampil `fallback` (buku CSS).
 */
export function LembarMateri({ fallback }: { fallback: React.ReactNode }) {
  const ref = useRef<HTMLDivElement>(null)
  const [ready, setReady] = useState(false)

  useEffect(() => {
    const host = ref.current
    if (!host || !window.matchMedia('(min-width: 768px)').matches) return
    let cleanup = () => {}
    let cancelled = false
    const io = new IntersectionObserver(
      ([e]) => {
        if (!e.isIntersecting) return
        io.disconnect()
        import('./lembarMateriScene').then(({ mountLembarMateri }) => {
          if (cancelled) return
          cleanup = mountLembarMateri(host)
          setReady(host.querySelector('canvas') !== null)
        })
      },
      { rootMargin: '300px' },
    )
    io.observe(host)
    return () => {
      cancelled = true
      io.disconnect()
      cleanup()
    }
  }, [])

  return (
    <div className="relative w-full h-full flex items-center justify-center">
      {!ready && fallback}
      <div ref={ref} className="lembar-3d hidden md:block" />
    </div>
  )
}
