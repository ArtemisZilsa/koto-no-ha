# State — Program 30 Hari Kaiwa

## Day 18 (9 Okt 2026 JST)

- Rem darurat AKTIF: PR konten terbuka #24 (Day 9, E1 N4), #41 (Day 15, E1 N3), #43 (Day 17, E1 N2) = 3. Tidak ada konten baru hari ini.
- PR teknis STATE lama #31, #34, #42 usang (digantikan #44 dan PR ini); boleh ditutup.
- Antrean teknis kosong. Antrean konten menunggu review Zilsa: sisa E1 N2 (2), N1 (7); D N4-N1; E2.
- Seed menunggu Zilsa: 058, 060, 061, 064 (dan 040/048/054/055 bila belum).

## Day 17 (8 Okt 2026 JST)

- PR konten terbuka: #24 (Day 9, E1 N4), #41 (Day 15, E1 N3) + PR Day 17 (E1 N2) = 3. PR #26 dan #28 sudah di-merge.
  Rem darurat TIDAK aktif hari ini; besok aktif bila ketiganya belum di-merge.
- E1 N2: `064_extend_kaiwa_lepas_n2_short.sql` (5 dari 7 dialog N2 pendek: Konsultasi Karier, Meminta Kenaikan Gaji,
  Meminta Maaf atas Kesalahan, Menanggapi Keluhan Pelanggan, Negosiasi dengan Klien; 4 -> 10 baris). 4 baris asli
  disalin dari DB. Sisa N2: "Diskusi Masalah Sosial", "Menyampaikan Ketidaksetujuan".
- Catatan: `validate:kaiwa` dan `seed:kaiwa` hanya memahami `INSERT ... ON CONFLICT`, bukan `UPDATE`; migrasi E1 harus berbentuk INSERT penuh.
- PR teknis STATE lama #31, #34, #42 usang (digantikan PR ini); boleh ditutup.
- Seed menunggu Zilsa: 058, 060, 061, 064 (dan 040/048/054/055 bila belum).
- Antrean berikutnya: sisa E1 N2 (2), N1 (7); D N4-N1; E2.

## Day 14 (5 Okt 2026 JST)

- Rem darurat AKTIF: PR konten terbuka #24 (Day 9), #26 (Day 10), #28 (Day 11) belum di-merge. Tidak ada konten baru hari ini.
- PR teknis STATE #31 (Day 12) dan #34 (Day 13) masih terbuka; checks hijau, mergeable clean.
- Antrean teknis kosong; antrean konten menunggu review Zilsa (sisa E1 N3 2, N2 6, N1 7; D N4-N1).
- Seed menunggu Zilsa: 058, 060, 061 (dan 040/048/054/055 bila belum).

## Day 11 (2 Okt 2026 JST)

- Rem darurat TIDAK aktif (PR konten terbuka: #24 Day 9, #26 Day 10, #28 Day 11 = 3 setelah PR hari ini;
  hari berikutnya cek ulang: bila masih >=3 terbuka, rem aktif).
