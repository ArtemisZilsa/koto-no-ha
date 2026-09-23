import { ImageResponse } from 'next/og'

// Gambar pratinjau default (WhatsApp, X, Facebook, hasil pencarian) untuk
// semua halaman yang tidak punya gambarnya sendiri.
export const alt = '言の葉 Koto no Ha — Belajar bahasa Jepang untuk orang Indonesia'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

const JP_TEXT = '言の葉'

/** Ambil subset Noto Serif JP hanya untuk karakter yang dipakai (kecil & cepat). */
async function loadJpFont(): Promise<ArrayBuffer | null> {
  try {
    const css = await fetch(
      `https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@600&text=${encodeURIComponent(JP_TEXT)}`,
    ).then((r) => r.text())
    const url = css.match(/src: url\((.+?)\) format\('(?:opentype|truetype)'\)/)?.[1]
    if (!url) return null
    return await fetch(url).then((r) => r.arrayBuffer())
  } catch {
    return null
  }
}

export default async function OpengraphImage() {
  const jpFont = await loadJpFont()

  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
          background: '#FAFAFA',
          color: '#111111',
          padding: '72px 88px',
          borderLeft: '24px solid #B3122E',
        }}
      >
        <div style={{ display: 'flex', fontSize: 26, letterSpacing: 6, color: '#B3122E' }}>KOTO NO HA</div>
        <div style={{ display: 'flex', flexDirection: 'column' }}>
          {jpFont && (
            <div style={{ display: 'flex', fontFamily: 'NotoSerifJP', fontSize: 150, lineHeight: 1 }}>{JP_TEXT}</div>
          )}
          <div style={{ display: 'flex', fontSize: 50, marginTop: 28, fontWeight: 600 }}>
            Belajar bahasa Jepang untuk orang Indonesia
          </div>
        </div>
        <div style={{ display: 'flex', fontSize: 28, color: '#555555' }}>
          JLPT N5–N1 · Soal latihan · Kanji · Kaiwa · Tokutei Ginou
        </div>
      </div>
    ),
    {
      ...size,
      fonts: jpFont ? [{ name: 'NotoSerifJP', data: jpFont, style: 'normal', weight: 600 }] : [],
    },
  )
}
