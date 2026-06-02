import type { CSSProperties } from 'react'

// Konfigurasi kelopak — nilai tetap (deterministik) agar tidak ada
// hydration mismatch antara server & client. 16 kelopak halus.
const PETALS: { left: number; size: number; duration: number; delay: number; opacity: number }[] = [
  { left: 4, size: 10, duration: 11, delay: 0, opacity: 0.3 },
  { left: 11, size: 14, duration: 14, delay: -3, opacity: 0.4 },
  { left: 18, size: 8, duration: 9, delay: -6, opacity: 0.25 },
  { left: 26, size: 12, duration: 13, delay: -1, opacity: 0.35 },
  { left: 33, size: 16, duration: 16, delay: -8, opacity: 0.3 },
  { left: 40, size: 9, duration: 10, delay: -4, opacity: 0.4 },
  { left: 47, size: 13, duration: 12, delay: -10, opacity: 0.28 },
  { left: 54, size: 11, duration: 15, delay: -2, opacity: 0.35 },
  { left: 61, size: 15, duration: 13, delay: -7, opacity: 0.3 },
  { left: 68, size: 8, duration: 9, delay: -5, opacity: 0.25 },
  { left: 75, size: 12, duration: 14, delay: -11, opacity: 0.38 },
  { left: 82, size: 10, duration: 11, delay: -3, opacity: 0.3 },
  { left: 88, size: 14, duration: 16, delay: -9, opacity: 0.33 },
  { left: 93, size: 9, duration: 10, delay: -6, opacity: 0.28 },
  { left: 22, size: 11, duration: 12, delay: -13, opacity: 0.32 },
  { left: 58, size: 13, duration: 15, delay: -14, opacity: 0.3 },
]

export function SakuraPetals() {
  return (
    <div className="sakura-layer" aria-hidden="true">
      {PETALS.map((p, i) => {
        const style: CSSProperties = {
          left: `${p.left}%`,
          width: `${p.size}px`,
          height: `${p.size}px`,
          opacity: p.opacity,
          animationDuration: `${p.duration}s`,
          animationDelay: `${p.delay}s`,
        }
        return <span key={i} className="sakura-petal" style={style} />
      })}
    </div>
  )
}
