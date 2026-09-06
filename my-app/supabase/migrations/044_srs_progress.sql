-- ─── SRS: user_srs_progress ──────────────────────────────────────────────────
-- Progres SRS flashcard per user. Polymorphic ke vocab/kanji (mengikuti pola
-- user_item_progress), karena konten flashcard bersumber dari tabel vocab dan
-- kanji — bukan tabel `flashcards` lama.

CREATE TABLE public.user_srs_progress (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id          UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  item_type        TEXT NOT NULL CHECK (item_type IN ('vocab', 'kanji')),
  item_id          UUID NOT NULL,
  interval_days    INT NOT NULL DEFAULT 0,          -- 0 = kartu baru/lupa
  ease_factor      FLOAT NOT NULL DEFAULT 2.5,      -- SM-2 ease
  next_review_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  review_count     INT NOT NULL DEFAULT 0,
  lapse_count      INT NOT NULL DEFAULT 0,          -- berapa kali "Ulangi"
  last_reviewed_at TIMESTAMPTZ,
  UNIQUE (user_id, item_type, item_id)
);

-- Query utama: kartu jatuh tempo per user per tipe.
CREATE INDEX idx_user_srs_due
  ON public.user_srs_progress (user_id, item_type, next_review_at);

ALTER TABLE public.user_srs_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own srs progress"
  ON public.user_srs_progress FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own srs progress"
  ON public.user_srs_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own srs progress"
  ON public.user_srs_progress FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own srs progress"
  ON public.user_srs_progress FOR DELETE
  USING (auth.uid() = user_id);
