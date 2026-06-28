import Link from 'next/link'

const links = [
  { href: '/tentang', label: 'Tentang' },
  { href: '/kebijakan-privasi', label: 'Kebijakan Privasi' },
  { href: '/kontak', label: 'Kontak' },
]

export function Footer() {
  return (
    <footer
      className="px-5 md:px-12 py-7 flex flex-col md:flex-row items-center justify-between gap-4 text-center md:text-left"
      style={{ borderTop: '0.5px solid var(--border)' }}
    >
      <div className="font-serif text-[18px] font-semibold text-ink">言の葉 · Koto no Ha</div>

      <ul className="flex items-center gap-6 list-none">
        {links.map(({ href, label }) => (
          <li key={label}>
            <Link href={href} className="text-xs text-muted hover:text-koto-text transition-colors no-underline">
              {label}
            </Link>
          </li>
        ))}
        <li>
          <a
            href="https://www.instagram.com/kotobanoha"
            target="_blank"
            rel="noopener noreferrer"
            aria-label="Instagram @kotobanoha"
            className="inline-flex items-center text-muted hover:text-koto-text transition-colors"
          >
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
              <rect x="2" y="2" width="20" height="20" rx="5" ry="5"/>
              <circle cx="12" cy="12" r="4"/>
              <circle cx="17.5" cy="6.5" r="0.5" fill="currentColor" stroke="none"/>
            </svg>
          </a>
        </li>
      </ul>

      <div className="text-[11px] text-muted">© 2026 Koto no Ha. Made in Japan 🇯🇵</div>
    </footer>
  )
}