- PR #27 (STATE Day 10, teknis) di-merge.
- E1 N3 dimulai: `061_extend_kaiwa_lepas_n3_short.sql` (PR #28): Di Panti Jompo, Komplain dengan Sopan,
  Membatalkan Janji, Rapat di Kantor, Wawancara Kerja Sederhana, masing-masing 4 -> 10 baris.
  Sisa N3: "Menanyakan Jalan yang Rumit", "Menjelaskan Gejala ke Apoteker".
- Antrean berikutnya: sisa E1 N3 (2), N2 (6), N1 (7); B lanjutan (tokenizer); D N4-N1.
- Seed yang menunggu Zilsa: 058, 060, 061 (dan 040/048/054/055 bila belum).

## Day 10 (1 Okt 2026 JST)

- Rem darurat TIDAK aktif (PR konten terbuka: #24 Day 9 + PR Day 10).
- E1 N4 dituntaskan: `060_extend_kaiwa_lepas_n4_short_2.sql` ("Di Klinik" 5 -> 9
  baris, "Lapor ke Atasan" 4 -> 8 baris), bersama 058 (PR #24) mencakup 7 dialog
  N4 pendek. Dicek read-only di Supabase: 058/060 belum dijalankan (ketujuhnya
  masih 4-5 baris). Zilsa perlu menjalankan `npm run seed:kaiwa -- --file <migrasi>`
  untuk 040, 048, 054, 055, 058, 060.
- Penomoran: Day N = hari sejak 22 Sep 2026 (1 Okt = Day 10).
- Antrean berikutnya: E1 N3 (7 dialog), N2 (6), N1 (7); B lanjutan (tokenizer);
  D untuk N4-N1.
- Tidak ada PR teknis selain update STATE ini.

- `start_date`: 2026-09-22 (JST)
- Hari ini: **Day 8 / 30** (29 Sep 2026 JST; run sebelumnya menyebut "Day 6" untuk 28 Sep, jadi penomoran run tertinggal 1 hari dari kalender — Day N dihitung dari start_date sesuai instruksi)
- Rem darurat: **TIDAK AKTIF** (update 29 Sep sore): Zilsa me-merge PR konten
  #14, #16, #18 (dan PR #20 dari sesi lain). PR konten program yang terbuka: 0.
- **Migrasi belum dijalankan ke Supabase** (dicek read-only 29 Sep): 7 dialog N5
  dari 054/055 masih 4–5 baris, format glosarium 040/048 belum berubah di DB.
  Zilsa perlu menjalankan `npm run seed:kaiwa -- --file <migrasi>` untuk 040,
  048, 054, 055. Run berikutnya: cek ulang; jangan tulis ke DB sendiri.
- Format glosarium D ("yomi · romaji" tanpa kurung) dianggap **terkonfirmasi**
  karena PR #14 di-merge. D untuk N4–N1 boleh lanjut.

## Perubahan aturan (29 Sep 2026, instruksi langsung Zilsa di chat)

- Zilsa meminta PR #6 (`fitur/loading-publik`, sesi lain) diperbaiki dan
  **di-merge otomatis**, dan mengizinkan aturan diubah bila perlu. Diterapkan
  sebagai: PR teknis/non-konten yang sudah diminta Zilsa secara eksplisit boleh
  di-merge oleh agen setelah gerbang lulus (tsc, lint, build, validate:kaiwa,
  CI hijau, deploy preview ready). PR **konten Jepang tetap wajib review
  Zilsa** — tidak berubah, karena Zilsa tidak menyebut itu.
- Aturan di prompt routine terjadwal tidak bisa diubah dari repo; kalau Zilsa
  ingin perubahan permanen (mis. auto-merge PR fitur), edit teks instruksi
  routine-nya.

## Item selesai

- **A — Audit**: `scheduler/kaiwa-30d/AUDIT.md` ditulis (Day 1). Data lepas
  identik dengan pengamatan 21 Sep 2026 (121 dialog: N5 29, N4/N3/N2/N1
  masing-masing 23) — tidak ada selisih.
- **B — Validator (sebagian)**: `npm run validate:kaiwa`
  (`my-app/tools/validate-kaiwa.mts`) + `.github/workflows/kaiwa-ci.yml`.
  Mengecek (1) field wajib, (4) format glosarium, (5) panjang minimal,
  (6) judul ganda, dari file migrasi di repo. Lama vs baru dibedakan lewat
  `git diff` terhadap `origin/master` (override: `--base=<ref>`).
- **C1 — cache `/kaiwa` vs `/kaiwa?level=N5`** (Day 2): lihat analisis di
  bawah dan PR terbuka.
- **Perbaikan CI di luar antrean** (Day 2, atas permintaan langsung Zilsa di
  chat): Zilsa menanyakan kegagalan run CI di `master` yang disebut di
  laporan hari ini (lihat "Catatan penting" di bawah). Root cause
  ditelusuri dari log job: `npm run build` gagal karena `next/font/google`
  (Inter, Noto Sans/Serif JP di `app/layout.tsx`) gagal mengunduh berkas
  font dari Google saat build — runner CI tidak punya cache, jadi satu
  hiccup jaringan menggagalkan seluruh build. PR `[teknis] Retry npm run
  build di CI untuk redam flake fetch Google Fonts` (merge `824cfe0`):
  bungkus step `npm run build` di `kaiwa-ci.yml` dengan retry 3x. Tidak
  mengubah cara aplikasi memuat font maupun `netlify.toml`/Vercel (di luar
  kendali repo). **Dampak untuk program ini**: `kaiwa-ci.yml` (dipakai
  sebagai gerbang auto-merge teknis program kaiwa-30d) sekarang lebih
  tahan terhadap flake ini — kalau gerbang teknis gagal di run berikutnya
  dan pesannya "Module not found" di berkas font Google, itu bukan
  masalah kode kaiwa, cek apakah retry-nya sudah jalan 3x.
- **C2 — angka statis "40+ dialog"** (Day 3): lihat detail di bawah dan PR
  #11 (merged).
- **C3 — SEO title/description/canonical per level & tema di `/kaiwa`** (Day
  4): lihat "Analisis C3" di bawah dan PR #13 (merged).
- **Perbaikan validator di luar antrean asli, tapi teknis (Day 4)**: sambil
  menyiapkan antrean D (lihat bawah), ditemukan bahwa `checkGlossaryFormat`
  di `tools/validate-kaiwa.mts` menganggap pola lama "yomi (romaji)" sebagai
  "paling dekat ke standar" — padahal kedua komponen yang merender
  `vocab_highlight` (`KaiwaList.tsx`, `app/kaiwa/kerja/[job]/[lesson]/page.tsx`)
  SUDAH membungkus `reading` dalam kurungnya sendiri, jadi pola itu akan
  tampil kurung ganda. Validator diperbaiki untuk menolak kurung apa pun di
  dalam `reading` dan membedakan kata berkanji ("yomi · romaji") dari kata
  kana-saja (romaji telanjang). Dibundel ke PR #13 (masih kategori teknis,
  tidak menyentuh data). Ini keputusan format resmi untuk antrean D — lihat
  PR #14 dan "Antrean berikutnya" di bawah.
- **D — migrasi format glosarium, level N5 (dialog lepas saja)** (Day 4):
  `040_seed_kaiwa_n5.sql` + `048_seed_kaiwa_lepas_n5.sql`, PR #14 (konten,
  **belum di-merge, menunggu review Zilsa**). Lihat "Analisis D" di bawah.
- **E1 — perpanjang 5 dialog lepas N5 di bawah ambang panjang** (Day 5):
  `054_extend_kaiwa_lepas_n5_short.sql`, PR #16 (konten, **belum di-merge,
  menunggu review Zilsa**). Lihat "Analisis E1" di bawah.
