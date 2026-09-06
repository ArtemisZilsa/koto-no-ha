-- 045: Lapisan profesi untuk kaiwa — bidang SSW → profesi → silabus berurutan.
--
-- Sampai sekarang kaiwa hanya punya dua sumbu: level (N5–N1) dan category
-- (daily/work/hospital/biz/kaigo). Cukup untuk latihan lepas, tapi tidak bisa
-- menjawab "aku kerja di panti, mulai dari mana dan urutannya apa".
--
-- Migrasi ini menambah sumbu ketiga: PROFESI, dengan pelajaran bernomor yang
-- kesulitannya naik bertahap (level_id ikut naik mengikuti nomor pelajaran).
--
-- `sector_slug` sengaja text bebas, bukan FK — daftar bidang SSW tinggal di
-- kode (lib/data/sswSectors.ts) sebagai satu sumber kebenaran, dan dipakai juga
-- sebagai nilai kolom `vocab.field`. Menduplikasinya jadi tabel hanya membuat
-- dua sumber kebenaran yang bisa berselisih.
--
-- Idempoten: IF NOT EXISTS + ON CONFLICT DO NOTHING. Tidak menyentuh satu pun
-- baris kaiwa_stories yang sudah ada — job_slug NULL berarti "dialog lepas",
-- dan itu tetap tampil di penelusuran per-tema seperti sebelumnya.

-- ── Tabel profesi ────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS public.kaiwa_jobs (
  slug         text PRIMARY KEY,
  sector_slug  text NOT NULL,
  jp           text NOT NULL,
  label        text NOT NULL,
  summary      text,
  sort_order   integer NOT NULL DEFAULT 0,
  created_at   timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE  public.kaiwa_jobs         IS 'Profesi kaiwa; dikelompokkan per bidang SSW.';
COMMENT ON COLUMN public.kaiwa_jobs.slug        IS 'Segmen URL, mis. kaigo-shokuin.';
COMMENT ON COLUMN public.kaiwa_jobs.sector_slug IS 'Cocok dengan slug di lib/data/sswSectors.ts (juga nilai vocab.field).';
COMMENT ON COLUMN public.kaiwa_jobs.jp          IS 'Nama profesi dalam bahasa Jepang, mis. 介護職員.';
COMMENT ON COLUMN public.kaiwa_jobs.label       IS 'Nama profesi dalam bahasa Indonesia.';

CREATE INDEX IF NOT EXISTS idx_kaiwa_jobs_sector
  ON public.kaiwa_jobs (sector_slug, sort_order);

ALTER TABLE public.kaiwa_jobs ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "kaiwa_jobs_public_read" ON public.kaiwa_jobs;
CREATE POLICY "kaiwa_jobs_public_read" ON public.kaiwa_jobs FOR SELECT USING (true);

-- ── Silabus di kaiwa_stories ─────────────────────────────────────────────────

ALTER TABLE public.kaiwa_stories
  ADD COLUMN IF NOT EXISTS job_slug  text REFERENCES public.kaiwa_jobs(slug) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS lesson_no integer,
  ADD COLUMN IF NOT EXISTS goal      text;

COMMENT ON COLUMN public.kaiwa_stories.job_slug  IS 'Profesi pemilik pelajaran; NULL = dialog lepas (telusur per tema).';
COMMENT ON COLUMN public.kaiwa_stories.lesson_no IS 'Nomor urut dalam silabus profesi (第N課). Kesulitan naik seiring nomor.';
COMMENT ON COLUMN public.kaiwa_stories.goal      IS 'Satu kalimat: apa yang bisa dilakukan pelajar setelah pelajaran ini.';

-- Satu nomor pelajaran hanya boleh dipakai sekali per profesi. Partial index,
-- supaya 41 dialog lepas yang sudah ada (job_slug NULL) tidak ikut terkena.
CREATE UNIQUE INDEX IF NOT EXISTS uniq_kaiwa_job_lesson
  ON public.kaiwa_stories (job_slug, lesson_no)
  WHERE job_slug IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_kaiwa_stories_job
  ON public.kaiwa_stories (job_slug, lesson_no)
  WHERE job_slug IS NOT NULL;

-- ── Seed profesi bidang Kaigo ────────────────────────────────────────────────
-- Kaigo dulu: satu-satunya bidang berstatus 'active' di sswSectors.ts, sudah
-- punya 300 senmon yougo di /ssw, dan jalur SSW paling ramai untuk orang
-- Indonesia. Profesi lain menyusul setelah format ini terbukti.

INSERT INTO public.kaiwa_jobs (slug, sector_slug, jp, label, summary, sort_order) VALUES
  ('kaigo-shokuin', 'kaigo', '介護職員', 'Staf Perawatan Lansia',
   'Kerja harian di panti (tokuyou/rouken): sapaan, bantu makan, mandi, toilet, pindah posisi, catat kondisi, dan lapor ke perawat.', 1),
  ('houmon-kaigo',  'kaigo', '訪問介護員', 'Perawat Kunjungan Rumah',
   'Merawat di rumah pengguna: masuk rumah orang, batas tugas yang boleh dikerjakan, dan komunikasi dengan keluarga.', 2),
  ('kaigo-soudan',  'kaigo', '生活相談員', 'Konselor Kehidupan',
   'Penghubung panti dengan keluarga dan care manager: penerimaan, penjelasan layanan, dan penanganan keluhan.', 3)
ON CONFLICT (slug) DO NOTHING;
