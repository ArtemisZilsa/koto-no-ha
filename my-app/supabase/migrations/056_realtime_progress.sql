-- ─── Realtime: progres latihan & XP/streak ──────────────────────────────────
-- Dashboard dan /latihan berlangganan perubahan dua tabel ini
-- (components/practice/ProgressLiveRefresh.tsx), jadi progress bar, XP, dan
-- streak ikut terbarui tanpa reload, termasuk dari tab/perangkat lain.
--   user_practice_answers -> INSERT tiap set soal selesai (progress bar)
--   profiles              -> UPDATE total_xp / streak_days (RPC mark_item_known,
--                            award_quiz_xp)
-- Keamanan: Postgres Changes menerapkan RLS SELECT milik pelanggan, dan kedua
-- tabel hanya mengizinkan user membaca barisnya sendiri (auth.uid()).
-- Klien hanya mendengarkan INSERT/UPDATE, bukan DELETE.

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime' AND schemaname = 'public' AND tablename = 'user_practice_answers'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.user_practice_answers;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime' AND schemaname = 'public' AND tablename = 'profiles'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.profiles;
  END IF;
END $$;
