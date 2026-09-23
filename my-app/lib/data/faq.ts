import type { FaqItem } from '@/lib/seo'

// FAQ situs: dipakai di homepage (teks + FAQPage JSON-LD) dan /llms.txt.
// Mesin pencari dan mesin jawaban AI mengutip bagian seperti ini; jaga
// jawabannya faktual dan perbarui kalau fitur atau jumlah konten berubah.
export const FAQ_ITEMS: FaqItem[] = [
  {
    q: 'Apa itu Koto no Ha?',
    a: 'Koto no Ha (言の葉) adalah platform belajar bahasa Jepang untuk orang Indonesia. Materinya disusun oleh Zilsa, yang sudah 3 tahun tinggal dan bekerja di Jepang dengan kemampuan setara JLPT N1, dengan penjelasan dan terjemahan dalam Bahasa Indonesia.',
  },
  {
    q: 'Apakah Koto no Ha gratis?',
    a: 'Ya. Daftar akun gratis, dan saat ini semua fitur bisa dipakai tanpa biaya: soal latihan, kuis, flashcard, kaiwa, dokkai, dan kosakata kerja SSW.',
  },
  {
    q: 'Level JLPT apa saja yang tersedia?',
    a: 'Semua level JLPT dari N5 sampai N1: lebih dari 2.000 kosakata, hampir 1.000 kanji, dan lebih dari 650 pola tata bahasa, lengkap dengan cara baca, arti, dan contoh kalimat. Soal latihan per set saat ini tersedia untuk N5, N4, dan N3.',
  },
  {
    q: 'Bagaimana cara kerja soal latihan JLPT di Koto no Ha?',
    a: 'Soal dibagi per set: 30 soal kosakata, 10 soal tata bahasa, atau 20 soal kanji. Setiap soal pilihan ganda langsung dikoreksi, timer per soal bisa dinyalakan kalau mau, dan di akhir set ada ringkasan soal yang terlewat. Kalau kamu masuk ke akun, progres per kategori dan level tersimpan di dashboard.',
  },
  {
    q: 'Saya pemula total. Harus mulai dari mana?',
    a: 'Mulai dari N5: kerjakan set kosakata dan kanji N5 di halaman Soal Latihan, lalu lanjut ke tata bahasa N5. Setelah progres N5 sebagian besar terisi, naik ke N4.',
  },
  {
    q: 'Apakah ada materi untuk Tokutei Ginou (SSW) atau kaigo?',
    a: 'Ada. Bidang kaigo (perawatan lansia) punya 300 istilah khusus (senmon yougo) dan silabus Kaiwa Kerja untuk Staf Perawatan Lansia (介護職員) sebanyak 20 pelajaran berurutan dari level N5 sampai N3.',
  },
  {
    q: 'Apakah harus punya akun untuk belajar?',
    a: 'Soal latihan, kuis, kaiwa, dan berita bisa dibuka tanpa akun. Akun dibutuhkan untuk menyimpan progres, XP, dan streak harian, serta untuk membuka materi per level dan latihan membaca (dokkai).',
  },
]
