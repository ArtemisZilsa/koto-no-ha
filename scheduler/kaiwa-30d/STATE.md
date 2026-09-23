# State — Program 30 Hari Kaiwa

- `start_date`: 2026-09-22 (JST)
- Hari ini: **Day 1 / 30**
- Rem darurat: **tidak aktif** (0 PR konten terbuka)

## Item selesai

- **A — Audit**: `scheduler/kaiwa-30d/AUDIT.md` ditulis. Data lepas hari ini
  identik dengan pengamatan 21 Sep 2026 (121 dialog: N5 29, N4/N3/N2/N1
  masing-masing 23) — tidak ada selisih.
- **B — Validator (sebagian)**: `npm run validate:kaiwa`
  (`my-app/tools/validate-kaiwa.mts`) + `.github/workflows/kaiwa-ci.yml`.
  Mengecek (1) field wajib, (4) format glosarium, (5) panjang minimal,
  (6) judul ganda, dari file migrasi di repo. Lama vs baru dibedakan lewat
  `git diff` terhadap `origin/master` (override: `--base=<ref>`).

## Belum selesai / lanjutan

- **B lanjutan (Day 2–3)**: cek (2) hiragana↔kanji dan (3) romaji-dari-skrip
  — butuh tokenizer morfologis (kuromoji atau setara), karena partikel
  は/へ/を tidak bisa dikonversi benar dari pemetaan karakter polos. Lihat
  komentar di `tools/validate-kaiwa.mts`.
- **C1–C3** (Day 2–7, teknis, satu per run): cache `/kaiwa` vs
  `/kaiwa?level=N5`, angka dialog otomatis di beranda, SEO/OG per level×tema.
  Detail temuan awal ada di AUDIT.md §7 — C1 perlu baca dulu
  `node_modules/next/dist/docs/` sebelum ubah kode cache (lihat AGENTS.md).
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

## Temuan blocking — resolusi

`npm run lint` gagal di `master` HEAD (5fe8e85) saat PR #2 dibuka, karena 8
error pre-existing di 6 file tak terkait kaiwa (detail: AUDIT.md §8).
**Sudah dibereskan** oleh proses lain di luar program ini — PR #4
(`claude/magical-galileo-ajl9m4`, commit `2b4720c` "Fix pre-existing lint
errors blocking auto-merge gate" + `b203794`) — merge ke `master` sebagai
`b5d7279` pada 23 Sep 2026. Gerbang auto-merge teknis kini bisa benar-benar
berfungsi.

**Catatan penting untuk run berikutnya**: repo ini juga dikerjakan oleh
agen/sesi terjadwal lain di luar program 30-hari-kaiwa ini (setidaknya satu
task perbaikan situs umum — lihat commit-commit non-kaiwa di riwayat
`master`, mis. perbaikan navbar, halaman 404, `/noir` noindex). `master`
bisa berubah signifikan antar-run karena sumber lain, bukan cuma dari
program ini. Selalu `git fetch`+baca ulang state sebelum menyimpulkan apa
yang sudah/belum ada.

## PR

- PR #2 (`[teknis] Day 1 — Audit data kaiwa + validator konten + CI`):
  dibuka 22 Sep, awalnya tertahan karena lint baseline gagal (lihat atas).
  Zilsa (atau otomasi lain) meng-update branch dengan merge `master`
  terbaru pada 23 Sep, yang membawa masuk fix lint dari PR #4. Setelah itu
  semua gerbang lulus (`ci` GitHub Actions: build+lint+validate:kaiwa
  sukses; deploy preview Netlify — kedua proyek — dan Vercel: ready/sukses)
  — **di-merge ke master** (`5ca031f`) hari ini. **Verifikasi produksi
  setelah merge tidak bisa dilakukan langsung** dari sesi ini (WebFetch ke
  domain Netlify diblokir kebijakan jaringan sandbox) — diandalkan pada: PR
  ini tidak menyentuh kode halaman sama sekali (murni audit/state/
  validator/CI), deploy preview commit yang sama sudah "ready" sebelum
  merge, dan `ci` tetap sukses pada push ke `master` setelahnya.
- PR konten: tidak ada (Day 1 belum masuk antrean E).
- PR lama di luar program ini: #1 (`claude/website-enhancement-plan-7qxgmb`,
  dibuka 21 Jun 2026, fitur Kana+SRS) — bukan bagian program 30 hari, tidak
  disentuh.

## Antrean berikutnya (Day 2)

Lanjut ke **C1** (cache `/kaiwa` tanpa parameter) — baca dokumentasi Next.js
16 lokal dulu sebelum mengubah kode cache/revalidate. Mulai dengan
`git fetch origin master` untuk menangkap perubahan dari sumber lain sejak
Day 1.
