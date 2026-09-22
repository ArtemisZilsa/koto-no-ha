import { Reveal } from '@/components/ui/Reveal'
import { JsonLd, faqJsonLd } from '@/lib/seo'
import { FAQ_ITEMS } from '@/lib/data/faq'

// FAQ terlihat + FAQPage JSON-LD dari teks yang sama (lib/data/faq.ts).

export function FaqSection() {
  return (
    <section className="px-5 md:px-12 py-16 md:py-22" aria-labelledby="faq-heading">
      <JsonLd data={faqJsonLd(FAQ_ITEMS)} />
      <div className="max-w-[760px] mx-auto">
        <Reveal>
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--crimson)' }}>
            よくある質問 · FAQ
          </p>
          <h2 id="faq-heading" className="font-serif text-[26px] md:text-[36px] font-semibold text-ink leading-[1.25] tracking-tight mb-8">
            Pertanyaan yang Sering Diajukan
          </h2>
        </Reveal>

        <div style={{ borderTop: '1px solid var(--brand-line)' }}>
          {FAQ_ITEMS.map((f) => (
            <details key={f.q} className="group" style={{ borderBottom: '1px solid var(--brand-line)' }}>
              <summary className="flex items-center justify-between gap-4 py-5 cursor-pointer list-none text-[15px] font-medium text-ink [&::-webkit-details-marker]:hidden">
                <h3 className="font-medium">{f.q}</h3>
                <span
                  aria-hidden
                  className="shrink-0 text-[20px] leading-none transition-transform group-open:rotate-45"
                  style={{ color: 'var(--crimson)' }}
                >
                  +
                </span>
              </summary>
              <p className="pb-5 pr-8 text-[14px] leading-[1.8]" style={{ color: 'var(--muted)' }}>
                {f.a}
              </p>
            </details>
          ))}
        </div>
      </div>
    </section>
  )
}
