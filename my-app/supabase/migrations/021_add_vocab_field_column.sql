-- Tambah kolom `field` ke vocab agar satu level bisa punya beberapa sub-bidang.
-- Dipakai untuk track SSW (level_id = 6): field = 'kaigo', dst. NULL untuk N5..N1.
ALTER TABLE public.vocab ADD COLUMN IF NOT EXISTS field text;

CREATE INDEX IF NOT EXISTS idx_vocab_level_field_order
  ON public.vocab (level_id, field, order_index);