- **E1 — perpanjang 2 dialog lepas N5 sisa** (Day 6):
  `055_extend_kaiwa_lepas_n5_short_2.sql`, PR #18 (konten, **belum di-merge,
  menunggu review Zilsa**). "Menyapa Tetangga" (4→7 baris) dan "Perkenalan
  Diri" (4→8 baris) — 4 baris asli tiap dialog dipertahankan persis, baris
  baru menambah obrolan kecil (kerja/belanja untuk yang pertama, tanya-jawab
  pekerjaan + ajakan makan siang untuk yang kedua). `vocab_highlight`
  dinormalkan ke standar glosarium Fase D. Ini **menuntaskan E1** (seluruh 7
  dialog N5 pendek dari AUDIT.md §4 sudah diperpanjang lewat 054+055, meski
  keduanya masih menunggu merge). Gerbang lokal lulus: `tsc --noEmit`
  bersih, `npm run lint` bersih, `npm run build` sukses, `npm run
  validate:kaiwa -- --base=origin/master` lulus (0 error dari file baru).

## Analisis C1 (Day 2)

Membaca `app/kaiwa/page.tsx`: komponen sudah `await searchParams` (Request-
time API, App Router) DAN `getKaiwaByLevel` memanggil `createClient()` di
`lib/supabase/server.ts` yang `await cookies()` (Request-time API lain).
Menurut `node_modules/next/dist/docs/01-app/03-api-reference/03-file-conventions/page.md`
dan `01-app/02-guides/caching-without-cache-components.md` (situs ini
**tidak** mengaktifkan `cacheComponents`, jadi model caching yang berlaku
adalah model lama), kedua API itu masing-masing sudah cukup memaksa route
ke dynamic rendering per-request. `npm run build` mengonfirmasi `/kaiwa`
sudah bertanda `ƒ` (Dynamic, server-rendered on demand) — bukan `○`
(Static) — bahkan sebelum perubahan hari ini.

Kesimpulan: kode `page.tsx` itu sendiri **tidak** punya bug logika cache —
`/kaiwa` dan `/kaiwa?level=N5` sudah menjalankan query yang identik
(`LEVELS.find(...) ?? LEVELS[0]` sama-sama jatuh ke N5). Ketimpangan yang
dilaporkan (7 dialog/1 tema vs 14 dialog/5 tema) paling mungkin adalah
**cache CDN/edge Netlify yang basi** dari sebelum data Fase 8 di-deploy,
bukan sesuatu yang bisa direproduksi dari kode saat ini.

**Perubahan**: menambahkan `export const dynamic = 'force-dynamic'` secara
eksplisit di `app/kaiwa/page.tsx`. Ini defensif, bukan perbaikan bug logika:
memaksa Next mengirim header `Cache-Control` no-store di setiap respons
supaya CDN/edge tidak pernah menyimpan snapshot basi untuk path `/kaiwa`
tanpa parameter, dan jadi kontrak eksplisit yang tidak bergantung pada
heuristik deteksi dynamic Next 16 (yang menurut `AGENTS.md` situs ini bisa
beda dari versi training data).

**Batasan verifikasi**: sesi ini tidak bisa `WebFetch`/curl domain
`*.netlify.app` (diblokir kebijakan jaringan sandbox), dan tidak ada
`.env.local`/kredensial Supabase di sandbox untuk menjalankan `next dev`
melawan data asli. Jadi gerbang "deploy preview memuat semua URL uji tanpa
error" pada Aturan Keras #2 **tidak bisa dicek langsung isi halamannya**
dari sesi ini — hanya bisa dicek lewat status check GitHub (`ci` Actions +
status deploy Netlify/Vercel yang dilaporkan API GitHub sebagai "ready").
Sama seperti keterbatasan yang dicatat di PR #2 (Day 1).

