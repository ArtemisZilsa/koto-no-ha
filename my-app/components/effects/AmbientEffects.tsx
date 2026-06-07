import type { CSSProperties } from 'react'

/**
 * Efek ambient global: kelopak sakura + daun maple (momiji) berjatuhan,
 * plus kunang-kunang (hotaru) yang mengambang. Semua nilai deterministik
 * agar tidak ada hydration mismatch. Nonaktif di prefers-reduced-motion
 * (lihat .fx-layer / .sakura-layer di globals.css).
 */

type Falling = { left: number; size: number; duration: number; delay: number; opacity: number }

// Kelopak sakura — dikurangi agar berbagi panggung dengan maple.
const SAKURA: Falling[] = [
  { left: 6, size: 11, duration: 13, delay: 0, opacity: 0.32 },
  { left: 19, size: 9, duration: 10, delay: -5, opacity: 0.26 },
  { left: 34, size: 14, duration: 15, delay: -2, opacity: 0.3 },
  { left: 52, size: 10, duration: 12, delay: -9, opacity: 0.34 },
  { left: 67, size: 13, duration: 14, delay: -4, opacity: 0.28 },
  { left: 84, size: 9, duration: 11, delay: -7, opacity: 0.3 },
  { left: 91, size: 12, duration: 16, delay: -12, opacity: 0.26 },
]

// Daun maple (momiji) — gugur lebih lambat & berputar lebih banyak.
const MAPLE: Falling[] = [
  { left: 12, size: 15, duration: 17, delay: -3, opacity: 0.4 },
  { left: 28, size: 12, duration: 14, delay: -8, opacity: 0.34 },
  { left: 44, size: 17, duration: 19, delay: -1, opacity: 0.38 },
  { left: 60, size: 13, duration: 16, delay: -11, opacity: 0.36 },
  { left: 73, size: 16, duration: 18, delay: -6, opacity: 0.32 },
  { left: 88, size: 12, duration: 15, delay: -13, opacity: 0.34 },
]

// Kunang-kunang — posisi awal & ritme kedip berbeda-beda.
const FIREFLIES: { left: number; top: number; dur: number; delay: number }[] = [
  { left: 15, top: 70, dur: 9, delay: 0 },
  { left: 30, top: 85, dur: 11, delay: -3 },
  { left: 48, top: 60, dur: 8, delay: -6 },
  { left: 65, top: 80, dur: 12, delay: -2 },
  { left: 78, top: 68, dur: 10, delay: -8 },
  { left: 90, top: 88, dur: 9, delay: -5 },
  { left: 22, top: 92, dur: 13, delay: -10 },
  { left: 56, top: 90, dur: 10, delay: -4 },
]

export function AmbientEffects() {
  return (
    <div className="fx-layer" aria-hidden="true">
      {SAKURA.map((p, i) => (
        <span
          key={`s${i}`}
          className="sakura-petal"
          style={
            {
              left: `${p.left}%`,
              width: `${p.size}px`,
              height: `${p.size}px`,
              opacity: p.opacity,
              animationDuration: `${p.duration}s`,
              animationDelay: `${p.delay}s`,
            } as CSSProperties
          }
        />
      ))}

      {MAPLE.map((p, i) => (
        <span
          key={`m${i}`}
          className="maple-leaf"
          style={
            {
              left: `${p.left}%`,
              width: `${p.size}px`,
              height: `${p.size}px`,
              opacity: p.opacity,
              animationDuration: `${p.duration}s`,
              animationDelay: `${p.delay}s`,
            } as CSSProperties
          }
        />
      ))}

      {FIREFLIES.map((f, i) => (
        <span
          key={`f${i}`}
          className="firefly"
          style={
            {
              left: `${f.left}%`,
              top: `${f.top}%`,
              animationDuration: `${f.dur}s, ${f.dur}s`,
              animationDelay: `${f.delay}s, ${f.delay}s`,
            } as CSSProperties
          }
        />
      ))}
    </div>
  )
}
