# Dokkai — Tambahan 10 Bacaan per Level + Pembersihan Navbar

Tanggal: 2026-06-21
Branch: `feat-dokkai-extra`

## Tujuan

1. **Navbar dashboard**: hapus link `Dokkai` di bilah atas; sisakan `Dashboard` + link
   level (N5–SSW). Halaman `/dokkai` tetap ada & diakses lewat kartu "Latihan Membaca"
   di dashboard.
2. **Konten dokkai**: tambah **10 bacaan baru per level (N5–N1) = 50 bacaan**, jauh lebih
   panjang dari yang lama, lengkap dengan bank kosakata + soal pemahaman.

## Bagian 1 — Navbar

File: `app/(dashboard)/layout.tsx`. Hapus elemen `<Link href="/dokkai">Dokkai</Link>`
(beserta barisnya). Tidak ada perubahan lain.

## Bagian 2 — Model & lokasi konten

- Tabel Supabase `dokkai_passages` (sama seperti konten lama).
- Kolom JSON:
  - `content_json`: `[{ jp, furigana, romaji, id }]` — `furigana` = bacaan hiragana
    penuh kalimat; `id` = terjemahan Bahasa Indonesia.
  - `vocab_notes`: `[{ word, reading, romaji, meaning }]`
  - `questions`: `[{ q, options[4], answer (index 0-based), explanation }]`
- `level_id`: 1=N5 … 5=N1. `order_index` baru = **6–15** (lama 1–5 tidak diutak-atik).
- **5 migration baru**, hanya `INSERT` (tanpa `DELETE`, beda dari file 025–029):
  - `030_seed_dokkai_n5_extra.sql`
  - `031_seed_dokkai_n4_extra.sql`
  - `032_seed_dokkai_n3_extra.sql`
  - `033_seed_dokkai_n2_extra.sql`
  - `034_seed_dokkai_n1_extra.sql`
- Tiap migration di-apply ke DB live via Supabase MCP lalu diverifikasi (JSON valid +
  jumlah baris bertambah 10).

## Bagian 3 — Panjang per level

Satuan = **huruf/字** (konvensi file lama; "kata" Jepang tak berspasi). Skala naik per level:

| Level | Panjang teks | Kalimat |
|-------|--------------|---------|
| N5    | ~200–300 字  | 10–14   |
| N4    | ~300–400 字  | 12–16   |
| N3    | ~400–500 字  | 14–18   |
| N2    | ~500–600 字  | 16–20   |
| N1    | ~600–800 字  | 18–24   |

## Bagian 4 — Isi tiap bacaan

- `content_json` per kalimat (jp + furigana + romaji + terjemahan ID).
- **~15 kosakata** di `vocab_notes`.
- **6 soal** pilihan ganda di `questions`, tiap soal ada `explanation`.
- Bahasa & nada disesuaikan tingkat: N5 sopan `~ます/です`, naik ke N1 ragam tulis/abstrak.

### Tema baru (10 per level, hindari tema lama)

- **N5**: Makanan kesukaan, Berbelanja, Cuaca, Hewan peliharaan, Di kelas, Kamarku,
  Ulang tahun, Sarapan, Teman, Libur musim panas.
- **N4**: Naik kereta, Konbini, Festival (matsuri), Pindah rumah, Mencoba memasak,
  Lomba olahraga, Saat tersesat, Telepon genggam, Persiapan musim dingin, Sukarela.
- **N3**: Pola hidup sehat, Mengatur waktu, Etika Jepang, Mengelola uang, Hidup mandiri,
  Kesiapsiagaan bencana, Desa vs kota, Kerja dari rumah, Budaya kuliner, Olahraga rutin.
- **N2**: Overtourism, Masyarakat nontunai, Pemanasan global, Penurunan kelahiran,
  Kesehatan mental, Energi terbarukan, Berita palsu, Keamanan pangan, Pekerja asing,
  Sampah plastik.
- **N1**: Etika rekayasa genetika, Kebebasan berekspresi, Urbanisasi & kesepian,
  Pewarisan budaya, Masyarakat kesenjangan, Pembangunan berkelanjutan,
  Memori & identitas, Media & opini publik, Perubahan pandangan kerja, Bioetika.

## Bagian 5 — Urutan kerja

Navbar → N5 → N4 → N3 → N2 → N1 (jalan terus semua, tanpa checkpoint). Tiap level:
tulis migration, apply via MCP, verifikasi. Commit per langkah. Akhirnya perbarui memory.

## Verifikasi

- `dokkai_passages` tiap level berisi 15 baris (5 lama + 10 baru).
- Tiap baris: `content_json`, `vocab_notes`, `questions` JSON valid; `answer` 0–3.
- `npm run build` / typecheck lolos (navbar edit).
- Cek visual halaman `/dokkai?level=...` & satu `/dokkai/[id]`.
