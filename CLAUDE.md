# Koto no Ha — Project Checklist

Platform belajar bahasa Jepang untuk orang Indonesia.
Next.js app di `my-app/` · Live: https://kotonohalearnjapanese.netlify.app/

---

## Fase 1 — Audit & Perbaikan UI (SELESAI)

- [x] Hapus stat palsu `12K+ Pengguna Aktif` dan `500+ Cerita Kaiwa` dari HeroSection
- [x] Ganti deskripsi Kaiwa di FeaturesGrid (hapus klaim "audio penutur asli")
- [x] Update Footer: link `#` → route nyata (`/tentang`, `/kebijakan-privasi`, `/kontak`)
- [x] Buat halaman `app/tentang/page.tsx`
- [x] Buat halaman `app/kebijakan-privasi/page.tsx`
- [x] Buat halaman `app/kontak/page.tsx`

---

## Fase 2 — Sosial & Komunitas

- [x] Tambahkan link Instagram (@kotobanoha) di navbar (desktop + mobile) dan footer
- [x] Tambahkan tombol "Bagikan ke WhatsApp" di halaman quiz hasil (setelah skor tampil)
- [x] Tambahkan Open Graph meta tags di layout.tsx untuk preview link yang bagus

---

## Fase 3 — Konten N3 (Vocab)

Status: 785/600 vocab N3 sudah ada di Supabase (target tercapai; kelompok F selesai 2 Jul 2026). Target akhir: 600+ kata eksklusif N3.

- [x] Tambah batch vocab N3 (kelompok A — Pekerjaan & Tempat Kerja, 80 kata)
- [x] Tambah batch vocab N3 (kelompok B — Kehidupan Sehari-hari, 80 kata)
- [x] Tambah batch vocab N3 (kelompok C — Perasaan & Ekspresi, 60 kata)
- [x] Tambah batch vocab N3 (kelompok D — Kesehatan & Kaigo, 80 kata)
- [x] Tambah batch vocab N3 (kelompok E — Berita/Media, 60 kata)
- [x] Tambah batch vocab N3 (kelompok F — Konjungsi, 40 kata)
- [x] Tambah sisa vocab N3 hingga total 600 kata (terverifikasi 2 Jul 2026: 785 kata di Supabase, target 600 terlampaui)

---

## Fase 4 — Grammar N2 & N1

Status: 150/150 grammar N2 (SELESAI — batch 4 final 30 pola, 4 Jul 2026), 150/150 grammar N1 (SELESAI — batch 5 final 20 pola, 7 Jul 2026; terverifikasi 150 pola unik di Supabase). Fase 4 SELESAI.

- [x] Tambah 150 pola grammar N2 (selesai 4 Jul 2026 — total 150 pola terverifikasi di Supabase)
- [x] Tambah 150 pola grammar N1 (selesai 7 Jul 2026 — batch 5 final 20 pola; total 150 pola unik terverifikasi di Supabase)

---

## Fase 5 — Fitur SRS Flashcard

- [x] Buat komponen FlashCard (depan: kanji/vocab, belakang: arti + contoh) (selesai 7 Jul 2026 — `components/flashcard/FlashCard.tsx`, flip 3D + helper `vocabToCard`/`kanjiToCard`; type-check strict lulus)
- [x] Integrasi dengan data Supabase (progress per user) (selesai 8 Jul 2026 — tabel `user_srs_progress` + RLS (migrasi 044), penjadwal SM-2 `lib/data/srs.ts`, query sesi `getFlashcardSession` di `lib/data/queries.ts`, server action `reviewFlashcard` di `app/actions/flashcard.ts`; type-check strict lulus)
- [x] Halaman `/flashcard/[level]` dengan tombol "Tahu" / "Ulangi" (selesai 9 Jul 2026 — `app/flashcard/[level]/page.tsx` + `components/flashcard/FlashcardSession.tsx`; dukung ?tipe=kanji, mode tamu, kartu "ulangi" kembali ke akhir antrean; build lulus. Fase 5 SELESAI)

---

## Fase 6 — Dokkai (Latihan Membaca)

