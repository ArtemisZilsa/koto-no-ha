# Rencana Launch Berbayar Koto no Ha — target 12 Oktober 2026

Disusun 29 Sep 2026 (JST). Dokumen ini adalah sumber kebenaran untuk sprint launch.
Agent harian membaca file ini + `STATE.md` di folder yang sama setiap run.

## 1. Target & keputusan yang sudah dikunci

| Hal | Keputusan |
|---|---|
| Model | Situs tetap gratis. Yang dijual: **PDF (beli sekali, akses selamanya)** dan **Video (langganan bulanan)** |
| Payment | **Xendit** (rekening Indonesia) sebagai jalur utama karena punya webhook untuk membuka akses otomatis. Lynk.id hanya cadangan untuk PDF bila akun Xendit belum aktif per 10 Okt |
| Video | **Bunny Stream** (storage + CDN + player + token auth + DRM dasar dalam satu layanan) |
| Login | Email saja. Dua peran: `user` dan `admin` (admin wajib MFA/TOTP) |
| Data user | Email + WhatsApp (dengan checkbox persetujuan) |
| Desain | Palet brand (crimson #B3122E, off-white #FAFAFA, hitam #111111), hero landing **Three.js**, hapus sakura/maple/hotaru dan confetti, landing dipangkas |
| Bahasa | Copy Indonesia ditulis ulang: natural, seru, sesuai EYD, tidak "AI slop" |
| Kaigo | Tidak dihapus, tapi turun dari landing dan bukan prioritas |
| Domain | Tambah domain sendiri, `.netlify.app` di-redirect 301 ke domain baru |
| Target optimis | 2.000 pembeli PDF N5–N3, 7.000 subscriber video |
| Iklan | Rp500.000 (IG, TikTok, FB), mulai setelah 12 Okt |

## 2. Temuan audit (29 Sep)

- Stack: Next.js 16 + Supabase SSR di `my-app/`, Netlify dengan `@netlify/plugin-nextjs`.
- SEO dasar **sudah ada**: `robots.ts`, `sitemap.ts`, tag verifikasi Google Search Console, metadata OG. Masalah "tidak muncul di Google" kemungkinan besar karena domain `.netlify.app` (otoritas rendah, situs baru) dan sitemap belum disubmit/diindeks. Solusi: domain sendiri + Search Console + tautan masuk dari IG/TikTok.
- **Belum ada security headers** (CSP, HSTS, X-Frame-Options, Referrer-Policy, Permissions-Policy) di `next.config.ts` maupun `netlify.toml`.
- Supabase security advisor: 3 fungsi `SECURITY DEFINER` bisa dipanggil user login (`award_quiz_xp(p_xp)`, `mark_item_known(..., p_xp)`, `review_srs_card`). `p_xp` dikirim dari klien → user bisa memberi XP sembarang ke dirinya. Tidak fatal sekarang, tapi **pola ini tidak boleh dipakai untuk paywall**. Plus: *Leaked Password Protection* masih mati.
- Landing punya **12 section** (Hero, LevelStrip, FeaturesGrid, StudyTools, ProgressSection, KaiwaPreview, NativeTeaser, NewsSection, VisaSection, HowItWorks, FAQ, CTA) → terlalu panjang.
- Efek jatuh ada di `components/effects/AmbientEffects.tsx` (dipasang global di `app/layout.tsx`); confetti di `components/quiz/QuizOption.tsx` & `QuizEndScreen.tsx`.
- Kolom `is_premium` sudah ada di beberapa tabel konten — bisa dipakai ulang, tapi hak akses harus dicek dari tabel entitlement, bukan dari flag di klien.

## 3. Arsitektur paywall (aman untuk konsumen Indonesia)

```
User klik Beli → route server /api/checkout (cek login) → buat Xendit Invoice
   (external_id = order_id, simpan order "pending")
 → user bayar via QRIS / VA / e-wallet / kartu
 → Xendit kirim webhook → /api/xendit/webhook
      1. cek header x-callback-token (tolak jika salah)
      2. idempoten: order yang sudah "paid" tidak diproses ulang
      3. cocokkan nominal & order_id
      4. tulis entitlements pakai service role (HANYA di server)
 → halaman user update lewat Supabase Realtime, TANPA perlu logout/login ulang
```

**Tabel baru (migrasi via PR):** `products`, `orders`, `payments` (log mentah webhook), `entitlements` (user_id, product_id, expires_at — NULL untuk PDF selamanya), `admin_audit_log`; `profiles` ditambah `role`, `whatsapp`, `whatsapp_consent_at`.
**RLS:** user hanya bisa membaca baris miliknya; tidak ada INSERT/UPDATE dari klien ke `orders`/`entitlements`; `role` hanya bisa diubah lewat SQL oleh admin.

**Langganan video di Indonesia:** mayoritas bayar pakai QRIS/VA/e-wallet yang tidak bisa auto-debit. Jadi: akses 30 hari per pembayaran + tagihan perpanjangan otomatis dikirim via email H-3; auto-debit hanya untuk kartu. Ini tetap "langganan bulanan" dari sisi user.

**PDF:** bucket Supabase Storage **privat**. Unduh lewat route server yang cek entitlement → cap watermark email pembeli di tiap halaman (pdf-lib) → signed URL berlaku 60 detik → batas 10 unduhan/hari.

**Video:** Bunny Stream dengan *token authentication* + *allowed referrer* (hanya domain Koto no Ha). URL embed ditandatangani server, berlaku singkat. Video tidak pernah disimpan di database; database hanya menyimpan ID video.

**Sesi tidak mudah logout:** refresh token Supabase dengan rotasi (sudah jalan lewat `proxy.ts`); jangan set inactivity timeout pendek; entitlement dibaca di server tiap request.

**Admin:** route `/admin` dicek di server (`role = 'admin'`) + MFA TOTP wajib; isi: daftar order, beri/cabut akses manual, cek status webhook. Semua aksi admin dicatat di `admin_audit_log`.

**Lainnya:** security headers, Cloudflare Turnstile di form daftar, rate limit checkout & webhook, nyalakan Leaked Password Protection, perbaiki RPC XP (clamp di server), `npm audit` + Dependabot, kebijakan privasi diperbarui sesuai UU PDP (data yang disimpan, tujuan, cara hapus akun).

## 4. Database besar — cara mengelolanya

- ~5.000 soal pilihan ganda hanya beberapa MB di Postgres. Aman di Supabase Pro (8 GB DB).
- 8 PDF (±200 MB) di Supabase Storage Pro (kuota 100 GB).
- Video 20 GB+ **di Bunny**, bukan Supabase/Netlify. Tambah index untuk kolom yang sering difilter (level, kategori).

## 5. Biaya bulanan perkiraan

| Pos | Perkiraan |
|---|---|
| Supabase Pro | US$25 |
| Netlify Pro | sudah berjalan |
| Bunny Stream (20 GB storage + trafik) | ±US$1–30, naik seiring jumlah penonton |
| Domain `.com`/`.id` | ±Rp150–300 ribu/tahun |
| Xendit | QRIS 0,7% + Rp4.000; VA Rp9.000 + Rp4.000; e-wallet 2,5–5,5% + Rp4.000 per transaksi |
| Iklan | Rp500.000 |

Catatan: di harga Rp49 ribu, biaya QRIS ±Rp4.300 (±9%). Dorong QRIS; hindari VA untuk produk murah.

## 6. Landing baru (12 → 5 section)

1. Hero Three.js (objek 3D kanji 言/daun 葉, palet brand) + CTA "Mulai gratis"
2. Level N5–N3 + fitur inti (gabungan LevelStrip, FeaturesGrid, StudyTools)
3. Cuplikan Latihan/Kaiwa
4. **Harga** (PDF sekali beli, Video bulanan)
5. FAQ singkat + CTA

Pindah ke halaman sendiri: Berita, SSW/Visa (termasuk kaigo), Progress, NativeTeaser, HowItWorks.
Three.js: `@react-three/fiber` + `@react-three/drei`, dimuat lazy, fallback gambar statis di HP lemah dan `prefers-reduced-motion`.

## 7. Jadwal sprint

| Tanggal | Task Claude Code (harian otomatis) | Tugas Zilsa (tidak bisa didelegasikan) |
|---|---|---|
| 30 Sep | T1 security headers · T2 hapus efek jatuh & confetti | Daftar Xendit (KYC), beli domain, upgrade Supabase Pro, buat akun Bunny, tentukan harga PDF |
| 1 Okt | T3 perbaiki RPC XP + nyalakan proteksi password (PR) | Mulai upload video ke Bunny (bisa semalaman) |
| 2 Okt | T4 migrasi skema paywall + RLS (PR) | Review & merge PR T3/T4, jalankan migrasi |
| 3–4 Okt | T5 checkout + webhook Xendit mode tes (PR) | Kirim API key tes Xendit ke Netlify env |
| 5 Okt | T6 unduhan PDF aman + watermark (PR) | Upload 8 PDF ke bucket privat |
| 6 Okt | T7 gating video Bunny + halaman langganan (PR) | Kirim token key Bunny ke Netlify env |
| 7 Okt | T8 landing 5 section + halaman harga (PR) | Kirim referensi desain (paling lambat 6 Okt) |
| 8 Okt | T9 hero Three.js (PR) | Review tampilan di HP |
| 9 Okt | T10 area admin + MFA (PR) | Aktifkan MFA akun admin |
| 10 Okt | T11 tulis ulang copy EYD (PR) · T12 turunkan kaigo dari landing | Review copy; tes bayar sandbox end-to-end |
| 11 Okt | T13 QA menyeluruh + advisor Supabase · T14 pindah ke domain baru | Masukkan API key **live** Xendit, keputusan go/no-go |
| **12 Okt** | Monitor webhook & error | **Launch** PDF + langganan video |
| 13 Okt+ | Monitor harian, laporan email | Iklan Rp500k mulai jalan |

## 8. Realita target (posisi keuangan)

7.000 subscriber × Rp49 ribu ≈ Rp343 juta/bulan; 2.000 PDF × Rp79 ribu ≈ Rp158 juta. Dengan iklan Rp500 ribu, bulan pertama realistisnya puluhan pembeli. Angka optimis tetap dipakai sebagai kompas, tapi yang dipantau mingguan: registrasi gratis → pengunjung halaman harga → pembeli, dan biaya iklan per pembeli.

## 9. Aturan untuk agent

- Ikuti `CLAUDE.md` repo: fix kecil/teknis boleh langsung ke `master`; **skema DB, payment, auth, admin, copy bahasa Indonesia, dan konten bahasa Jepang wajib PR** (jangan merge sendiri).
- Jangan pernah menulis ke database produksi, jangan pernah commit secret/API key.
- Satu run = kerjakan task berikutnya yang belum selesai di `STATE.md`, lalu perbarui `STATE.md`.
- Jika task butuh sesuatu dari Zilsa (key, akun, file) dan belum ada, jangan dipaksa: kerjakan task lain yang tidak terblokir, catat blokirnya.
