# Audit Data Kaiwa — Day 1 (2026-09-22, JST)

Sumber data: query langsung ke Supabase (`project_id vkdtjeogushskcgvazom`, read-only)
untuk hitungan produksi saat ini, dan pembacaan file migrasi di
`my-app/supabase/migrations/*.sql` untuk apa yang bisa divalidasi otomatis
lewat repo (lihat batasan besar di §4).

## 1. Lokasi & skema data

- Tabel utama: `public.kaiwa_stories` (didefinisikan di `001_initial_schema.sql`,
  diperluas oleh `045_kaiwa_jobs.sql`).
  Kolom: `id, level_id, title, category, lines (jsonb), vocab_highlight (jsonb),
  is_premium, job_slug, lesson_no, goal`.
  - `job_slug IS NULL` → dialog lepas (telusur per tema, `/kaiwa`).
  - `job_slug` terisi → pelajaran silabus profesi (`/kaiwa/kerja/...`).
  - Unique index: `uniq_kaiwa_level_title (level_id, title)` untuk lepas,
    `uniq_kaiwa_job_lesson (job_slug, lesson_no)` (partial) untuk silabus.
- Tabel pendukung: `public.kaiwa_jobs` (profesi; `slug, sector_slug, jp, label,
  summary, sort_order`), `public.levels` (`id→code`: 1=N5, 2=N4, 3=N3, 4=N2,
  5=N1, 6=SSW, 7=BIZ).
- Bentuk satu baris dialog di `lines[]`: `{speaker, text, reading, romaji, trans}`
  — kelimanya wajib string non-kosong (dicek konsisten oleh
  `tools/seed-kaiwa-lessons.mts` yang sudah ada dan validator baru).
- Bentuk satu entri `vocab_highlight[]`: `{word, reading, meaning}` — **tidak
  ada kolom `romaji` terpisah**; kalau ada romaji, itu dititipkan di dalam
  string `reading` (lihat §3, ini akar masalah yang mau dibereskan Fase D).

## 2. Jumlah dialog per level × tema (dialog lepas, `job_slug IS NULL`)

| Level | daily | work | hospital | biz | kaigo | **Total** |
|---|---|---|---|---|---|---|
| N5 | 14 | 4 | 4 | 3 | 4 | **29** |
| N4 | 9 | 5 | 3 | 2 | 4 | **23** |
| N3 | 8 | 4 | 3 | 3 | 5 | **23** |
| N2 | 6 | 6 | 3 | 5 | 3 | **23** |
| N1 | 5 | 4 | 3 | 8 | 3 | **23** |
| **Total** | | | | | | **121** |

**Selisih vs pengamatan 21 Sep 2026** (total 121; N5 29, N4/N3/N2/N1 masing-masing
23): **tidak ada selisih.** Angka hari ini identik persis. Tidak ada
penambahan/kehilangan data sejak observasi itu.

Sel di bawah target minimum 6 dialog/tema (acuan antrean E2, Fase 8): **tidak
ada** — setiap sel level×tema sudah ≥3, dan mayoritas sudah ≥6 kecuali beberapa
kombinasi bisnis/hospital di level tinggi yang masih 2–3
(N4 biz=2, N2/N1 hospital=3, N1 kaigo=3, N4 hospital=3, N3 biz=3, N4 work=... dst).
Sel dengan hitungan **terendah** (kandidat prioritas E2 saat antrean sampai
sana): N4 biz (2), lalu beberapa sel bernilai 3 (N5 biz, N4 hospital, N3 biz,
N2 hospital, N2 kaigo, N1 hospital, N1 kaigo, N1 work=4 mendekati).

## 3. Kaiwa per Profesi (silabus)

| job_slug | jumlah pelajaran | lesson_no |
|---|---|---|
| kaigo-shokuin | 20 | 1–20 (lengkap, tanpa lubang) |

Profesi lain yang sudah punya baris di `kaiwa_jobs` tapi **belum ada
pelajaran sama sekali**: 訪問介護員 (kaigo kunjungan rumah), 生活相談員 (konselor
kehidupan) — sesuai catatan di CLAUDE.md Fase 7. Ini jadi profesi #2 dan #3 di
urutan antrean E3.

## 4. Panjang dialog & batasan besar cakupan audit

**Temuan penting:** dari 121 dialog lepas di database, **hanya 106 baris**
yang punya jejak sebagai file migrasi terlacak di repo:

