# Koto no Ha — Project Checklist

Platform belajar bahasa Jepang untuk orang Indonesia.
Next.js app di `my-app/` · Live: https://kotonohalearnjapanese.netlify.app/

---

## Fase 1 — Audit & Perbaikan UI (SELESAI)

- [x] Hapus stat palsu `12K+ Pengguna Aktif` dan `500+ Cerita Kaiwa` dari HeroSection
- [x] Ganti deskripsi Kaiwa di FeaturesGrid (hapus klaim "audio penutur asli")
- [x] Update Footer: link `#` → route nyata (`/tentang`, `/kebijakan-privasi`, `/kontak`)
- [x] Buat halaman `app/tentang/page.tsx`
- [x] Buat halaman `app/kebijakan-privasi/page.tsx`
- [x] Buat halaman `app/kontak/page.tsx`

---

## Fase 2 — Sosial & Komunitas

- [x] Tambahkan link Instagram (@kotobanoha) di navbar (desktop + mobile) dan footer
- [ ] Tambahkan tombol "Bagikan ke WhatsApp" di halaman quiz hasil (setelah skor tampil)
- [ ] Tambahkan Open Graph meta tags di layout.tsx untuk preview link yang bagus

---

## Fase 3 — Konten N3 (Vocab)

Status: 112/600 vocab N3 sudah ada. Target: 600 kata eksklusif N3.

- [ ] Tambah batch vocab N3 (kelompok A — Pekerjaan & Tempat Kerja, 80 kata)
- [ ] Tambah batch vocab N3 (kelompok B — Kehidupan Sehari-hari, 80 kata)
- [ ] Tambah batch vocab N3 (kelompok C — Perasaan & Ekspresi, 60 kata)
- [ ] Tambah batch vocab N3 (kelompok D — Kesehatan & Kaigo, 80 kata)
- [ ] Tambah batch vocab N3 (kelompok E — Berita/Media, 60 kata)
- [ ] Tambah batch vocab N3 (kelompok F — Konjungsi, 40 kata)
- [ ] Tambah sisa vocab N3 hingga total 600 kata

---

## Fase 4 — Grammar N2 & N1

Status: 0/150 grammar N2, 0/150 grammar N1.

- [ ] Tambah 150 pola grammar N2
- [ ] Tambah 150 pola grammar N1

---

## Fase 5 — Fitur SRS Flashcard

- [ ] Buat komponen FlashCard (depan: kanji/vocab, belakang: arti + contoh)
- [ ] Integrasi dengan data Supabase (progress per user)
- [ ] Halaman `/flashcard/[level]` dengan tombol "Tahu" / "Ulangi"

---

## Fase 6 — Dokkai (Latihan Membaca)

- [ ] Buat halaman `/dokkai` dengan daftar teks bacaan per level
- [ ] Komponen reader dengan highlight vocab sesuai level user
- [ ] Soal pemahaman bergaya JLPT setelah membaca

---

## Catatan Teknis

- Build: `cd my-app && npm run build`
- TypeScript strict — pastikan tidak ada error sebelum commit
- Jangan ubah struktur route yang sudah ada
- Konten data ada di Supabase (bukan file JSON lokal)
- Deploy via Netlify (push ke main → auto deploy)