## Analisis C2 (Day 3)

Grep menyeluruh untuk pola `40+`/`dialog` di seluruh `my-app/`: angka statis
yang ditemukan **hanya satu**, di `components/landing/HeroSection.tsx`
("40+" untuk stat "Dialog dari Situasi Nyata"). `KaiwaPreview.tsx` (yang
disebut AUDIT.md §7 sebagai kemungkinan lokasi kedua) ternyata **tidak**
punya angka statis — isinya cuma satu kartu dialog contoh (mock, bukan klaim
angka) dengan data hardcoded untuk ilustrasi UI, jadi tidak perlu disentuh.

**Perubahan**: tambah `getKaiwaDialogCount()` di `lib/data/queries.ts` —
`COUNT(*)` pada `kaiwa_stories` dengan `job_slug IS NULL` (dialog lepas,
konsisten dengan definisi yang sudah dipakai `getKaiwaByLevel`), pakai
`{ count: 'exact', head: true }` supaya tidak menarik baris. `HeroSection`
diubah jadi async server component, memanggil fungsi itu, lalu membulatkan
hasilnya ke bawah ke kelipatan 10 (`formatDialogStat`, mis. 121 → "120+")
sebelum ditampilkan — supaya klaim "X+" selalu valid tanpa perlu commit baru
tiap kali ada dialog ditambah lewat program E nanti.

**Gerbang lokal**: `tsc --noEmit` (strict) bersih, `npm run lint` bersih,
`npm run build` sukses (`/` tetap `ƒ` Dynamic — tidak berubah, halaman ini
sudah dynamic sejak ada tagline acak), `npm run validate:kaiwa --
--base=origin/master` lolos (67 warning data lama, sama seperti baseline,
tidak ada error baru — PR ini tidak menyentuh file migrasi kaiwa).

**Keterbatasan verifikasi**: sama seperti Day 1–2, sandbox tidak bisa
`WebFetch`/curl domain `*.netlify.app` maupun akses Supabase langsung,
sehingga verifikasi isi deploy preview & produksi mengandalkan status check
GitHub (lihat bagian PR di bawah).

## Analisis C3 (Day 4)

`app/kaiwa/page.tsx` sebelumnya hanya punya `export const metadata` statis
tunggal (title/description tetap, tanpa `openGraph`/`canonical` per
level-tema) — jadi semua kombinasi `/kaiwa?level=&theme=` mewarisi og:title/
og:url default dari `app/layout.tsx` (sama dengan beranda), persis seperti
dilaporkan di AUDIT.md §7.

**Perubahan**: `generateMetadata` dinamis, dihitung dari `searchParams` dan
`getKaiwaByLevel` (fungsi yang sama yang dipanggil komponen halaman — kini
dibungkus React `cache()` supaya tidak dobel query per request). Title/
description/`alternates.canonical` berbeda untuk (a) tanpa parameter/hanya
level, dan (b) level+tema valid. Mengikuti konvensi yang sudah dipakai di
`berita/[id]`/`flashcard/[level]` (title + `alternates.canonical`, tanpa
mengisi `openGraph.title/url` manual — sesuai catatan SEO&GEO di CLAUDE.md).

**Gerbang lokal**: `tsc --noEmit` bersih, `npm run lint` bersih, `npm run
build` sukses (`/kaiwa` tetap `ƒ` Dynamic), `npm run validate:kaiwa --
--base=origin/master` lolos.

## Analisis D (Day 4) — keputusan format & migrasi N5

AUDIT.md Day 1 §5 mencatat keputusan skema Fase D masih terbuka. Membaca
kode render (`components/learn/KaiwaList.tsx` dan
`app/kaiwa/kerja/[job]/[lesson]/page.tsx`), **keduanya membungkus
`v.reading` dalam kurungnya sendiri**: `{word} ({reading}) — {meaning}`.
Konsekuensinya, pola lama "yomi (romaji)" (dipakai di 048–052, sebagian 046/
047) akan tampil **kurung ganda** di halaman — kemungkinan bug tampilan yang
sudah lama ada di produksi.

**Keputusan format resmi (dipakai mulai Day 4)**: `reading` di DB TIDAK
boleh punya kurung sendiri.
- Kata berkanji: `"yomi · romaji"` (titik tengah, tanpa kurung).
- Kata kana-saja (word tidak punya kanji): `"romaji"` telanjang.

Ini bukan "mengarang fakta bahasa Jepang" — murni kesimpulan dari baca kode
komponen (dua tempat, konsisten), tidak ada bacaan/romaji yang diubah
nilainya, hanya tanda baca dan lengkap-tidaknya romaji. **Tapi ini BELUM
diverifikasi di browser sungguhan** (sandbox tidak punya akses jaringan ke
domain Netlify/Vercel) — PR #14 minta konfirmasi Zilsa sebelum dipakai untuk
N4–N1.

