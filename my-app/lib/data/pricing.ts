// Harga yang tampil di beranda. SEMENTARA: angka dari docs/launch-12okt/PLAN.md §8,
// belum final. Saat checkout Xendit (T5) jadi, ambil dari tabel products agar satu sumber.
export const PRICING = {
  pdf: { title: 'PDF Materi', price: 79000, unit: 'sekali bayar', note: 'Akses selamanya per level' },
  video: { title: 'Video Kelas + Bank Soal', price: 49000, unit: '/ bulan', note: 'Video per batch + 2.000+ soal dengan pembahasan' },
}

export function rupiah(n: number): string {
  return `Rp${n.toLocaleString('id-ID')}`
}
