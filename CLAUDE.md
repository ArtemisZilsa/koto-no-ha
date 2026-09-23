# Koto no Ha — Project Checklist

Platform belajar bahasa Jepang untuk orang Indonesia.
Next.js app di `my-app/` · Live: https://kotonohalearnjapanese.netlify.app/

---

## Aturan Kerja — Auto-push

- Setiap pekerjaan yang selesai **langsung di-commit dan di-push**, tanpa perlu diminta.
- Sebelum commit: `tsc --noEmit` (strict) dan `npm run build` harus lulus. Kalau gagal, perbaiki dulu. Jangan push kode rusak.
- Perubahan kecil/fix/konten: commit ke `master` lalu push (Netlify auto-deploy).
- Fitur baru yang ditandai **PR terpisah** (contoh: perubahan skema database, fitur baru besar di Fase 9):
  push ke branch `fitur/<nama>` lalu buka PR. **Jangan merge atau auto-merge**, karena user yang mereview.
- Hanya stage file yang memang diubah di sesi itu. Jangan `git add -A`, dan jangan ikutkan file lokal user seperti `deploy.bat`.
- Setelah push, laporkan ke user: hash commit, branch/PR, dan daftar perubahan per file dalam bahasa sederhana.

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

## Fase 8 — Kaiwa Lepas (Telusur per Tema)

Dialog `job_slug IS NULL`, muncul di `/kaiwa?level=&theme=`. Terpisah dari
silabus profesi Fase 7 supaya urutan pelajaran tidak tercampur.

- [x] 80 dialog baru, 16 per level N5–N1 (migrasi 048–052). Total lepas: 41 → 121
- [x] Sebaran kategori per level: daily 5, work 3, hospital 3, biz 2, kaigo 3
- [x] Panjang: 12–13 baris, 54–163 kata Jepang per dialog (ambang minimal 50 kata)
- [x] Lubang terbesar tertutup: kategori `hospital` naik dari 1 → 16 dialog
- [x] `seed-kaiwa-lessons.mts` kini membaca daftar kolom dari SQL-nya sendiri,
      jadi satu skrip melayani seed silabus (9 kolom) dan seed lepas (6 kolom);
      validasi ambang 50 kata dihitung dari romaji
- [ ] Audio 1.037 baris lepas (butuh `ELEVENLABS_API_KEY`, lalu `npm run audio`)

---

## Fase 9 — Fitur Soal Latihan (adaptasi dari LMS Japany)

Fokus: produksi soal latihan N5–N3 terstruktur (target 8.000 kosakata, 400 tata bahasa,
560 kanji; sampai ~19 Jan 2027). Keenam fitur di bawah dipilih karena langsung menopang
soal latihan itu. Elemen B2B atau korporat milik Japany tidak diambil.

**Brand system (wajib untuk semua fitur Fase 9):** crimson `#B3122E`, off-white `#FAFAFA`,
hitam `#111111` saja. Noto Serif JP untuk teks Jepang. Tanpa emoji, gradient, drop-shadow.
Whitespace lega. (Pengecualian: hijau/merah untuk feedback benar/salah di kuis.)

**Reuse dulu sebelum membuat yang baru.** Sudah ada: `/quiz` (kuis kanji), `app/(dashboard)/dashboard`,
XP/streak via `user_item_progress` + RPC `mark_item_known` / `award_quiz_xp`. Perluas yang ada,
jangan buat route atau skema duplikat. Aturan "jangan ubah struktur route" tetap berlaku.

Urutan eksekusi:

- [ ] **#2 Progress tracking per kategori** (PR terpisah, ada perubahan skema). Tabel jawaban soal
      (user_id, question_id, kategori kosakata/tata_bahasa/kanji, level N5–N3, benar/salah, timestamp) + RLS.
      Fungsi agregasi % per kategori per level (mis. "Kosakata N4: 62% dari 1200 soal"). Progress bar
      crimson di dashboard, update langsung setelah satu set selesai.
- [ ] **#3 UX kuis/drill reusable**. Komponen menerima array soal (pertanyaan, 4 opsi, jawaban benar),
      satu soal per layar, "Soal 3/30", tombol "Berikutnya" muncul setelah menjawab. Feedback inline
      hijau/merah tanpa modal. Timer per soal = toggle, **default OFF**. Layar ringkasan (jumlah benar,
      kategori lemah, ulangi/lanjut). Setiap jawaban dicatat ke tabel #2.
      Format set: 30 soal kosakata, 10 tata bahasa, 20 kanji.
- [ ] **#1 Tes penempatan `/tes-level`** (PR terpisah). 15–20 soal campuran, kesulitan naik N5→N3.
      Skor dipetakan ke rekomendasi N5/N4/N3, lalu user diarahkan ke set latihan yang sesuai.
      Hasil (level, skor, tanggal) disimpan per user_id.
- [ ] **#5 Katalog `/latihan`**. Grid kartu per set (judul, kategori, level, jumlah soal, progress %).
      Filter kategori + level bisa digabung. Pagination/lazy load. Set yang 100% ditandai halus
      lewat warna border/teks, tanpa badge.
- [ ] **#4 Goal-setting di dashboard**. Perluas `/dashboard` yang sudah ada: target level (N5–N2) +
      fokus (kosakata/tata bahasa/idiom/kaiwa), disimpan per user. Blok "Rekomendasi untukmu" menampilkan
      set yang belum dikerjakan sesuai goal. Pre-fill target level dari hasil #1.
- [ ] **#6 Statistik personal**. Widget dashboard: total soal dikerjakan, streak harian, kategori dengan
      akurasi tertinggi/terendah. Reuse data #2, tanpa skema baru. Tampilkan angka besar + label kecil,
      tanpa grafik. Streak reset kalau satu hari kalender penuh tanpa soal. **Tanpa leaderboard.**

**DITUNDA (jangan dikerjakan):** leaderboard/ranking antar-user, katalog per-industri gaya
Tokutei Ginou (B2B), paywall/gating berbayar, switcher bahasa UI multi-negara.

---

## Catatan Teknis

- Build: `cd my-app && npm run build`
- TypeScript strict — pastikan tidak ada error sebelum commit
- Jangan ubah struktur route yang sudah ada
- Konten data ada di Supabase (bukan file JSON lokal)
- Deploy via Netlify (push ke main → auto deploy)