Validator (`tools/validate-kaiwa.mts`) diperbarui ke definisi ini (PR #13,
teknis, sudah merge) — reading dengan kurung literal sekarang selalu
diflag, kata kana-saja vs berkanji dibedakan lewat `word`.

**Migrasi N5**: `040_seed_kaiwa_n5.sql` (30 entri, semua sebelumnya hiragana
tanpa romaji — romaji ditambahkan mekanis, dicocokkan ke romaji baris
dialog yang sama dalam file) dan `048_seed_kaiwa_lepas_n5.sql` (59 dari 64
entri, ganti tanda baca "(x)" → " · x", romaji/hiragana tidak berubah
nilainya; 5 entri kana-saja sudah bare-romaji, tidak disentuh). PR #14,
kategori konten, **tidak di-merge** — menunggu review Zilsa termasuk
konfirmasi keputusan format di atas.

**Sengaja di luar cakupan PR #14**: silabus profesi 介護職員 (`046`/`047`) —
lesson_no di file itu tidak dikelompokkan per JLPT level dalam satu file
(1–7 N5, 8–13 N4, 14–20 N3 semua dalam file yang sama), jadi "1 PR per
level" untuk data itu perlu pendekatan berbeda dari dialog lepas. Perlu
diputuskan hari berikutnya: migrasi tersendiri per rentang lesson_no, atau
digabung saat E3 mengerjakan profesi baru.

## Analisis E1 (Day 5)

Query langsung ke Supabase (read-only, lihat batasan di "Catatan penting")
mengonfirmasi temuan AUDIT.md §4: tepat 35 dialog lepas (7 per level N5–N1)
punya `jsonb_array_length(lines) < ambang`, semuanya persis 4–5 baris, dan
tidak satu pun punya jejak file migrasi di repo.

Karena PR #14 (keputusan format D) masih terbuka tanpa review/komentar dari
Zilsa (dicek awal sesi ini, lihat "Antrean berikutnya" Day 4 poin 1), **D
untuk N4 sengaja TIDAK dikerjakan hari ini** — bukan menyerah, tapi menghindari
menggandakan risiko: kalau keputusan format kurung-tunggal di "Analisis D"
ternyata salah, lebih baik itu ketahuan sebelum dipakai di 4 migrasi format
lain, bukan setelah. PR #14 tetap dibiarkan menunggu, tidak di-merge sendiri.

Sebagai gantinya, slot PR konten hari ini dipakai untuk **E1**: 5 dari 7
dialog N5 pendek (dipilih karena levelnya paling rendah risiko — tata bahasa
paling dasar, kesalahan alami paling kecil kemungkinannya) diperpanjang lewat
migrasi baru `054_extend_kaiwa_lepas_n5_short.sql` (`INSERT ... ON CONFLICT
(level_id, title) DO UPDATE`, sesuai catatan AUDIT.md §4 — bukan edit file
yang tidak ada). Judul, tema, dan baris lama dipertahankan; baris baru
ditambahkan di akhir sampai ambang N5 (≥6 baris) terlampaui.

`vocab_highlight` tiap dialog yang disentuh juga ditulis ulang penuh (bukan
hanya `lines`), jadi sekaligus dinormalkan ke standar glosarium Fase D
("yomi · romaji" tanpa kurung / romaji telanjang untuk kata kana-saja) —
ini **independen** dari status konfirmasi PR #14 (yang soal migrasi data
LAMA), karena standar itu sendiri sudah aktif di `tools/validate-kaiwa.mts`
sejak PR #13 (merged) untuk baris APA PUN yang ditulis ulang, baru atau lama.

