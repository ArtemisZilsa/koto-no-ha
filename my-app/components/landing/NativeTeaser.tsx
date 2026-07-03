import { Reveal } from '@/components/ui/Reveal'
import { Icon } from '@/components/ui/Icon'

const teasers = [
  {
    jp: '気が置けない',
    reading: 'ki ga okenai',
    gloss: 'Teman yang bikin kamu nggak perlu jaim — saking dekatnya.',
    tag: 'Hyougen 表現',
  },
  {
    jp: '猫の額',
    reading: 'neko no hitai',
    gloss: 'Sempit banget — harfiahnya "sedahi kucing".',
    tag: 'Idiom 慣用句',
  },
  {
    jp: '花鳥風月',
    reading: 'kachou fuugetsu',
    gloss: 'Keindahan alam dalam empat kanji — bahasa khas sastra.',
    tag: 'Sastra 文学',
  },
]

export function NativeTeaser() {
  return (
    <section className="px-5 md:px-12 py-16 md:py-22" style={{ background: 'var(--ink-surface)' }}>
      <Reveal>
        <div className="flex items-center gap-2 mb-3">
          <p className="text-[11px] tracking-[0.12em] uppercase" style={{ color: 'var(--gold)' }}>
            Level Baru
          </p>
          <span
            className="inline-flex items-center gap-1 text-[10px] font-medium px-2 py-0.5 rounded-full whitespace-nowrap"
            style={{ background: 'rgba(255,255,255,0.08)', color: 'var(--on-ink-muted)' }}
          >
            <Icon name="lock" className="w-3 h-3" aria-hidden />
            Segera hadir
          </span>
        </div>
        <h2
          className="font-serif text-[26px] md:text-[36px] font-semibold leading-[1.25] mb-4 tracking-tight"
          style={{ color: 'var(--on-ink)' }}
        >
          Native &amp; Sastra <span style={{ color: 'var(--gold)' }}>言葉の奥</span>
        </h2>
        <p className="text-[15px] leading-[1.8] mb-10 max-w-[540px]" style={{ color: 'var(--on-ink-muted)' }}>
          Hyougen (表現), idiom, dan ungkapan sastra yang beneran dipakai penutur asli — bahasa di luar
          kurikulum JLPT yang bikin kamu kedengeran natural, bukan seperti buku teks.
        </p>
      </Reveal>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
        {teasers.map(({ jp, reading, gloss, tag }, i) => (
          <Reveal key={jp} delay={i * 80}>
            <div
              className="rounded-xl p-6 h-full"
              style={{ background: 'rgba(255,255,255,0.04)', border: '0.5px solid var(--on-ink-line)' }}
            >
              <div className="font-serif text-[22px] font-semibold mb-1" style={{ color: 'var(--on-ink)' }}>
                {jp}
              </div>
              <div className="text-[12px] italic mb-3" style={{ color: 'var(--on-ink-faint)' }}>
                {reading}
              </div>
              <p className="text-[13px] leading-[1.75] mb-4" style={{ color: 'var(--on-ink-muted)' }}>
                {gloss}
              </p>
              <span
                className="inline-block text-[10px] tracking-[0.05em] px-2.5 py-0.5 rounded-full"
                style={{ background: 'rgba(201,150,60,0.15)', color: 'var(--gold)' }}
              >
                {tag}
              </span>
            </div>
          </Reveal>
        ))}
      </div>
    </section>
  )
}
