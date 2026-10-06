import Link from 'next/link'
import { PRICING, rupiah } from '@/lib/data/pricing'
import { WashiArt } from './WashiArt'
import { LembarMateri } from './LembarMateri'

// Section 4 — Harga. Desktop: lembar materi PDF 3D (WebGL, bisa diputar); HP: buku CSS 3D.
// Layar video tetap CSS 3D, berputar sedikit saat di-hover. Checkout Xendit (T5) belum ada → tombol ke /register.
export function HargaSection() {
  return (
    <section id="harga" className="relative isolate px-5 md:px-12 py-20 md:py-28 overflow-hidden">
      <WashiArt src="/images/washi/cta-pelajar.webp" desktopOnly />

      <div className="max-w-5xl mx-auto">
        <p className="text-[12px] tracking-[0.14em] uppercase mb-3" style={{ color: 'var(--crimson)' }}>
          <span lang="ja" className="font-serif">料金</span> · Paket belajar
        </p>
        <h2 className="font-serif text-[28px] md:text-[40px] font-semibold leading-tight mb-3 max-w-[520px]" style={{ color: 'var(--text)' }}>
          Pilih cara belajarmu.
        </h2>
        <p className="text-[15px] leading-[1.8] mb-12 max-w-[480px]" style={{ color: 'var(--muted)' }}>
          Materi dasar di website tetap gratis. Paket di bawah untuk kamu yang ingin belajar lebih dalam dan terarah.
        </p>

        <div className="grid gap-6 md:grid-cols-2 max-w-[760px]">
          <Paket
            visual={<LembarMateri fallback={<Buku />} />}
            title={PRICING.pdf.title}
            price={rupiah(PRICING.pdf.price)}
            unit={PRICING.pdf.unit}
            points={[PRICING.pdf.note, 'Bisa dibaca offline & dicetak', 'Diperbarui tanpa biaya tambahan']}
          />
          <Paket
            visual={<Layar />}
            title={PRICING.video.title}
            price={rupiah(PRICING.video.price)}
            unit={PRICING.video.unit}
            points={[PRICING.video.note, 'Progres tersimpan di akunmu', 'Berhenti kapan saja']}
            highlight
          />
        </div>
      </div>
    </section>
  )
}

function Paket({
  visual, title, price, unit, points, highlight = false,
}: { visual: React.ReactNode; title: string; price: string; unit: string; points: string[]; highlight?: boolean }) {
  return (
    <div
      className="paket rounded-2xl p-6 flex flex-col"
      style={{
        background: 'color-mix(in srgb, var(--surface) 92%, transparent)',
        border: highlight ? '1.5px solid var(--crimson)' : '1px solid var(--brand-line)',
      }}
    >
      <div className="h-[150px] md:h-[250px] flex items-center justify-center mb-5" aria-hidden="true">{visual}</div>
      <h3 className="text-[16px] font-semibold mb-1" style={{ color: 'var(--text)' }}>{title}</h3>
      <p className="mb-4">
        <span className="font-serif text-[30px] font-semibold" style={{ color: 'var(--text)' }}>{price}</span>{' '}
        <span className="text-[13px]" style={{ color: 'var(--muted)' }}>{unit}</span>
      </p>
      <ul className="text-[14px] leading-[1.7] mb-6 space-y-1 list-none p-0" style={{ color: 'var(--muted)' }}>
        {points.map((p) => (
          <li key={p}><span style={{ color: 'var(--crimson)' }}>・</span>{p}</li>
        ))}
      </ul>
      <Link
        href="/register"
        className="mt-auto text-center rounded-lg px-5 py-3 text-[14px] font-medium no-underline"
        style={highlight ? { background: 'var(--crimson)', color: '#FAFAFA' } : { border: '1px solid var(--brand-line)', color: 'var(--text)' }}
      >
        Daftar dulu, gratis
      </Link>
    </div>
  )
}

/** Buku PDF 3D: sampul + punggung + tebal halaman dari kotak CSS. */
function Buku() {
  return (
    <div className="buku">
      <div className="buku__cover">
        <span lang="ja" className="font-serif text-[30px] leading-none">言の葉</span>
        <span className="text-[10px] tracking-[0.2em] mt-2">MATERI N5</span>
      </div>
    </div>
  )
}

/** Layar video 3D dengan cuplikan soal. */
function Layar() {
  return (
    <div className="layar">
      <div className="layar__screen">
        <span className="layar__play" />
        <span lang="ja" className="font-serif text-[15px]">わたし（は）学生です。</span>
      </div>
    </div>
  )
}