**Gerbang lokal**: `npm ci` (node_modules belum ada di sandbox baru — di-
install dulu), `tsc --noEmit` bersih, `npm run lint` bersih, `npm run build`
sukses (gagal di percobaan pertama karena flake fetch Google Fonts yang sudah
tercatat di catatan Day 2 — sukses di percobaan retry ke-2), `npm run
validate:kaiwa -- --base=origin/master` lulus, 0 error dari file baru
(406 baris warning lain semuanya dari file lama yang tidak diubah PR ini —
jumlah warning naik dari 67 karena base perbandingan render ulang seluruh
riwayat sejak PR #13, bukan regresi).

**Belum disentuh hari ini** (batas 5 item/PR konten): 2 dialog N5 pendek
sisanya ("Menyapa Tetangga", "Perkenalan Diri") — lanjutan di "Belum
selesai" di bawah.

## Belum selesai / lanjutan

- **B lanjutan**: cek (2) hiragana↔kanji dan (3) romaji-dari-skrip — butuh
  tokenizer morfologis (kuromoji atau setara), karena partikel は/へ/を
  tidak bisa dikonversi benar dari pemetaan karakter polos. Lihat komentar
  di `tools/validate-kaiwa.mts`. Dicoba dicek kelayakannya Day 5: registry
  npm bisa diakses dari sandbox ini (`npm view kuromoji versions` sukses),
  jadi menambah dependency BUKAN blocker jaringan — tapi belum dikerjakan
  (butuh integrasi tokenizer + dictionary, cakupan lebih besar dari satu
  run; diprioritaskan setelah D & E1 lanjutan).
- **D lanjutan** (konten, 1 PR/level): migrasi format glosarium N4, N3, N2,
  N1 (dialog lepas), pakai keputusan format & pola script yang sama seperti
  N5 (lihat "Analisis D" di atas) — TAPI cek dulu apakah Zilsa sudah
  konfirmasi PR #14 sebelum lanjut (kalau ternyata keputusan format salah,
  perlu perbaiki N5 dulu, jangan lanjut ke level lain dengan asumsi yang
  sama). PR #14 masih terbuka tanpa komentar per akhir Day 5 — ini WAJAR,
  bukan berarti ditolak, tapi juga belum ada sinyal untuk lanjut. Juga
  perlu keputusan terpisah untuk silabus profesi 介護職員 (`046`/`047`,
  lesson_no lintas level dalam satu file — lihat "Sengaja di luar cakupan
  PR #14" di atas).
- **E1 lanjutan**: 2 dialog N5 pendek sisanya ("Menyapa Tetangga",
  "Perkenalan Diri", masing-masing 4→6 baris), lalu 7 dialog N4, 7 N3, 6 N2,
  7 N1 — semuanya di AUDIT.md §4 (query Supabase Day 5), semuanya TIDAK
  punya file migrasi sumber, harus lewat `INSERT ... ON CONFLICT DO UPDATE`
  seperti pola `054_extend_kaiwa_lepas_n5_short.sql`. N3–N1 butuh +6 baris
  per dialog (4→10) — lebih besar dari N5/N4, alokasikan waktu lebih untuk
  menjaga kealamian & level kesulitan saat giliran level itu tiba.
- **E2** (setelah E1): isi sel level×tema sampai minimal 6. Sel terendah
  saat ini: N4×biz (2), lalu beberapa sel bernilai 3 (lihat AUDIT.md §2).
- **E3**: profesi berikutnya setelah 介護職員 — urutan: (1) Produksi
  Makanan & Minuman, (2) Kaigo Kunjungan Rumah, (3) Kaigo Konselor
  Kehidupan, (4) Manufaktur, (5) Konstruksi, (6) Pertanian. Restoran
  di-skip (penerimaan ditutup sejak 13 Apr 2026).

## Catatan penting untuk run berikutnya

Repo ini juga dikerjakan oleh agen/sesi terjadwal lain di luar program
30-hari-kaiwa ini. Hari ini terlihat PR #6 (`fitur/loading-publik`, dari
sesi lain, memindahkan halaman publik ke grup route `(publik)` +
loading.tsx) — **bukan bagian program ini, tidak disentuh**. `master` dan
daftar PR terbuka bisa berubah signifikan antar-run karena sumber lain.
Selalu `git fetch` + `list_pull_requests` dulu sebelum menyimpulkan apa
yang sudah/belum ada.

Sandbox sesi ini tidak punya akses jaringan ke domain Netlify/Vercel
ataupun kredensial `.env.local` untuk `next dev` melawan data asli.
Verifikasi "deploy preview tanpa error" dan "cek produksi setelah merge"
untuk PR teknis apa pun harus mengandalkan status check GitHub (CI Actions +
status deployment Netlify/Vercel), bukan pengecekan isi halaman langsung.

**Update Day 5**: sandbox INI punya akses read-only ke Supabase produksi
lewat MCP tool (`mcp__Supabase__execute_sql` dkk, project_id
`vkdtjeogushskcgvazom`) — dipakai untuk mengonfirmasi isi 35 dialog pendek
di "Analisis E1" di atas. Ini tetap read-only (tidak ada `apply_migration`/
`execute_sql` tulis yang dipakai) — sesuai Aturan Keras #3, semua perubahan
data tetap lewat file migrasi di PR, menunggu Zilsa menjalankan
`npm run seed:kaiwa`. Registry `npm` juga bisa diakses (dicek untuk B
lanjutan, lihat di atas) — jaringan yang diblokir khusus domain
Netlify/Vercel, bukan seluruh jaringan keluar. Sesi berikutnya tidak perlu
mengasumsikan akses ini selalu tersedia (bisa berbeda per sesi sandbox);
cek ulang sebelum bergantung padanya.

## PR

- PR #2 (`[teknis] Day 1 — Audit data kaiwa + validator konten + CI`):
  **merged** ke master (`5ca031f`) pada 22–23 Sep 2026.
