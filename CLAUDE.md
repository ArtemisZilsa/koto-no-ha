# CLAUDE.md — Koto no Ha Website Development

Panduan permanen untuk Claude Code saat bekerja di project ini.
Baca file ini setiap kali memulai sesi baru sebelum mengerjakan task apapun.

---

## Tentang Project

**Nama:** Koto no Ha (言葉の葉)
**URL live:** https://kotonohalearnjapanese.netlify.app/
**Stack:** Next.js, deployed di Netlify
**Tujuan:** Platform belajar Bahasa Jepang online untuk pelajar Indonesia (N5–N1)

**Fitur yang sudah ada:**
- SRS kartu hafalan (spaced repetition)
- Kaiwa Stories — dialog percakapan per tema per level
- Dokkai — latihan membaca
- Quiz interaktif (Multiple Choice Kanji — sudah live)
- Progress tracking
- Berita NHK terintegrasi
- Halaman SSW/TG

**Brand voice:** Profesional, edukatif, tidak menggurui. Tidak ada elemen pixel/RPG/anime. Identitas: institusi belajar bahasa Jepang yang kredibel, dikelola dari Jepang langsung.

---

## Aturan Permanen — Wajib Diikuti Setiap Task

1. **Jangan ubah desain visual yang sudah ada** tanpa instruksi eksplisit. Warna dasar: background `#14141c`, accent gold `#FFD700`.
2. **Semua teks Bahasa Jepang wajib menyertakan**: kanji + furigana + romaji + terjemahan Indonesia. Tidak ada pengecualian.
3. **Mobile-first.** Semua fitur baru wajib responsive sebelum dianggap selesai.
4. **TypeScript strict mode** — tidak ada `any` type kecuali benar-benar tidak terhindarkan.
5. **Tidak menghapus fitur yang sudah live** kecuali diminta secara spesifik.
6. **Setelah selesai satu task, jalankan `npm run build`** untuk memastikan tidak ada error sebelum lanjut ke task berikutnya.
7. **Setiap klaim yang ditampilkan di UI (jumlah pengguna, jumlah cerita, dll) harus sesuai data nyata** — jangan biarkan angka placeholder tanpa menandainya sebagai TODO.

---

## Roadmap Development — Urutan Wajib

Kerjakan sesuai urutan ini. Jangan lompat ke fase berikutnya sebelum fase sebelumnya selesai dan sudah di-build tanpa error.

### FASE 1 — Trust & Kredibilitas Dasar
**Prioritas: Wajib pertama**

- [x] Audit semua klaim di homepage (jumlah pengguna, jumlah cerita kaiwa, fitur audio)
- [x] Hapus atau perbaiki klaim "audio penutur asli" di halaman Kaiwa — saat ini tidak ada audio player
- [x] Isi footer: halaman Tentang, Kebijakan Privasi, Kontak — saat ini semua link mengarah ke `#`
- [x] Update angka "12K+ Pengguna Aktif" dengan data asli atau hapus jika tidak ada datanya

**Definisi selesai:** Tidak ada klaim di UI yang tidak didukung fitur atau data nyata.

---

### FASE 2 — Integrasi Ekosistem
**Prioritas: Wajib kedua**

- [ ] Tambahkan link Instagram (@kotobanoha) di navbar dan footer
- [ ] Tambahkan section "Produk Belajar" di homepage yang menampilkan ebook "200 Idiom Bahasa Jepang" dengan link ke Gumroad
- [ ] Tambahkan tombol share ke WhatsApp di halaman Kaiwa dan Quiz
- [ ] Pastikan semua CTA mengarah konsisten — bukan campuran "Daftar Gratis", "Coba Sekarang", "Mulai Belajar" tanpa hierarki jelas

**Definisi selesai:** Website dan sosial media saling terhubung dua arah.

---

### FASE 3 — Konsistensi Konten
**Prioritas: Menengah**

- [ ] Tambah konten Kaiwa N5 — minimal 5 tema baru (target sesuai klaim di homepage)
- [ ] Tambah konten Kaiwa N4 dan N3 — minimal 3 tema masing-masing
- [ ] Setup struktur data N3: file JSON untuk vocab, kanji, grammar, supplements (lihat catatan format di bawah)
- [ ] Tambahkan anti-duplication logic agar quiz tidak mengulang soal yang sama dalam satu sesi

**Format data kosakata (gunakan struktur ini untuk semua level):**
```typescript
interface VocabEntry {
  id: string
  kanji: string
  furigana: string
  romaji: string
  meaning: string          // Bahasa Indonesia
  level: "N5" | "N4" | "N3" | "N2" | "N1"
  category: string         // contoh: "homofon", "kanyouku", "grammar"
  example: string
  exampleTranslation: string
}
```

**Definisi selesai:** Setiap level punya minimal 5 tema kaiwa dan struktur data N3 siap dipakai quiz/SRS.

---

### FASE 4 — Monetisasi
**Prioritas: Menengah-lanjutan**

- [ ] Rancang halaman `/pricing` — jelaskan apa yang gratis (N5–N4) vs berbayar (N3–N1)
- [ ] Bangun logic gating sederhana: konten N3 ke atas perlu login + status premium
- [ ] Integrasi status user (gratis/premium) ke SRS dan Kaiwa — saat ini semua kemungkinan masih full akses
- [ ] Tambahkan halaman checkout atau link ke Gumroad/Lynk.id untuk upgrade

**Definisi selesai:** User paham jelas batas gratis vs berbayar, dan ada jalur upgrade yang berfungsi.

---

### FASE 5 — Diferensiasi & Fitur Lanjutan
**Prioritas: Lanjutan, setelah Fase 1–4 selesai**

- [ ] Ganti hero image generik dengan visual yang lebih merepresentasikan identitas Koto no Ha
- [ ] Bangun AI chatbot untuk koreksi grammar bahasa Jepang bisnis (sesuai roadmap)
- [ ] Tambah Format 2 Quiz — Fill in the Blank Grammar
- [ ] Tambah Format 3 Quiz — Matching Pairs dengan animasi drag
- [ ] Tambah Listening Quiz — butuh audio terlebih dulu dari Fase 1

**Definisi selesai:** Fitur baru menambah diferensiasi nyata dibanding kompetitor (WKWK Japanese, Pocket Nihongo, Kepo Jepang).

---

## Catatan untuk Scheduled Task / Cowork

Jika dijalankan via scheduled task, ikuti langkah ini setiap kali:

1. Baca ulang file ini (`CLAUDE.md`) untuk konteks terbaru
2. Cek checklist fase mana yang belum selesai — kerjakan dari yang teratas
3. Jangan kerjakan lebih dari 1 fase dalam satu sesi otomatis kecuali instruksi eksplisit
4. Setelah selesai, update checklist di file ini — centang task yang sudah dikerjakan
5. Jalankan `npm run build` sebelum menutup sesi
6. Laporkan hasil singkat: task apa yang dikerjakan, file apa yang berubah, ada error atau tidak

---

## Yang TIDAK Boleh Dilakukan Otomatis

- Jangan deploy ke production tanpa konfirmasi manual dari Zilsa
- Jangan ubah skema database atau struktur data yang sudah dipakai fitur live tanpa migration plan
- Jangan hapus konten kaiwa atau quiz yang sudah ada
- Jangan ubah harga atau logic pricing tanpa instruksi eksplisit
- Jangan commit langsung ke branch main — gunakan branch terpisah untuk perubahan besar

---

## Status Terakhir

**Update terakhir:** 20 Juni 2026
**Fase aktif:** Fase 2 — belum dimulai
**Blocker:** Tidak ada saat ini
