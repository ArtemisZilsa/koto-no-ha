# SRS / Kartu Hafalan — Design Spec

**Tanggal:** 2026-06-18
**Proyek:** Koto no Ha (言の葉) — Next.js 16.2.6 / React 19, Tailwind v4, Supabase
**Status:** Disetujui (rancangan), menunggu review spec → writing-plans

## Tujuan

Menambah fitur **SRS (Spaced Repetition System / kartu hafalan)** dengan **minimal 200 kartu**, plus "kolom" (menu/akses) SRS di situs. Tujuan: latihan hafalan kosakata & kanji yang terjadwal otomatis, sekaligus menambah XP & streak akun (konsisten dengan fitur Kuis & checklist).

## Keputusan user (terkonfirmasi)

1. **Isi kartu:** Semua level — kartu di-seed lintas N5–N1; user **pilih level & jenis saat belajar** (mirip Kuis).
2. **Mode review:** **Sederhana 2 tombol** (Belum hafal / Sudah hafal) — penjadwalan ala Leitner.
3. **XP & streak masuk akun** saat review (butuh login untuk simpan; tetap bisa latihan tanpa login).
4. **Penempatan menu:** link navbar + kaitkan kartu dashboard yang sudah ada (disetujui).
5. **Ukuran seed:** ~250 kartu (50/level: 30 vocab + 20 kanji) — memenuhi syarat ≥200.

## Temuan kunci (terverifikasi)

- **Skema SRS SUDAH ADA di DB namun KOSONG (0 baris):**
  - `flashcards`: `id, level_id, card_type (enum kanji|vocab|grammar), front, back, reading, example_sentence, audio_url`.
  - `user_flashcard_progress`: `id, user_id, flashcard_id, interval_days (default 1), ease_factor (default 2.5), next_review_at (default now()), review_count (default 0), last_reviewed_at`. RLS aktif.
- **Sumber kartu melimpah:** `vocab` 2012 baris, `kanji` 967 baris, lintas level (level_id 1=N5 … 5=N1). Bisa di-seed via `INSERT … SELECT`.
- **Slot UI dashboard sudah ada:** kartu "Kartu Hafalan Hari Ini" di `app/(dashboard)/dashboard/page.tsx` saat ini `href: '#'` → diarahkan ke `/srs`.
- **Pola yang dipakai ulang:** `NavClient.tsx` (2 array link desktop+mobile), `app/actions/quiz.ts` + RPC `award_quiz_xp` (cast manual karena `database.types.ts` hand-maintained), komponen kuis ber-Framer Motion, helper reduced-motion (`prefers-reduced-motion` + `html.no-anim`).
- **AGENTS.md:** "This is NOT the Next.js you know" — cek `node_modules/next/dist/docs/` sebelum membuat route/page baru.

## Arsitektur

### 1. Data / Seed — migrasi `024_seed_flashcards.sql`

`INSERT INTO flashcards (level_id, card_type, front, back, reading, example_sentence) SELECT …`:
- **Vocab:** dari `vocab`, `card_type='vocab'`, `front=word`, `back=meaning`, `reading=hiragana`, `example_sentence=example_sentence`. Batasi `row_number() OVER (PARTITION BY level_id ORDER BY order_index) <= 30` untuk level_id 1..5 → 150 kartu.
- **Kanji:** dari `kanji`, `card_type='kanji'`, `front=kanji`, `back=meaning`, `reading=hiragana`, `example_sentence=NULL` (atau elemen pertama jsonb `examples`). Batasi `row_number() <= 20` untuk level_id 1..5 → 100 kartu.
- Total **±250 kartu**. Idempotent: jalankan hanya bila `flashcards` kosong (guard `WHERE NOT EXISTS (SELECT 1 FROM flashcards)`), agar aman dijalankan ulang.

### 2. Logika review — RPC `review_srs_card` (migrasi `025_review_srs_card.sql`)

`review_srs_card(p_card_id uuid, p_known boolean) RETURNS json`, `SECURITY DEFINER`:
- Cek `auth.uid()`; bila null → tak ada (RLS / dipanggil hanya saat login).
- Hitung interval baru (Leitner ladder): `[1, 3, 7, 16, 35, 90]` hari.
  - **Sudah hafal (`p_known=true`):** ambil interval berikutnya pada tangga (berdasarkan interval saat ini), `review_count++`.
  - **Belum hafal (`p_known=false`):** `interval_days = 1`.
- `next_review_at = now() + interval_days`, `last_reviewed_at = now()`.
- **Upsert** ke `user_flashcard_progress` (unik per `(user_id, flashcard_id)` — tambahkan unique index bila belum ada).
- Bila `p_known=true`: tambah XP (mis. **+2 XP/kartu**) ke `profiles.total_xp` + update streak (logika harian sama `award_quiz_xp`/`mark_item_known`: hari sama no-op, kemarin +1, gap reset 1, set `last_active_date`).
- Return `{ next_review_at, interval_days, total_xp, streak_days }`.
- Anti-cheat: hanya untuk uid pemanggil; XP tetap (server-side).

> Catatan: `ease_factor` tetap default (tak dipakai di mode sederhana, dipertahankan agar skema utuh & bisa di-upgrade ke SM-2 penuh nanti).