- PR #7 (`[teknis] Day 2 — C1: paksa dynamic rendering eksplisit di /kaiwa`):
  dibuka dan **di-merge** hari ini (`7356eff`). Gerbang lokal lulus:
  `tsc --noEmit` bersih, `npm run lint` bersih, `npm run build` sukses
  (`/kaiwa` tetap `ƒ` Dynamic), `npm run validate:kaiwa -- --base=origin/master`
  lulus (67 warning data lama, tidak ada error baru). Di level PR: `ci`
  GitHub Actions sukses, Netlify deploy-preview "ready", Vercel deployment
  sukses — auto-merge dilakukan berdasar gerbang ini (isi halaman tidak
  bisa dicek langsung dari sandbox, lihat batasan verifikasi di atas).
  **Cek pasca-merge**: `kaiwa-ci.yml` pada push ke `master` di commit
  `7356eff` juga sukses penuh (npm ci, lint, build, validate:kaiwa).
  Ditemukan juga bahwa run CI push sebelumnya di `master`
  (`e4fed74`, merge PR #3 "fitur/progress-latihan", bukan bagian program
  ini) **gagal** di step `npm run build` pukul 12:23 — tapi build yang
  sama persis kini sukses di commit setelahnya tanpa perubahan terkait,
  jadi kemungkinan flake CI, bukan regresi nyata. Tidak diambil tindakan
  karena bukan cakupan program kaiwa-30d dan sudah "sembuh sendiri" di
  commit berikutnya.
