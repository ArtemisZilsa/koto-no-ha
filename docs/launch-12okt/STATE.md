# State — Sprint Launch 12 Okt

Terakhir diperbarui: 30 Sep 2026 (JST). Catatan: `npm run build` di sandbox gagal hanya karena Google Fonts tidak terjangkau; tsc lulus.

| Task | Status | Catatan |
|---|---|---|
| T1 Security headers | selesai 29 Sep (f325e17) | CSP masih Report-Only, enforce di T13 |
| T2 Hapus sakura/maple/hotaru + confetti | selesai 29 Sep (f325e17) | Sisa CSS .sakura-layer/.maple-leaf di globals.css boleh dibersihkan |
| T3 Perbaiki RPC XP + leaked password protection | selesai 30 Sep (PR #23 merged, migrasi 057 diterapkan & diverifikasi) | profiles hanya bisa diubah di full_name/username/avatar_url/current_level_id; XP kuis dibatasi; review_srs_card ditutup. Sisa: Leaked Password Protection (toggle dashboard, Zilsa) |
| T4 Migrasi skema paywall + RLS | belum | PR |
| T5 Checkout + webhook Xendit (tes) | belum | PR, butuh API key tes |
| T6 Unduhan PDF aman + watermark | belum | PR |
| T7 Gating video Bunny + langganan | belum | PR, butuh token key Bunny |
| T8 Landing 5 section + halaman harga | belum | PR |
| T9 Hero Three.js | belum | PR |
| T10 Area admin + MFA | belum | PR |
| T11 Copy EYD | belum | PR |
| T12 Kaigo turun dari landing | belum | |
| T13 QA + advisor | belum | |
| T14 Pindah domain | belum | butuh domain |

## Blokir dari Zilsa
- Akun Xendit, domain, akun Bunny, harga PDF, referensi desain.
- Nyalakan Leaked Password Protection di Supabase Dashboard → Authentication (butuh Pro).
