import { SITE_URL } from '@/lib/site'
import { SITE_DESCRIPTION } from '@/lib/seo'
import { FAQ_ITEMS } from '@/lib/data/faq'

// /llms.txt — ringkasan situs dalam Markdown untuk model AI (standar llmstxt.org).
// Membantu ChatGPT, Claude, Perplexity, dll. memahami isi situs dan halaman
// mana yang paling relevan untuk dikutip.
export const dynamic = 'force-static'

export function GET() {
  const u = (path: string) => `${SITE_URL}${path}`

  const body = `# Koto no Ha (言の葉)

> ${SITE_DESCRIPTION}

Koto no Ha dibuat oleh Zilsa, orang Indonesia yang sudah 3 tahun tinggal dan bekerja di Jepang dengan kemampuan setara JLPT N1. Semua penjelasan dan terjemahan ditulis dalam Bahasa Indonesia. Konten disusun sendiri, bukan terjemahan dari situs lain.

## Belajar & latihan

- [Soal Latihan JLPT N5–N3](${u('/latihan')}): set pilihan ganda kosakata (30 soal), tata bahasa (10 soal), dan kanji (20 soal), dikoreksi langsung, progres tersimpan per kategori.
- [Kuis Kanji & Kosakata](${u('/quiz')}): 10 soal acak per level dengan XP dan streak.
- [Flashcard SRS](${u('/flashcard/n5')}): pengulangan terjadwal kosakata dan kanji N5–N1.
- [Kaiwa (percakapan)](${u('/kaiwa')}): dialog N5–N1 per tema (sehari-hari, kerja, rumah sakit, bisnis, kaigo) dengan hiragana, romaji, dan terjemahan Indonesia.
- [Kaiwa Kerja per profesi](${u('/kaiwa/kerja')}): silabus percakapan kerja berurutan per profesi, dimulai dari Staf Perawatan Lansia (介護職員), 20 pelajaran.

## Kerja di Jepang

- [Tokutei Ginou (SSW)](${u('/ssw')}): hub bidang Specified Skilled Worker, termasuk 300 istilah khusus bidang kaigo.
- [Berita Jepang](${u('/berita')}): artikel berita Jepang untuk latihan membaca.

## Isi konten

- Level JLPT N5 sampai N1.
- Lebih dari 2.000 kosakata, hampir 1.000 kanji, dan lebih dari 650 pola tata bahasa, masing-masing dengan cara baca, arti Indonesia, dan contoh.
- Lebih dari 120 dialog kaiwa dan 75 bacaan dokkai (latihan membaca, butuh akun gratis).

## Tanya jawab

${FAQ_ITEMS.map((f) => `### ${f.q}\n\n${f.a}`).join('\n\n')}

## Lainnya

- [Tentang](${u('/tentang')})
- [Kontak](${u('/kontak')})
- [Instagram @kotobanoha](https://www.instagram.com/kotobanoha)
`

  return new Response(body, {
    headers: { 'Content-Type': 'text/markdown; charset=utf-8' },
  })
}