Status: 75 bacaan (15 per level N5–N1, semua dengan content_json + soal) terverifikasi di Supabase, 9 Jul 2026. Fase 6 SELESAI (16 Jul 2026 — soal pemahaman terverifikasi di live site).

- [x] Buat halaman `/dokkai` dengan daftar teks bacaan per level (terverifikasi 9 Jul 2026 — sudah terimplementasi sebelumnya: `app/(dashboard)/dokkai/page.tsx` (pemilih level N5–N1 + daftar + paginasi) dan `app/(dashboard)/dokkai/[id]/page.tsx`; data 15 bacaan/level di Supabase (migrasi 024–034); type-check strict lulus)
- [x] Komponen reader dengan highlight vocab sesuai level user (terverifikasi 15 Jul 2026 — sudah terimplementasi penuh: `getDokkaiHighlightWords` di `lib/data/queries.ts` (level dari `profiles.current_level_id`, fallback level bacaan), filter kata di server di `dokkai/[id]/page.tsx`, sorot + tooltip + toggle "Sorot Kosakata" di `DokkaiReader.tsx`; `tsc --noEmit` strict lulus dan `next build` compile sukses)
- [x] Soal pemahaman bergaya JLPT setelah membaca (terverifikasi di live site 16 Jul 2026 — bagian "問題 · Soal Pemahaman" tampil di halaman detail dokkai (dicek N5 「自己紹介」 dan N1 「グローバル化と多文化共生」); interaksi diuji langsung: jawaban benar hijau + ikon bintang + penjelasan "Benar!", jawaban salah merah + jawaban benar disorot + penjelasan "Belum tepat", soal terkunci setelah dijawab. Tidak ada perubahan kode sesi ini. Fase 6 SELESAI)

---

---

## Fase 7 — Kaiwa per Profesi (Silabus Kerja)

Struktur terinspirasi worknihongo.jp (hierarki bidang → profesi → silabus berurutan),
tapi **semua dialog ditulis original** — tidak ada teks yang disalin dari sana.
Anchor bidang memakai 16 bidang SSW yang sudah ada di `lib/data/sswSectors.ts`,
bukan taksonomi industri Jepang milik situs itu.

- [x] Skema: tabel `kaiwa_jobs` + kolom `job_slug`/`lesson_no`/`goal` di `kaiwa_stories` (migrasi 045; RLS public read, partial unique index `(job_slug, lesson_no)`)
- [x] Rute baru `/kaiwa/kerja` (hub bidang→profesi), `/kaiwa/kerja/[job]` (silabus), `/kaiwa/kerja/[job]/[lesson]` (pelajaran) — rute `/kaiwa` lama tidak diubah, hanya ditambah tautan masuk
- [x] Profesi pilot **介護職員 / Staf Perawatan Lansia**: 20 pelajaran berurutan, 322 baris dialog, 80 kosakata (migrasi 046–047). Kesulitan naik: 1–7 N5, 8–13 N4, 14–20 N3
- [x] `getKaiwaByLevel` difilter `job_slug IS NULL` — telusur per tema tetap berisi 41 dialog lepas, tidak tercampur silabus
- [x] Pemuat seed `npm run seed:kaiwa -- --file <migrasi> [--dry-run]` (`tools/seed-kaiwa-lessons.mts`) — validasi kelima bidang tiap baris sebelum menulis
- [ ] Audio 322 baris (butuh `ELEVENLABS_API_KEY` di `.env.local`, lalu `npm run audio`) — tanpa ini kontrol shadowing tidak muncul di pelajaran baru
- [ ] Profesi Kaigo berikutnya: 訪問介護員, 生活相談員 (baris sudah ada di `kaiwa_jobs`, pelajaran masih kosong)
- [ ] Bidang SSW lain (外食業, 宿泊, 建設, dst) — belum ada profesi sama sekali

---

## Catatan Teknis

- Build: `cd my-app && npm run build`
- TypeScript strict — pastikan tidak ada error sebelum commit
- Jangan ubah struktur route yang sudah ada
- Konten data ada di Supabase (bukan file JSON lokal)
- Deploy via Netlify (push ke main → auto deploy)
