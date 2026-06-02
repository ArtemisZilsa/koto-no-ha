import Link from 'next/link'

const links = [
  { href: '#', label: 'Tentang' },
  { href: '#', label: 'Kebijakan Privasi' },
  { href: '#', label: 'Kontak' },
  { href: '#', label: 'Blog' },
]

export function Footer() {
  return (
    <footer
      className="px-5 md:px-12 py-7 flex flex-col md:flex-row items-center justify-between gap-4 text-center md:text-left"
      style={{ borderTop: '0.5px solid var(--border)' }}
    >
      <div className="font-serif text-[18px] font-semibold text-ink">言の葉 · Koto no Ha</div>

      <ul className="flex gap-6 list-none">
        {links.map(({ href, label }) => (
          <li key={label}>
            <Link href={href} className="text-xs text-muted hover:text-koto-text transition-colors no-underline">
              {label}
            </Link>
          </li>
        ))}
      </ul>

      <div className="text-[11px] text-muted">© 2026 Koto no Ha. Made in Japan 🇯🇵</div>
    </footer>
  )
}
