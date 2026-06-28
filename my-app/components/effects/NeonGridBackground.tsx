/**
 * Latar "neon cyber / AI" untuk halaman dashboard & dokkai: grid bergerak +
 * jaring node-garis neon (cyan/ungu) di atas latar gelap. Murni CSS/SVG &
 * deterministik (tanpa hydration mismatch). Dinonaktifkan saat html.no-anim
 * atau prefers-reduced-motion (lihat globals.css). pointer-events-none + aria-hidden.
 *
 * Dipasang sebagai anak pertama dari <main className="relative z-10"> agar tampil
 * di belakang konten (kartu var(--surface) tetap kontras).
 */

// Node konstelasi (koordinat tetap di viewBox 1000x600).
const NODES: { x: number; y: number; r: number; delay: number; color: string }[] = [
  { x: 120, y: 90, r: 3.5, delay: 0, color: 'var(--neon-cyan)' },
  { x: 300, y: 210, r: 2.5, delay: 1.2, color: 'var(--neon-violet)' },
  { x: 520, y: 110, r: 3, delay: 0.6, color: 'var(--neon-cyan)' },
  { x: 720, y: 250, r: 2.5, delay: 2, color: 'var(--neon-violet)' },
  { x: 880, y: 120, r: 3.5, delay: 1.6, color: 'var(--neon-cyan)' },
  { x: 200, y: 420, r: 2.5, delay: 0.9, color: 'var(--neon-violet)' },
  { x: 450, y: 480, r: 3, delay: 2.4, color: 'var(--neon-cyan)' },
  { x: 660, y: 430, r: 2.5, delay: 1.4, color: 'var(--neon-violet)' },
  { x: 900, y: 480, r: 3, delay: 0.3, color: 'var(--neon-cyan)' },
]

// Garis koneksi antar node (indeks ke NODES).
const LINES: [number, number][] = [
  [0, 1], [1, 2], [2, 3], [3, 4], [1, 5], [5, 6], [6, 7], [7, 8], [2, 6], [3, 7],
]

export function NeonGridBackground() {
  return (
    <div className="neon-grid" aria-hidden="true">
      {/* Grid bergerak */}
      <div className="neon-grid__moving" />
      {/* Glow ambient */}
      <div className="neon-grid__glow" />
      {/* Jaring node + garis */}
      <svg
        className="neon-grid__net"
        viewBox="0 0 1000 600"
        preserveAspectRatio="xMidYMid slice"
        xmlns="http://www.w3.org/2000/svg"
      >
        {LINES.map(([a, b], i) => (
          <line
            key={`l${i}`}
            className="neon-line"
            x1={NODES[a].x}
            y1={NODES[a].y}
            x2={NODES[b].x}
            y2={NODES[b].y}
            style={{ animationDelay: `${(i % 5) * 0.6}s` }}
          />
        ))}
        {NODES.map((n, i) => (
          <circle
            key={`n${i}`}
            className="neon-node"
            cx={n.x}
            cy={n.y}
            r={n.r}
            style={{ fill: n.color, color: n.color, animationDelay: `${n.delay}s` }}
          />
        ))}
      </svg>
    </div>
  )
}
