'use client'

import { useEffect, useRef, useState, type CSSProperties } from 'react'

interface AnimatedKanjiProps {
  /** Karakter kanji yang ditampilkan (mis. 学, 言, 語). */
  char: string
  /** Ukuran font CSS (mis. 'clamp(200px, 45vw, 360px)'). */
  fontSize?: string
  /** Warna kanji (default var(--ink)). */
  color?: string
  /** Opasitas akhir isi kanji (watermark biasanya sangat rendah). */
  fillOpacity?: number
  /** Penundaan mulai (ms). */
  delay?: number
  className?: string
  style?: CSSProperties
}

/**
 * Kanji "ditulis" ala sumi-e: garis kuas tinta menyapu masuk (SVG stroke
 * yang digambar), lalu karakter kanji memudar muncul (ink-bleed).
 * Bekerja untuk karakter apa pun (tak butuh data stroke per-kanji).
 * Hanya beranimasi sekali saat masuk viewport; statis bila reduced-motion
 * (ditangani oleh kelas .kanji-fill / .kanji-stroke di globals.css).
 */
export function AnimatedKanji({
  char,
  fontSize = 'clamp(200px, 45vw, 360px)',
  color = 'var(--ink)',
  fillOpacity = 0.05,
  delay = 0,
  className = '',
  style,
}: AnimatedKanjiProps) {
  const ref = useRef<HTMLDivElement | null>(null)
  const [play, setPlay] = useState(false)

  useEffect(() => {
    const el = ref.current
    if (!el) return
    if (typeof IntersectionObserver === 'undefined') {
      setPlay(true)
      return
    }
    const io = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            setPlay(true)
            io.unobserve(entry.target)
          }
        }
      },
      { threshold: 0.25 }
    )
    io.observe(el)
    return () => io.disconnect()
  }, [])

  const vars = {
    ['--kanji-fill-opacity' as string]: String(fillOpacity),
    ['--kanji-delay' as string]: `${delay + 150}ms`,
    ['--kanji-fill-delay' as string]: `${delay + 900}ms`,
    ['--kanji-len' as string]: '360',
  } as CSSProperties

  return (
    <div
      ref={ref}
      className={`relative pointer-events-none select-none ${className}`}
      style={style}
      aria-hidden="true"
    >
      {/* Sapuan kuas tinta yang "digambar" di belakang kanji */}
      <svg
        className="absolute inset-0 w-full h-full"
        viewBox="0 0 100 100"
        preserveAspectRatio="none"
        style={{ color, opacity: 0.18, ...vars }}
      >
        <path
          d="M6 64 C 28 40, 46 78, 64 50 S 90 30, 96 46"
          className={play ? 'kanji-stroke' : ''}
          style={{ strokeWidth: 3, ...(play ? {} : { strokeDashoffset: 360 }) }}
          fill="none"
        />
      </svg>

      {/* Karakter kanji — memudar masuk setelah sapuan kuas */}
      <span
        className={`font-serif font-light leading-none block ${play ? 'kanji-fill' : ''}`}
        style={{
          fontSize,
          color,
          letterSpacing: '-0.05em',
          opacity: play ? undefined : fillOpacity,
          ...vars,
        }}
      >
        {char}
      </span>
    </div>
  )
}
