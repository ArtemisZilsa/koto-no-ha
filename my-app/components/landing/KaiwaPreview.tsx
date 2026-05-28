import Link from 'next/link'

const categories = ['Kehidupan Sehari-hari', 'Tempat Kerja', 'Rumah Sakit', 'Bisnis Formal', 'Kaigo / Perawatan']

const lines = [
  {
    speaker: '山田',
    av: 'a',
    text: '会議は何時に始まりますか？',
    trans: 'Rapat mulai jam berapa?',
    right: false,
  },
  {
    speaker: 'Z',
    av: 'b',
    text: '午後2時に始まります。',
    trans: 'Mulai jam 2 siang.',
    right: true,
  },
  {
    speaker: '山田',
    av: 'a',
    text: 'わかりました。資料は準備できていますか？',
    trans: 'Mengerti. Apakah materi sudah disiapkan?',
    right: false,
  },
]

const vocab = ['会議 rapat', '始まります mulai', '資料 materi/dokumen']

export function KaiwaPreview() {
  return (
    <section id="kaiwa" className="px-12 py-22">
      <div className="grid grid-cols-1 md:grid-cols-[1.3fr_1fr] gap-10 items-start">
        {/* Text */}
        <div>
          <p className="text-[11px] tracking-[0.12em] uppercase mb-3" style={{ color: 'var(--red)' }}>
            Kaiwa Stories
          </p>
          <h2 className="font-serif text-[36px] font-semibold text-ink leading-[1.25] mb-4 tracking-tight">
            Belajar Bicara Jepang<br />dari Cerita Nyata
          </h2>
          <p className="text-[15px] text-muted leading-[1.8] mb-6 max-w-[460px]">
            Ratusan dialog situasional — dari belanja di konbini hingga rapat bisnis formal.
            Dengan audio native speaker dan terjemahan kontekstual.
          </p>
          <div className="flex flex-wrap gap-2 mb-7">
            {categories.map((cat, i) => (
              <span
                key={cat}
                className="text-[11px] px-3 py-1 rounded-full"
                style={
                  i === categories.length - 1
                    ? { background: 'var(--red)', color: 'white', border: '0.5px solid var(--red)' }
                    : { border: '0.5px solid rgba(13,13,18,0.1)', color: 'var(--muted)' }
                }
              >
                {cat}
              </span>
            ))}
          </div>
          <Link
            href="/register"
            className="inline-block text-[13px] font-medium px-6 py-2.5 rounded-lg bg-ink text-paper hover:opacity-90 transition-opacity"
          >
            Lihat Semua Cerita
          </Link>
        </div>

        {/* Mock dialog card */}
        <div className="bg-white rounded-2xl overflow-hidden" style={{ border: '0.5px solid rgba(13,13,18,0.1)' }}>
          {/* Header */}
          <div
            className="flex items-center justify-between px-5 py-3.5"
            style={{ borderBottom: '0.5px solid rgba(13,13,18,0.1)' }}
          >
            <span className="text-[13px] font-medium text-ink">🏢 Di tempat kerja · Skenario rapat</span>
            <span
              className="text-[10px] px-2 py-0.5 rounded"
              style={{ background: 'var(--gold-bg)', color: 'var(--gold)' }}
            >
              N3 Level
            </span>
          </div>

          {/* Lines */}
          <div className="p-5 flex flex-col gap-3.5">
            {lines.map(({ speaker, av, text, trans, right }) => (
              <div key={text} className={`flex gap-2.5 items-start ${right ? 'flex-row-reverse' : ''}`}>
                <div
                  className="w-[30px] h-[30px] rounded-full shrink-0 flex items-center justify-center text-[11px] font-medium"
                  style={
                    av === 'a'
                      ? { background: 'var(--ink)', color: 'var(--paper)' }
                      : { background: 'var(--red-bg)', color: 'var(--red)' }
                  }
                >
                  {speaker}
                </div>
                <div
                  className="max-w-[75%] rounded-[10px] px-3 py-2.5"
                  style={
                    av === 'a'
                      ? { background: 'var(--paper-dark)', borderBottomLeftRadius: '3px' }
                      : { background: 'var(--red)', borderBottomRightRadius: '3px' }
                  }
                >
                  <div className="font-serif text-[13px]" style={{ color: av === 'a' ? 'var(--ink)' : 'white' }}>
                    {text}
                  </div>
                  <div className="text-[11px] mt-0.5" style={{ color: av === 'a' ? 'var(--muted)' : 'rgba(255,255,255,0.65)' }}>
                    {trans}
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Vocab chips */}
          <div
            className="flex gap-2 px-5 py-3"
            style={{ borderTop: '0.5px solid rgba(13,13,18,0.1)' }}
          >
            {vocab.map((v) => (
              <span
                key={v}
                className="text-[11px] px-2.5 py-1 rounded"
                style={{ background: 'var(--paper-dark)', color: 'var(--muted)' }}
              >
                {v}
              </span>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}
