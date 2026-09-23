-- ─── Fase 9 #2: user_practice_answers ────────────────────────────────────────
-- Log setiap jawaban soal latihan (drill /latihan). Satu baris = satu jawaban,
-- jadi riwayat utuh tetap ada untuk statistik (akurasi, streak) di fitur #6.
-- Soal bersumber dari tabel konten yang sudah ada, bukan tabel soal terpisah:
--   kosakata    -> vocab   (hanya field IS NULL; kosakata bidang SSW tidak dihitung)
--   tata_bahasa -> grammar
--   kanji       -> kanji
-- item_id = id baris di tabel sumber tersebut.

CREATE TABLE public.user_practice_answers (
  id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id     UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  category    TEXT NOT NULL CHECK (category IN ('kosakata', 'tata_bahasa', 'kanji')),
  level       TEXT NOT NULL CHECK (level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  item_id     UUID NOT NULL,
  is_correct  BOOLEAN NOT NULL,
  answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Agregasi progress per kategori/level.
CREATE INDEX idx_practice_answers_progress
  ON public.user_practice_answers (user_id, category, level, item_id);
-- Riwayat per hari (streak, statistik).
CREATE INDEX idx_practice_answers_time
  ON public.user_practice_answers (user_id, answered_at);

ALTER TABLE public.user_practice_answers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own practice answers"
  ON public.user_practice_answers FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own practice answers"
  ON public.user_practice_answers FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own practice answers"
  ON public.user_practice_answers FOR DELETE
  USING (auth.uid() = user_id);

-- ─── Agregasi progress ──────────────────────────────────────────────────────
-- Satu baris per (kategori, level). "mastered" = soal berbeda yang pernah
-- dijawab benar minimal sekali; "total" = jumlah soal yang tersedia saat ini.
-- SECURITY INVOKER: RLS di atas memastikan user hanya melihat jawabannya sendiri.
CREATE OR REPLACE FUNCTION public.get_practice_progress()
RETURNS TABLE (category TEXT, level TEXT, mastered INT, attempted INT, total INT)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = ''
AS $$
  WITH items AS (
    SELECT 'kosakata'::text AS category, l.code AS level, v.id AS item_id
      FROM public.vocab v JOIN public.levels l ON l.id = v.level_id
     WHERE v.field IS NULL
    UNION ALL
    SELECT 'tata_bahasa', l.code, g.id
      FROM public.grammar g JOIN public.levels l ON l.id = g.level_id
    UNION ALL
    SELECT 'kanji', l.code, k.id
      FROM public.kanji k JOIN public.levels l ON l.id = k.level_id
  ),
  per_item AS (
    SELECT a.category, a.item_id, bool_or(a.is_correct) AS ever_correct
      FROM public.user_practice_answers a
     WHERE a.user_id = auth.uid()
     GROUP BY a.category, a.item_id
  )
  SELECT i.category,
         i.level,
         COUNT(p.item_id) FILTER (WHERE p.ever_correct)::int AS mastered,
         COUNT(p.item_id)::int                               AS attempted,
         COUNT(*)::int                                       AS total
    FROM items i
    LEFT JOIN per_item p ON p.category = i.category AND p.item_id = i.item_id
   WHERE i.level IN ('N5', 'N4', 'N3', 'N2', 'N1')
   GROUP BY i.category, i.level;
$$;

REVOKE EXECUTE ON FUNCTION public.get_practice_progress() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_practice_progress() TO authenticated;