- `040_seed_kaiwa_n5.sql` — 6 dialog (N5)
- `048`–`052_seed_kaiwa_lepas_*.sql` — 80 dialog (Fase 8, 16/level)
- `046`+`047_seed_kaiwa_kaigo_shokuin_*.sql` — 20 pelajaran silabus (bukan lepas)

Itu artinya migrasi lepas yang tercatat = 6 + 80 = **86**, sisanya
**35 dialog lepas** (121 − 86) ada di database tapi **tidak berasal dari file
migrasi manapun di repo** — kemungkinan besar disetor langsung ke Supabase
sebelum alur "migrasi-file → `npm run seed:kaiwa`" ini berlaku (sebelum
migrasi 040). Dampaknya:

1. **Validator (`npm run validate:kaiwa`) tidak bisa memeriksa 35 dialog itu**
   sama sekali, karena validator sengaja hanya membaca file di repo (aturan
   keras #3: tidak boleh menulis ke Supabase, dan membaca-langsung-dari-DB
   di CI berarti butuh secret DB di CI yang juga sebaiknya dihindari).
2. Kalau salah satu dari 35 dialog itu perlu diperpanjang (antrean E1), PR
   perbaikannya harus ditulis sebagai migrasi **baru** (mis. `UPDATE` by
   `title`+`level_id`, atau re-insert dengan `ON CONFLICT ... DO UPDATE`)
   supaya de-facto masuk ke alur review — bukan mengedit file yang tidak ada.

Dari 106 baris yang *bisa* diperiksa, ambang panjang minimum (N5≥6, N4≥8,
N3–N1≥10 baris) — **semuanya lulus** (Fase 8 & silabus kaigo-shokuin ditulis
sesuai standar sejak awal).

**Dialog di bawah ambang ada di database tapi di luar cakupan file** — dari
query langsung ke Supabase: tepat **7 dialog per level** (35 total) dengan
`jsonb_array_length(lines) < 6` (N5) / `< 8` (N4) / `< 10` (N3–N1), semuanya
berisi persis 4–5 baris. Ini kemungkinan besar sama dengan 35 dialog "tanpa
file migrasi" di atas. **Ini jadi materi utama antrean E1** begitu Day 4
tiba — tapi harus ditulis ulang lewat migrasi baru (lihat poin di atas), tidak
bisa "sekadar mengedit" file yang tidak ada.

## 5. Format glosarium — belum seragam

`vocab_highlight[].reading` dipakai untuk tiga bentuk berbeda, bahkan di
dalam file yang sama:

- **hiragana + romaji dalam kurung** (paling dekat ke standar Fase D, mis.
  `"うごかす (ugokasu)"`) — bentuk paling umum di batch terbaru (048–052).
  67 dari 275 entri di file bertracak (24%) TIDAK memakai bentuk ini.
- **romaji telanjang tanpa kurung**, tanpa hiragana sama sekali (mis.
  `"rekurieeshon"`, `"kanemasu"`) — terutama untuk kata katakana/serapan dan
  pola tata bahasa (`〜わけですね` dsb). Ditemukan di 040, 046, 047, dan
  048–052 (jadi bukan cuma warisan data lama — batch terbaru pun masih
  melakukan ini).
- **hiragana polos tanpa romaji** — hanya di `040_seed_kaiwa_n5.sql` (data
  paling lama yang masih tertelusur sebagai file).

Validator baru (`npm run validate:kaiwa`) menghasilkan **67 warning kategori
`4-format-glosarium`** dari 106 baris yang diperiksa — semuanya warning
(bukan error) karena semua file yang berkontribusi sudah ada di `master`
sebelum hari ini. Begitu Fase D (migrasi format) berjalan, ini jadi acuan
langsung file mana yang perlu disentuh.

Tidak ditemukan kolom `romaji` terpisah di skema JSON — standar Fase D
(`表記 (よみ · romaji) — arti`) tampaknya mengasumsikan `reading` dan `romaji`
sebagai dua sumber terpisah yang digabung saat ditampilkan; hari ini keduanya
sudah tercampur jadi satu string `reading` dengan format yang tidak konsisten.
Keputusan skema pasti (tetap satu field campuran vs. pisah `reading`+`romaji`)
sebaiknya diambil eksplisit di awal Fase D, bukan diasumsikan.

