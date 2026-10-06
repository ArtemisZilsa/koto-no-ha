'use client'

import { useEffect, useRef } from 'react'

/**
 * Daun kanji 3D (WebGL) di hero. Hanya desktop: three.js diunduh setelah halaman
 * selesai dimuat (idle), jadi tidak menghambat teks hero (LCP). HP tetap ilustrasi statis.
 */
export function PohonKata() {
  const ref = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const host = ref.current
    if (!host || !window.matchMedia('(min-width: 768px)').matches) return
    let cleanup = () => {}
    let cancelled = false
    const start = () =>
      import('./pohonKataScene').then(({ mountPohonKata }) => {
        if (!cancelled) cleanup = mountPohonKata(host)
      })
    const idle = window.requestIdleCallback ?? ((cb: () => void) => window.setTimeout(cb, 300))
    const id = idle(start)
    return () => {
      cancelled = true
      ;(window.cancelIdleCallback ?? window.clearTimeout)(id)
      cleanup()
    }
  }, [])

  return <div ref={ref} className="pohon-kata hidden md:block" />
}
