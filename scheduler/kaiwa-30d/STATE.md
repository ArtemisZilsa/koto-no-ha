# State — Program 30 Hari Kaiwa

- `start_date`: 2026-09-22 (JST)
- Hari ini: **Day 2 / 30**
- Rem darurat: **tidak aktif** (0 PR konten terbuka dari program ini)

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

## Belum selesai / lanjutan

- **B lanjutan**: cek (2) hiragana↔kanji dan (3) romaji-dari-skrip — butuh
  tokenizer morfologis (kuromoji atau setara), karena partikel は/へ/を
  tidak bisa dikonversi benar dari pemetaan karakter polos. Lihat komentar
  di `tools/validate-kaiwa.mts`.
- **C2** (Day 3, teknis): angka statis "40+ dialog" di `HeroSection.tsx`
  dan `KaiwaPreview.tsx` — hitung otomatis dari data kaiwa.
- **C3** (Day 4–7, teknis): SEO halaman kaiwa — title/description/og:title/
  og:url/canonical unik per level dan tema (saat ini og:title dan og:url
  ikut default dari layout, sama dengan beranda).
- **D** (Day 4–8, konten, 1 PR/level): migrasi format glosarium ke standar
  `表記 (よみ · romaji) — arti`. AUDIT.md §5 sudah memetakan file mana yang
  perlu disentuh (67 entri, tersebar di 040, 046, 047, 048–052).
- **E1** (mulai Day 4): perpanjang dialog di bawah ambang panjang. **Catatan
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
- PR konten: tidak ada (belum masuk antrean E, mulai Day 4).
- PR lain di luar program ini: #1 (`claude/website-enhancement-plan-7qxgmb`,
  fitur Kana+SRS, dibuka 21 Jun 2026) dan #6 (`fitur/loading-publik`, dari
  sesi lain, dibuka 23 Sep 2026) — tidak disentuh.

## Antrean berikutnya (Day 3)

1. Mulai `git fetch origin master` + `list_pull_requests` dulu untuk
   menangkap perubahan dari sumber lain sejak Day 2.
2. Lanjut ke **C2** (angka statis "40+ dialog" → hitung otomatis dari data)
   di `HeroSection.tsx` dan `KaiwaPreview.tsx`.
