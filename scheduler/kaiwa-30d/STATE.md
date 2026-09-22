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

## Temuan blocking — perlu perhatian Zilsa (bukan bagian antrean 30 hari)

`npm run lint` gagal di `master` HEAD (5fe8e85) karena 8 error pre-existing
di 6 file yang tidak terkait kaiwa sama sekali (detail: AUDIT.md §8). Selama
ini belum diperbaiki, gerbang auto-merge teknis (Aturan Keras #2, butuh
"lint/typecheck lulus") **tidak akan pernah terpenuhi**, jadi PR teknis dari
program ini akan menunggu review manual, bukan auto-merge, sampai ini
dibereskan.

## PR

- Dibuka hari ini: 1 PR teknis (AUDIT.md, STATE.md, validator, CI workflow).
  Tidak di-auto-merge — lint gagal di baseline (lihat atas), jadi salah satu
  syarat auto-merge tidak terpenuhi hari ini.
- PR konten: tidak ada (Day 1 belum masuk antrean E).
- PR lama di luar program ini: #1 (`claude/website-enhancement-plan-7qxgmb`,
  dibuka 21 Jun 2026, fitur Kana+SRS) — bukan bagian program 30 hari, tidak
  disentuh.

## Antrean berikutnya (Day 2)

Lanjut ke **C1** (cache `/kaiwa` tanpa parameter) — baca dokumentasi Next.js
16 lokal dulu sebelum mengubah kode cache/revalidate.
