-- 060: Bank soal berbayar (khusus pelanggan video).
--
-- Bergantung pada 059 (entitlements, has_entitlement, is_admin).
-- Keamanan ada di RLS, bukan di halaman: tanpa entitlement 'video-bulanan' yang aktif,
-- SELECT dari klien (anon key) mengembalikan 0 baris. anon tidak punya GRANT sama sekali.
-- Tidak ada tulisan dari klien; isi soal lewat migrasi seed / service role.
--
-- Idempoten: aman dijalankan ulang.

CREATE TABLE IF NOT EXISTS public.bank_soal (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  level         text NOT NULL CHECK (level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  section       text NOT NULL CHECK (section IN ('moji_goi', 'bunpou', 'dokkai', 'choukai')),
  question      text NOT NULL,
  passage       text,                                   -- teks bacaan dokkai (opsional)
  options       jsonb NOT NULL CHECK (jsonb_typeof(options) = 'array' AND jsonb_array_length(options) = 4),
  answer_index  smallint NOT NULL CHECK (answer_index BETWEEN 0 AND 3),
  explanation   text,                                   -- pembahasan (Bahasa Indonesia)
  order_index   integer NOT NULL DEFAULT 0,
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS bank_soal_level_section ON public.bank_soal (level, section, order_index);

ALTER TABLE public.bank_soal ENABLE ROW LEVEL SECURITY;

-- (select ...) → dievaluasi sekali per query, bukan per baris.
DROP POLICY IF EXISTS "Bank soal hanya untuk pelanggan" ON public.bank_soal;
CREATE POLICY "Bank soal hanya untuk pelanggan" ON public.bank_soal
  FOR SELECT TO authenticated
  USING ((select public.has_entitlement('video-bulanan')) OR (select public.is_admin()));

REVOKE ALL ON public.bank_soal FROM PUBLIC, anon, authenticated;
GRANT SELECT ON public.bank_soal TO authenticated;