### 3. Query / Server actions

- `getSrsSession(level, type, size=20)` di `lib/data/queries.ts`:
  - **Login:** utamakan kartu **due** (`user_flashcard_progress.next_review_at <= now()` join `flashcards` filter level/type), lalu isi dengan kartu **baru** (belum ada progress) hingga `size`. Acak urutan.
  - **Anon/publik:** ambil kartu acak sesuai level/type (jendela acak `range`, pola `getQuizPool`). Latihan tanpa simpan.
  - `level: JLPTLevel | 'random'` di-resolve di server action/orchestrator (pola QuizApp); `type: 'kanji' | 'vocab' | 'all'`.
- `app/actions/srs.ts`:
  - `loadSrsSession(level, type)` → `SrsCard[]`.
  - `reviewCard(cardId, known)` → `ReviewResult { saved, nextReviewAt?, totalXp?, streakDays? }` (cast manual `.rpc`, pola `quiz.ts`). Bila anon → `{ saved: false }`.

### 4. UI `/srs` (publik; jalan tanpa login)

Route `app/srs/page.tsx` (server component, Nav+Footer, fetch user). Komponen di `components/srs/`:
- `SrsStart.tsx` — pilih **level** (N5–N1 + "Acak") + **jenis** (Kanji / Kosakata / Semua) → tombol "Mulai Review". Mengikuti pola `QuizStart`.
- `SrsApp.tsx` (`'use client'`) — orkestrasi fase `start | review | done`; panggil `loadSrsSession`, validasi pool, kelola indeks kartu & ringkasan.
- `SrsCard.tsx` — kartu **flip** (depan: `front` + petunjuk ketuk; balik: `back` + `reading` + `example_sentence`). Setelah dibalik tampil 2 tombol **Belum hafal** / **Sudah hafal** → panggil `reviewCard`, lanjut kartu berikutnya. Progress bar sesi (x/N).
- `SrsEndScreen.tsx` — ringkasan: jumlah **hafal/total**, **XP didapat** (count-up), info due berikutnya; tombol **Ulang** & **Ganti Level**; link "Ke Dashboard". Bila anon → ajakan login untuk simpan progres.
- **A11y / animasi:** Framer Motion; hormati `prefers-reduced-motion` + `html.no-anim`; tombol ≥44px; `cursor-pointer`; warna pakai token tema (`var(--ink/--surface/--gold/--green/--red)`).

### 5. Penempatan ("kolom SRS")

- `NavClient.tsx`: tambah `{ href: '/srs', label: 'Hafalan' }` di **kedua** array (desktop + mobile).
- `app/(dashboard)/dashboard/page.tsx`: kartu "Kartu Hafalan Hari Ini" `href: '#'` → `/srs`; bila login tampilkan jumlah kartu **due** hari ini (opsional: `getDueCount()`).

## File baru / diubah

**Baru:**
- `my-app/supabase/migrations/024_seed_flashcards.sql`
- `my-app/supabase/migrations/025_review_srs_card.sql`
- `my-app/app/srs/page.tsx`
- `my-app/app/actions/srs.ts`
- `my-app/lib/data/srs.ts` (tipe `SrsCard`, `SrsType`, konstanta level/label, helper)
- `my-app/components/srs/{SrsStart,SrsApp,SrsCard,SrsEndScreen}.tsx`

**Diubah:**
- `my-app/lib/data/queries.ts` (`getSrsSession`, opsional `getDueCount`)
- `my-app/lib/types/database.types.ts` (tipe `Flashcard`, `UserFlashcardProgress` bila belum ada)
- `my-app/components/nav/NavClient.tsx` (link "Hafalan")
- `my-app/app/(dashboard)/dashboard/page.tsx` (href kartu hafalan → `/srs`)

## Verifikasi (end-to-end)

1. Seed: `SELECT count(*) FROM flashcards` ≥ 200, tersebar level_id 1..5, dua `card_type`.
2. `npx tsc --noEmit` bersih (strict, tanpa `any`); `npm run build` lolos (route `/srs` muncul).
3. `npm run dev` → `/srs`=200; pilih level/jenis → kartu flip → 2 tombol → end-screen.
4. Login → review beberapa kartu → cek `user_flashcard_progress` (interval/next_review naik; "belum hafal" reset 1) & `profiles.total_xp/streak_days` naik; hari sama tak gandakan streak.
5. Anon → review jalan tanpa error, end-screen tampil ajakan login (tak simpan).
6. Reduced-motion / `html.no-anim` → animasi berat mati, fitur tetap jalan.
7. Nav "Hafalan" muncul (desktop+mobile); kartu dashboard menuju `/srs`.

## Catatan / YAGNI

- Tidak membuat tabel baru — skema `flashcards`/`user_flashcard_progress` yang ada sudah memadai.
- Mode SM-2 penuh (4 tombol + ease_factor) **tidak** diimplementasikan sekarang (user pilih 2 tombol); field `ease_factor` dipertahankan agar upgrade mudah.
- Tidak menambah kartu di homepage `FeaturesGrid` (tak diminta) — bisa menyusul.
- Brief path `/data` & `/app/srs` diselaraskan ke konvensi repo (`my-app/lib/data`, `my-app/app/srs`).
