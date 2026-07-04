-- 043: Hardening fungsi SECURITY DEFINER (temuan Supabase advisors).
-- Prinsip: cabut EXECUTE dari PUBLIC (default Postgres memberi semua role akses),
-- lalu beri balik HANYA ke role yang memang membutuhkan.
--
-- - handle_new_user  : trigger registrasi (auth.users) — tidak boleh dipanggil via API.
--                      Grant ke supabase_auth_admin agar trigger signup tetap jalan.
--                      Juga pin search_path (body sudah fully-qualified).
-- - rls_auto_enable  : event trigger DDL — tidak boleh dipanggil via API.
-- - award_quiz_xp, mark_item_known, review_srs_card : RPC untuk user login saja
--                      (semuanya sudah cek auth.uid() internal; ini defense in depth
--                      + menutup endpoint dari anon).

-- Trigger registrasi
REVOKE EXECUTE ON FUNCTION public.handle_new_user() FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.handle_new_user() TO supabase_auth_admin;
ALTER FUNCTION public.handle_new_user() SET search_path = '';

-- Event trigger RLS otomatis
REVOKE EXECUTE ON FUNCTION public.rls_auto_enable() FROM PUBLIC, anon, authenticated;

-- RPC khusus user login
REVOKE EXECUTE ON FUNCTION public.award_quiz_xp(integer) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.award_quiz_xp(integer) TO authenticated;

REVOKE EXECUTE ON FUNCTION public.mark_item_known(text, uuid, integer) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.mark_item_known(text, uuid, integer) TO authenticated;

REVOKE EXECUTE ON FUNCTION public.review_srs_card(uuid, boolean) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.review_srs_card(uuid, boolean) TO authenticated;
