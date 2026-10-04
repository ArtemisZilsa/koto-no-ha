-- 060: Bank soal berbayar (khusus pelanggan video) + jawaban + laporan soal.
--
-- Bergantung pada 059 (entitlements, has_entitlement, is_admin).
-- Keamanan ada di RLS, bukan di halaman: tanpa entitlement 'video-bulanan' yang aktif,
-- SELECT dari klien mengembalikan 0 baris. anon tidak punya GRANT sama sekali.
-- Isi soal lewat migrasi seed (061, dibuat tools/import-bank-soal.py), bukan dari klien.
--
-- Idempoten: aman dijalankan ulang.

-- ─── 1. bank_soal ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.bank_soal (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  code             text NOT NULL UNIQUE,              -- ID dari Excel: G5-001-01, K5-0001
  level            text NOT NULL CHECK (level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  category         text NOT NULL CHECK (category IN ('tata_bahasa', 'kanji')),
  qtype            text NOT NULL,                     -- Pilih bentuk, Susun ★, Arti/konteks, Arti, Bacaan
  unit             smallint NOT NULL,                 -- tata bahasa: batch video; kanji: tema 1–10
  group_code       text NOT NULL,                     -- tata bahasa: ID pola (P001); kanji: T01
  group_label      text NOT NULL,                     -- nama pola / nama tema
  mode             text NOT NULL CHECK (mode IN ('latihan', 'checkpoint', 'cadangan')),
  checkpoint       text,                              -- CP1, CP2, …
  question         text NOT NULL,
  options          jsonb NOT NULL CHECK (jsonb_typeof(options) = 'array' AND jsonb_array_length(options) = 4),
  answer_index     smallint NOT NULL CHECK (answer_index BETWEEN 0 AND 3),
  explanation      text,
  distractor_basis text,
  review_status    text NOT NULL DEFAULT 'belum' CHECK (review_status IN ('belum', 'ok', 'revisi')),
  order_index      integer NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS bank_soal_unit ON public.bank_soal (level, category, mode, unit, order_index);

ALTER TABLE public.bank_soal ENABLE ROW LEVEL SECURITY;

-- (select ...) → dievaluasi sekali per query, bukan per baris.
DROP POLICY IF EXISTS "Bank soal hanya untuk pelanggan" ON public.bank_soal;
CREATE POLICY "Bank soal hanya untuk pelanggan" ON public.bank_soal
  FOR SELECT TO authenticated
  USING ((select public.has_entitlement('video-bulanan')) OR (select public.is_admin()));

REVOKE ALL ON public.bank_soal FROM PUBLIC, anon, authenticated;
GRANT SELECT ON public.bank_soal TO authenticated;

-- ─── 2. user_bank_answers (progres) ──────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.user_bank_answers (
  id          bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id     uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  soal_id     uuid NOT NULL REFERENCES public.bank_soal(id) ON DELETE CASCADE,
  is_correct  boolean NOT NULL,
  answered_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS user_bank_answers_user ON public.user_bank_answers (user_id, soal_id);

ALTER TABLE public.user_bank_answers ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "User membaca jawaban sendiri" ON public.user_bank_answers;
CREATE POLICY "User membaca jawaban sendiri" ON public.user_bank_answers
  FOR SELECT TO authenticated USING ((select auth.uid()) = user_id);
DROP POLICY IF EXISTS "User mencatat jawaban sendiri" ON public.user_bank_answers;
CREATE POLICY "User mencatat jawaban sendiri" ON public.user_bank_answers
  FOR INSERT TO authenticated WITH CHECK ((select auth.uid()) = user_id);

REVOKE ALL ON public.user_bank_answers FROM PUBLIC, anon, authenticated;
GRANT SELECT, INSERT ON public.user_bank_answers TO authenticated;

-- ─── 3. bank_soal_reports (tombol "Laporkan soal", fase Beta) ────────────────
-- User hanya bisa menulis laporannya sendiri; dibaca admin lewat SQL / service role.
CREATE TABLE IF NOT EXISTS public.bank_soal_reports (
  id         bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id    uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  soal_id    uuid NOT NULL REFERENCES public.bank_soal(id) ON DELETE CASCADE,
  note       text CHECK (char_length(note) <= 500),
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.bank_soal_reports ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Pelanggan melaporkan soal" ON public.bank_soal_reports;
CREATE POLICY "Pelanggan melaporkan soal" ON public.bank_soal_reports
  FOR INSERT TO authenticated
  WITH CHECK ((select auth.uid()) = user_id AND (select public.has_entitlement('video-bulanan')));

REVOKE ALL ON public.bank_soal_reports FROM PUBLIC, anon, authenticated;
GRANT INSERT ON public.bank_soal_reports TO authenticated;

-- ─── 4. Progres per grup (menu /bank-soal) ───────────────────────────────────
-- SECURITY INVOKER: RLS bank_soal → non-pelanggan dapat 0 baris.
-- Soal cadangan tidak ditampilkan (stok Mixed Review / tes akhir).
CREATE OR REPLACE FUNCTION public.get_bank_progress()
RETURNS TABLE (category text, mode text, unit int, checkpoint text, group_code text,
               group_label text, total int, mastered int)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = ''
AS $$
  WITH ok AS (
    SELECT DISTINCT a.soal_id
      FROM public.user_bank_answers a
     WHERE a.user_id = (select auth.uid()) AND a.is_correct
  )
  SELECT s.category, s.mode, s.unit::int, s.checkpoint, s.group_code, s.group_label,
         COUNT(*)::int, COUNT(ok.soal_id)::int
    FROM public.bank_soal s
    LEFT JOIN ok ON ok.soal_id = s.id
   WHERE s.mode <> 'cadangan'
   GROUP BY s.category, s.mode, s.unit, s.checkpoint, s.group_code, s.group_label;
$$;

REVOKE EXECUTE ON FUNCTION public.get_bank_progress() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_bank_progress() TO authenticated;
