/**
 * InkDivider — garis pemisah dekoratif gaya sumi-e.
 * Bukan border lurus biasa, tapi gradient yang fade di ujung,
 * seperti goresan kuas tinta tradisional Jepang.
 *
 * Pakai `style={{ color: 'var(--ink)' }}` di parent untuk warna,
 * atau override `colorVar` prop dengan nama CSS variable lain.
 */
interface InkDividerProps {
  className?: string
  colorVar?: string // contoh: 'var(--ink)' | 'var(--gold)' | 'var(--red)'
  thickness?: number // dalam px
}

export default function InkDivider({
  className = '',
  colorVar = 'var(--ink)',
  thickness = 1,
}: InkDividerProps) {
  return (
    <div
      className={className}
      style={{
        height: `${thickness}px`,
        background: `linear-gradient(90deg, transparent 0%, ${colorVar} 18%, ${colorVar} 82%, transparent 100%)`,
        opacity: 0.35,
      }}
      aria-hidden
    />
  )
}
