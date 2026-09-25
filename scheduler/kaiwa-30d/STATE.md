# State — Program 30 Hari Kaiwa

- `start_date`: 2026-09-22 (JST)
- Hari ini: **Day 4 / 30**
- Rem darurat: **tidak aktif** (1 PR konten terbuka dari program ini — PR #14, di bawah ambang 3)

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

## Belum selesai / lanjutan

- **B lanjutan**: cek (2) hiragana↔kanji dan (3) romaji-dari-skrip — butuh
  tokenizer morfologis (kuromoji atau setara), karena partikel は/へ/を
  tidak bisa dikonversi benar dari pemetaan karakter polos. Lihat komentar
  di `tools/validate-kaiwa.mts`.
- **D lanjutan** (Day 5–8, konten, 1 PR/level): migrasi format glosarium
  N4, N3, N2, N1 (dialog lepas), pakai keputusan format & pola script yang
  sama seperti N5 (lihat "Analisis D" di atas) — TAPI cek dulu apakah Zilsa
  sudah konfirmasi PR #14 sebelum lanjut (kalau ternyata keputusan format
  salah, perlu perbaiki N5 dulu, jangan lanjut ke level lain dengan asumsi
  yang sama). Juga perlu keputusan terpisah untuk silabus profesi
  介護職員 (`046`/`047`, lesson_no lintas level dalam satu file — lihat
  "Sengaja di luar cakupan PR #14" di atas).
- **E1** (mulai Day 4, belum dikerjakan — slot PR konten "item baru" hari
  ini tidak dipakai, seluruh waktu terpakai untuk D/N5 + keputusan format;
  bukan karena rem darurat, rem masih tidak aktif): perpanjang dialog di
  bawah ambang panjang. **Catatan
  penting**: 35 dari 41 dialog yang kependekan TIDAK punya file migrasi
  sumber di repo (disetor langsung ke Supabase sebelum migrasi 040) — harus
  ditulis sebagai migrasi baru (UPDATE by level_id+title atau
  INSERT ... ON CONFLICT DO UPDATE), bukan edit file yang tidak ada. Lihat
  AUDIT.md §4.
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
ataupun kredensial Supabase (`.env.local` tidak ada). Verifikasi "deploy
preview tanpa error" dan "cek produksi setelah merge" untuk PR teknis
apa pun harus mengandalkan status check GitHub (CI Actions + status
deployment Netlify/Vercel), bukan pengecekan isi halaman langsung.

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
  N5`): dibuka hari ini, **BELUM di-merge** (kategori konten, menunggu
  review Zilsa — termasuk konfirmasi keputusan format di "Analisis D" di
  atas sebelum dipakai untuk level lain). Lihat "Analisis D" untuk detail.
- PR lain di luar program ini: #1 (`claude/website-enhancement-plan-7qxgmb`,
  fitur Kana+SRS) sudah tidak muncul di daftar open sejak Day 3 (kemungkinan
  ditutup/di-merge di luar program ini, tidak diverifikasi lebih jauh —
  di luar cakupan). #6 (`fitur/loading-publik`, dari sesi lain, dibuka 23
  Sep 2026) masih open per pengecekan awal sesi Day 4 — tidak disentuh.

## Antrean berikutnya (Day 5)

1. Mulai `git fetch origin master` + `list_pull_requests` dulu untuk
   menangkap perubahan dari sumber lain sejak Day 4, termasuk **cek status
   PR #14** (di-review/di-merge/ada komentar?) — terutama konfirmasi
   keputusan format kurung-tunggal di "Analisis D" sebelum lanjut migrasi
   level lain. Kalau PR #14 masih terbuka tanpa komentar, itu wajar (bukan
   berarti ditolak) — tetap tidak boleh di-merge sendiri.
2. Cek rem darurat: kalau PR #14 (dan/atau PR konten baru lain dari program
   ini) yang terbuka sudah ≥3, hentikan penambahan konten baru hari itu,
   kerjakan antrean teknis saja, laporkan menunggu review di notifikasi.
3. **C1 masih perlu dipantau**: perubahan Day 2 (`force-dynamic`) bersifat
   defensif, belum ada cara memverifikasi langsung dari sandbox bahwa
   `/kaiwa` vs `/kaiwa?level=N5` benar-benar sama sekarang. Kalau ada cara
   cek (mis. Zilsa konfirmasi di live site), catat di sini.
4. Kalau keputusan format D terkonfirmasi benar: lanjut **D untuk N4**
   (dialog lepas, `049_seed_kaiwa_lepas_n4.sql` — pola sama seperti N5,
   script mekanis strip-kurung + tambah-titik-tengah). Silabus profesi
   介養職員 (`046`/`047`) masih di luar cakupan D dialog-lepas — putuskan
   pendekatannya (migrasi lesson_no-range tersendiri, atau gabung ke E3).
5. Kalau ada slot PR konten tersisa (belum terpakai untuk D): mulai **E1**
   — perpanjang dialog di bawah ambang panjang. Harus ditulis sebagai
   migrasi SQL **baru** (UPDATE by level_id+title, atau
   INSERT ... ON CONFLICT DO UPDATE) untuk 35 dari 41 dialog pendek yang
   TIDAK punya file migrasi sumber di repo — lihat AUDIT.md §4, jangan
   mengedit file yang tidak ada.
6. Ingat batas Aturan Keras #5: 1 PR teknis + 1 PR konten per run, plus
   maks 1 PR migrasi format tambahan selama Day 4–8 (jadi total maks 2 PR
   konten per run selama jendela itu: 1 migrasi-format D + 1 konten
   item-baru E).