## 6. Judul ganda

Tidak ditemukan judul ganda dalam level × tema yang sama, baik dari query
Supabase langsung (group by level+category+title) maupun dari 106 baris yang
tertelusur di migrasi.

## 7. Temuan teknis lain (relevan untuk antrean C)

- **C1 (cache `/kaiwa` vs `/kaiwa?level=N5`)**: `app/kaiwa/page.tsx` sudah
  memakai `LEVELS.find(...) ?? LEVELS[0]` dan `getKaiwaByLevel` langsung dari
  Supabase tanpa `export const revalidate` atau `dynamic` eksplisit apa pun —
  jadi baik `/kaiwa` maupun `/kaiwa?level=N5` semestinya menjalankan query
  yang sama persis di kode. Ketimpangan yang dilaporkan (7 dialog/1 tema vs.
  14 dialog/5 tema) kemungkinan gejala **cache Next.js/Netlify yang basi**
  (mis. Full Route Cache dari sebelum Fase 8 di-deploy untuk path tanpa query
  string) — bukan bug logika di komponen. AGENTS.md situs ini menegaskan
  Next.js 16 punya perilaku cache berbeda dari training data; perbaikannya
  perlu baca `node_modules/next/dist/docs/` dulu sebelum ubah kode cache.
  **Belum diperbaiki hari ini** (dijadwalkan antrean C, Day 2–7).
- **C2 (angka statis "40+ dialog")**: ditemukan di `HeroSection.tsx` dan
  `KaiwaPreview.tsx` — perlu dihitung otomatis dari data. Belum diubah hari
  ini.
- **C3 (SEO/OG per level×tema)**: `app/kaiwa/page.tsx` cuma punya `export
  const metadata` statis (title+description tetap, tidak per level/tema, dan
  tanpa `openGraph`/`canonical`) — jadi og:title/og:url mewarisi default dari
  `app/layout.tsx` (site-wide), persis seperti dilaporkan. Perlu
  `generateMetadata` dinamis berbasis `searchParams`. Belum diubah hari ini.

## 8. Temuan blocking di luar antrean (penting)

**`npm run lint` gagal di `master` HEAD saat ini (5fe8e85), independen dari
perubahan hari ini** — 8 error di 6 file yang sama sekali tidak menyentuh
kaiwa: `app/kontak/page.tsx` (2×, `react/no-unescaped-entities`),
`components/landing/HeroSection.tsx` (1×, "impure function during render"),
`components/quiz/QuizEngine.tsx` (2×), `components/quiz/QuizEndScreen.tsx`
(1×), `components/ui/AnimatedKanji.tsx` (1×), `components/ui/Reveal.tsx` (1×)
— lima terakhir pola `react-hooks/set-state-in-effect`. `npm run build`
(termasuk typecheck) tetap **lulus bersih**.

Dampaknya: **gerbang auto-merge teknis di Aturan Keras #2 mensyaratkan
"lint/typecheck lulus"**, dan selama lint gagal di baseline, gerbang itu
tidak pernah terpenuhi apa pun isi PR-nya. PR hari ini sengaja **tidak**
menyentuh 6 file itu (di luar cakupan "fokus fitur Kaiwa"), jadi CI PR ini
pun akan merah di step lint — bukan karena PR ini, tapi karena kondisi
`master` sendiri. Direkomendasikan ke Zilsa: perbaiki 6 file itu (kemungkinan
kecil & mekanis) di luar program 30 hari ini, supaya auto-merge teknis bisa
benar-benar berjalan mulai Day 2.

## 9. Cakupan validator hari ini

`npm run validate:kaiwa` (baru) mengecek (1) field wajib, (4) format
glosarium, (5) panjang minimal, (6) judul ganda — dari file migrasi
`INSERT INTO public.kaiwa_stories` di repo. Pelanggaran di file yang sudah
ada di `origin/master` = warning; di file baru/berubah = error (exit 1).
Cek (2) kecocokan hiragana↔kanji dan (3) romaji-dari-skrip **belum
diimplementasikan** — keduanya butuh tokenizer morfologis (partikel は/へ/を
tidak bisa dikonversi benar dari pemetaan karakter polos) dan dijadwalkan
Day 2–3.

Hasil menjalankan validator hari ini terhadap seluruh migrasi yang ada: **0
error, 67 warning**, seluruhnya kategori format glosarium (lihat §5).
