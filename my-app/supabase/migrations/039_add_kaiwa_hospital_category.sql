-- 039: Tambah kategori kaiwa baru 'hospital' (Rumah Sakit).
-- CATATAN: nilai enum baru TIDAK boleh dipakai di transaksi yang sama dengan
-- ALTER TYPE ... ADD VALUE, jadi seed yang memakainya ada di migrasi 040 terpisah.

ALTER TYPE kaiwa_cat_enum ADD VALUE IF NOT EXISTS 'hospital';
