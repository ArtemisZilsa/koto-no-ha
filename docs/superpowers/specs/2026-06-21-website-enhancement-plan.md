# Rencana Peningkatan Website — Koto no Ha (言の葉)

**Tanggal:** 2026-06-21
**Proyek:** Koto no Ha — Next.js 16.2.6 / React 19, Tailwind v4, Supabase, Framer Motion
**Tujuan utama (dari pemilik):**
1. Estetika & keindahan website
2. Animasi menarik
3. Fitur lengkap dan isi yang berkualitas

> Catatan: akan ada iterasi di akhir, jadi rencana ini dieksekusi bertahap;
> prioritas pada hal yang bernilai tinggi dan aman.

## Audit ringkas (kondisi saat ini)

- **Stack rapi & matang:** App Router (Next 16, params async), design token washi/sumi-e
  (light/dark), Framer Motion, helper reduced-motion (`prefers-reduced-motion` + `html.no-anim`).
- **Halaman publik:** landing, `/kaiwa`, `/quiz`, `/ssw`, `/berita`. **Dashboard:** `/dashboard`,
  `/learn/[level]`, `/learn/bidang/[field]`, `/dokkai`, `/dokkai/[id]`.
- **Konten DB melimpah:** vocab 2012, kanji 967, grammar 384, kaiwa 35, dokkai 25.
- **Gap yang ditemukan:**
  - **Tidak ada materi Kana** (hiragana/katakana) — fondasi paling dasar untuk pemula justru hilang.
  - Dashboard menandai **SRS / Kartu Hafalan** dan **Progres Belajar** sebagai "Segera hadir".
    Skema `flashcards` & `user_flashcard_progress` sudah ada tapi kosong (spec SRS sudah disetujui).
  - Tidak ada halaman `not-found` / `error` kustom (default Next polos).
  - Belum ada `loading.tsx` (skeleton) untuk rute berat.

## Rencana fitur & peningkatan

### Tahap 1 — dikerjakan iterasi ini

1. **Halaman Kana (`/kana`)** — *Estetika + Animasi + Konten*
   - Hiragana & Katakana lengkap: gojūon (46), dakuten/handakuten, yōon.
   - Kartu **flip** interaktif (kana ⇄ romaji), filter baris, mode "sembunyikan romaji"
     untuk latihan mandiri, animasi masuk berurutan (stagger), hormati reduced-motion.
   - Pure data statis (tanpa DB) → langsung jalan. Link di navbar + kartu dashboard.

2. **SRS / Kartu Hafalan (`/srs`)** — *Fitur lengkap* (mengikuti spec 2026-06-18)
   - Seed ~250 kartu lintas N5–N1 (migrasi `030`), RPC `review_srs_card` (migrasi `031`).
   - Mode 2 tombol (Leitner), XP & streak masuk akun saat login, tetap bisa latihan tanpa login.
   - UI flip card + ringkasan akhir; link navbar + kartu dashboard (ganti "Segera hadir").

3. **Polish kualitas** — *Estetika + robust*
   - `app/not-found.tsx` (404 bergaya sumi-e) & `app/error.tsx` (boundary global).

4. **Halaman Progres Belajar (`/progress`)** ✅ — *Estetika + Animasi + Fitur*
   - RPC `get_progress_overview` (migrasi `032`): profil, mastery per level, ringkasan SRS,
     heatmap aktivitas dalam satu round-trip.
   - Ring XP + rank (入門→名人), streak, bar penguasaan per level, gauge SRS, heatmap aktivitas.
   - Mengaktifkan kartu dashboard "Progres Belajar" + link "Progres" di header dashboard.

### Tahap 2 — kandidat iterasi berikutnya

- **Audio (TTS) untuk kana/kaiwa/kosakata** via Web Speech API (`ja-JP`).
- **Kuis Kana** & mode "ketik romaji".
- **Loading skeleton** (`loading.tsx`) untuk dashboard/learn/dokkai.
- **Peta perjalanan belajar** (learning path) bergaya jalur sumi-e di dashboard.
- **PWA penuh** (offline cache materi inti) — manifest sudah ada.

## Konvensi yang dijaga

- Token tema (`var(--ink/--paper/--surface/--gold/--green/--red/--teal)`), font `font-serif`/`font-sans`.
- Komponen `Reveal`, `Icon` (Lucide-style inline), pola `QuizApp`/`QuizStart`/`QuizEndScreen`.
- Aksesibilitas: target ≥44px, `cursor-pointer`, fokus terlihat, semua animasi mati di reduced-motion.
- Tanpa `any`, `npx tsc --noEmit` & `npm run build` harus lolos.