- PR #11 (`[teknis] Day 3 — C2: hitung stat "40+ Dialog" otomatis dari
  data`): dibuka dan **di-merge** hari ini (`762267f` → merge `51eac0f`).
  Gerbang lokal lulus (lihat "Analisis C2" di atas). Di level PR: `ci`
  GitHub Actions sukses, Vercel deployment sukses, **dua** deploy preview
  Netlify ("remarkable-rabanadas-91dc48" dan "kotonohalearnjapanese" —
  tampaknya dua project Netlify terhubung ke repo yang sama, keduanya
  perlu hijau) sama-sama "ready" — auto-merge dilakukan berdasar gerbang
  ini (isi halaman tidak bisa dicek langsung, `WebFetch` ke domain
  `*.netlify.app` diblokir kebijakan jaringan sandbox). **Cek pasca-merge**:
  workflow `Kaiwa CI` pada push ke `master` di commit `51eac0f` (merge
  PR #11) dipantau sampai selesai — **sukses penuh** (npm ci, lint, build,
  validate:kaiwa). Tidak ada revert yang diperlukan.
- PR #13 (`[teknis] Day 4 — C3: SEO title/description/canonical unik per
  level & tema di /kaiwa`): dibuka dan **di-merge** hari ini (2 komit:
  `8308480` C3, `9d41115` perbaikan validator format-glosarium yang
  dibundel — lihat "Analisis C3" di atas dan catatan "Perbaikan validator"
  di "Item selesai" → merge `725b423`). Gerbang lokal lulus (lihat di
  atas). Di level PR: `ci` sukses, dua deploy-preview Netlify "ready",
  Vercel "Ready" — auto-merge dilakukan berdasar gerbang ini. **Cek
  pasca-merge**: workflow `ci` pada push ke `master` di commit `725b423`
  dipantau sampai selesai — **sukses penuh**. Tidak ada revert diperlukan.
- PR #14 (`[konten-jepang] Day 4 — D: migrasi format glosarium kaiwa lepas
  N5`): dibuka Day 4, **masih BELUM di-merge** per akhir Day 5 (kategori
  konten, menunggu review Zilsa — termasuk konfirmasi keputusan format di
  "Analisis D" di atas sebelum dipakai untuk level lain). Dicek awal sesi
  Day 5: belum ada komentar/review manusia, hanya komentar bot deploy
  preview (Netlify x2 + Vercel, semua "ready"/"Ready"). Lihat "Analisis D"
  untuk detail.
- PR #16 (`[konten-jepang] Day 5 — E1: perpanjang 5 dialog lepas N5 di
  bawah ambang panjang`): dibuka Day 5, **masih belum di-merge** per akhir
  Day 6 (kategori konten, menunggu review Zilsa). Dicek awal sesi Day 6:
  belum ada komentar/review manusia, hanya komentar bot deploy preview.
- PR #18 (`[konten-jepang] Day 6 — E1: perpanjang 2 dialog lepas N5 sisa`):
  dibuka hari ini, **belum di-merge** (kategori konten, menunggu review
  Zilsa). Lihat item E1 Day 6 di atas. Pembukaan PR ini membuat total PR
  konten terbuka dari program ini jadi 3 (#14, #16, #18) — **rem darurat
  aktif mulai Day 7** (lihat catatan status di atas).
- Tidak ada PR migrasi-format (D) hari ini (Day 6): PR #14 (keputusan
  format D-N5) masih terbuka tanpa komentar/review dari Zilsa per
  pengecekan awal Day 6, jadi D untuk N4 sengaja belum dikerjakan — sama
  seperti alasan Day 5 (lihat "Analisis E1" dan "D lanjutan" di atas),
  menghindari menggandakan risiko kalau keputusan format ternyata perlu
  direvisi.
- Tidak ada PR teknis hari ini (Day 5) — semua item C sudah selesai
  (C1–C3, Day 2–4), item B lanjutan (tokenizer) terlalu besar untuk satu
  run tanpa risiko ketergesaan (lihat "Belum selesai / lanjutan"), jadi
  seluruh waktu dipakai untuk E1. Ini sesuai Aturan Keras #5 (batas PR,
  bukan wajib selalu ada PR teknis tiap run).
- PR lain di luar program ini: #1 (`claude/website-enhancement-plan-7qxgmb`,
  fitur Kana+SRS) sudah tidak muncul di daftar open sejak Day 3 (kemungkinan
  ditutup/di-merge di luar program ini, tidak diverifikasi lebih jauh —
  di luar cakupan). #6 (`fitur/loading-publik`, dari sesi lain, dibuka 23
  Sep 2026) masih open per pengecekan Day 5 — tidak disentuh.

## Antrean berikutnya (Day 7)

1. Mulai `git fetch origin master` + `list_pull_requests` dulu untuk
   menangkap perubahan dari sumber lain sejak Day 6, termasuk **cek status
   PR #14, #16, #18** (di-review/di-merge/ada komentar?) — terutama
   konfirmasi keputusan format kurung-tunggal di "Analisis D" sebelum
   lanjut migrasi level lain (D untuk N4). Kalau ketiganya masih terbuka
   tanpa komentar, itu wajar (bukan berarti ditolak) — tetap tidak boleh
   di-merge sendiri.
2. **Cek rem darurat dulu, sebelum kerjakan apa pun di antrean konten**:
   hitung ulang PR konten program ini yang masih *open* saat itu (bukan
   angka Day 6 ini). Kalau ≥3 masih terbuka → rem darurat aktif: JANGAN
   tambah konten baru hari itu (baik item baru E maupun migrasi format D).
   Kerjakan antrean teknis saja (kalau ada), lalu tulis di notifikasi
   bahwa sedang menunggu review. Kalau salah satu dari #14/#16/#18 sudah
   di-merge/ditutup sebelum Day 7 sehingga tersisa <3 terbuka, rem darurat
   tidak aktif — boleh lanjut ke poin 3–5 seperti biasa.
3. **C1 masih perlu dipantau**: perubahan Day 2 (`force-dynamic`) bersifat
   defensif, belum ada cara memverifikasi langsung dari sandbox bahwa
   `/kaiwa` vs `/kaiwa?level=N5` benar-benar sama sekarang. Kalau ada cara
   cek (mis. Zilsa konfirmasi di live site), catat di sini.
4. Kalau rem darurat TIDAK aktif dan keputusan format D (PR #14)
   terkonfirmasi benar oleh Zilsa: lanjut **D untuk N4** (dialog lepas,
   `049_seed_kaiwa_lepas_n4.sql` — pola sama seperti N5, script mekanis
   strip-kurung + tambah-titik-tengah). Kalau PR #14 belum ada
   komentar/konfirmasi, JANGAN lanjut D — sama seperti keputusan Day 5 &
   Day 6, hindari menggandakan risiko. Silabus profesi 介護職員
   (`046`/`047`) masih di luar cakupan D dialog-lepas — putuskan
   pendekatannya (migrasi lesson_no-range tersendiri, atau gabung ke E3).
5. Kalau rem darurat TIDAK aktif: **E1 sudah tuntas** (054+055 mencakup
   semua 7 dialog N5 pendek dari AUDIT.md §4) — lanjut **E1 untuk N4** (7
   dialog, lihat AUDIT §4/"Analisis E1" Day 5 untuk daftarnya), pakai pola
   migrasi `INSERT ... ON CONFLICT (level_id, title) DO UPDATE` yang sama
   seperti `054`/`055`. Cek dulu isi 7 dialog N4 itu lewat Supabase
   read-only (`mcp__Supabase__execute_sql`, project_id
   `vkdtjeogushskcgvazom`, kalau masih tersedia di sandbox) sebelum
   menulis migrasi, karena baris tambahan N4 butuh tata bahasa N4 (bukan
   N5) dan +baris lebih banyak per dialog (4→8, ambang N4 ≥8).
6. Ingat batas Aturan Keras #5: 1 PR teknis + 1 PR konten per run, plus
   maks 1 PR migrasi format tambahan selama Day 4–8 (jadi total maks 2 PR
   konten per run selama jendela itu: 1 migrasi-format D + 1 konten
   item-baru E) — TAPI lihat poin 2, rem darurat membatasi ini lebih jauh
   kalau berlaku.
