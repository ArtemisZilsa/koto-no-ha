-- 062: Area admin (T10) — edit soal, laporan soal, kelola admin, beri/cabut akses.
--
-- Semua tulisan admin lewat fungsi SECURITY DEFINER yang memanggil admin_guard():
--   pemanggil harus role 'admin' DAN sesi sudah lolos 2 langkah (JWT aal = 'aal2').
-- Jadi walaupun email+password admin bocor, tanpa kode authenticator tidak ada yang bisa diubah.
-- Setiap aksi dicatat di admin_audit_log (append-only, 059).
--
-- Bergantung pada 059 + 060. Idempoten: aman dijalankan ulang.

-- ─── 0. Penjaga ──────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.is_admin_aal2()
 RETURNS boolean
 LANGUAGE sql
 STABLE
 SECURITY DEFINER
 SET search_path TO ''
AS $$
  select public.is_admin() and coalesce((select auth.jwt() ->> 'aal'), '') = 'aal2';
$$;
REVOKE EXECUTE ON FUNCTION public.is_admin_aal2() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_admin_aal2() TO authenticated;

CREATE OR REPLACE FUNCTION public.admin_guard()
 RETURNS void
 LANGUAGE plpgsql
 STABLE
 SECURITY DEFINER
 SET search_path TO ''
AS $$
begin
  if not public.is_admin() then
    raise exception 'Hanya admin.' using errcode = '42501';
  end if;
  if coalesce((select auth.jwt() ->> 'aal'), '') <> 'aal2' then
    raise exception 'Verifikasi 2 langkah dulu.' using errcode = '42501';
  end if;
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_guard() FROM PUBLIC, anon, authenticated;

-- ─── 1. bank_soal: status 'buang' + tanda sudah diedit di website ────────────
-- 'buang' = disembunyikan (progres user tetap utuh), bukan dihapus.
-- edited_at terisi → import Excel berikutnya TIDAK menimpa soal ini.
ALTER TABLE public.bank_soal ADD COLUMN IF NOT EXISTS edited_at timestamptz;
ALTER TABLE public.bank_soal DROP CONSTRAINT IF EXISTS bank_soal_review_status_check;
ALTER TABLE public.bank_soal ADD CONSTRAINT bank_soal_review_status_check
  CHECK (review_status IN ('belum', 'ok', 'revisi', 'buang'));

DROP POLICY IF EXISTS "Bank soal hanya untuk pelanggan" ON public.bank_soal;
CREATE POLICY "Bank soal hanya untuk pelanggan" ON public.bank_soal
  FOR SELECT TO authenticated
  USING (
    ((select public.has_entitlement('video-bulanan')) AND review_status <> 'buang')
    OR (select public.is_admin())
  );

-- Admin pun tidak melihat soal 'buang' di menu; hanya di /admin/soal.
CREATE OR REPLACE FUNCTION public.get_bank_progress()
RETURNS TABLE (category text, mode text, unit int, checkpoint text, group_code text,
               group_label text, total int, mastered int)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = ''
AS $$
  WITH ok AS (
    SELECT DISTINCT a.soal_id
      FROM public.user_bank_answers a
     WHERE a.user_id = (select auth.uid()) AND a.is_correct
  )
  SELECT s.category, s.mode, s.unit::int, s.checkpoint, s.group_code, s.group_label,
         COUNT(*)::int, COUNT(ok.soal_id)::int
    FROM public.bank_soal s
    LEFT JOIN ok ON ok.soal_id = s.id
   WHERE s.mode <> 'cadangan' AND s.review_status <> 'buang'
   GROUP BY s.category, s.mode, s.unit, s.checkpoint, s.group_code, s.group_label;
$$;

CREATE OR REPLACE FUNCTION public.admin_update_soal(
  p_id uuid, p_question text, p_options jsonb, p_answer_index int,
  p_explanation text, p_review_status text
)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $$
declare
  v_old public.bank_soal%rowtype;
begin
  perform public.admin_guard();
  select * into v_old from public.bank_soal where id = p_id for update;
  if not found then
    raise exception 'Soal tidak ditemukan.';
  end if;
  update public.bank_soal
     set question = btrim(p_question), options = p_options, answer_index = p_answer_index,
         explanation = nullif(btrim(p_explanation), ''), review_status = p_review_status,
         edited_at = now()
   where id = p_id;
  insert into public.admin_audit_log (admin_id, action, details)
  values (auth.uid(), 'update_soal', jsonb_build_object(
    'code', v_old.code,
    'before', jsonb_build_object('question', v_old.question, 'options', v_old.options,
                                 'answer_index', v_old.answer_index, 'explanation', v_old.explanation,
                                 'review_status', v_old.review_status)));
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_update_soal(uuid, text, jsonb, int, text, text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_update_soal(uuid, text, jsonb, int, text, text) TO authenticated;

-- ─── 2. Laporan soal ─────────────────────────────────────────────────────────
ALTER TABLE public.bank_soal_reports ADD COLUMN IF NOT EXISTS resolved_at timestamptz;

DROP POLICY IF EXISTS "Admin membaca laporan" ON public.bank_soal_reports;
CREATE POLICY "Admin membaca laporan" ON public.bank_soal_reports
  FOR SELECT TO authenticated USING ((select public.is_admin_aal2()));
GRANT SELECT ON public.bank_soal_reports TO authenticated;

CREATE OR REPLACE FUNCTION public.admin_resolve_report(p_id bigint)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $$
begin
  perform public.admin_guard();
  update public.bank_soal_reports set resolved_at = now() where id = p_id and resolved_at is null;
  insert into public.admin_audit_log (admin_id, action, details)
  values (auth.uid(), 'resolve_report', jsonb_build_object('report_id', p_id));
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_resolve_report(bigint) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_resolve_report(bigint) TO authenticated;

-- ─── 3. Kelola admin ─────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.admin_list_admins()
 RETURNS TABLE (user_id uuid, email text)
 LANGUAGE plpgsql
 STABLE
 SECURITY DEFINER
 SET search_path TO ''
AS $$
begin
  perform public.admin_guard();
  return query
    select u.id, u.email::text from auth.users u join public.profiles p on p.id = u.id
     where p.role = 'admin' order by u.email;
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_list_admins() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_list_admins() TO authenticated;

-- Mengembalikan pesan untuk ditampilkan. Admin tidak bisa mencabut dirinya sendiri
-- (mencegah tidak ada admin sama sekali).
CREATE OR REPLACE FUNCTION public.admin_set_role(p_email text, p_role text)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $$
declare
  v_user uuid;
begin
  perform public.admin_guard();
  if p_role not in ('user', 'admin') then
    raise exception 'Role tidak valid.';
  end if;
  select id into v_user from auth.users where lower(email) = lower(btrim(p_email));
  if v_user is null then
    return 'Email belum terdaftar. Minta orangnya daftar di website dulu.';
  end if;
  if v_user = auth.uid() and p_role = 'user' then
    return 'Tidak bisa mencabut admin dari akunmu sendiri.';
  end if;
  update public.profiles set role = p_role where id = v_user;
  insert into public.admin_audit_log (admin_id, action, target_user_id, details)
  values (auth.uid(), 'set_role', v_user, jsonb_build_object('role', p_role));
  return 'ok';
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_set_role(text, text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_set_role(text, text) TO authenticated;

-- ─── 4. Beri / cabut akses manual ────────────────────────────────────────────
-- Produk video dibutuhkan untuk akses bank soal. Harga di sini SEMENTARA dan nonaktif
-- (tidak tampil untuk dibeli); harga final di-set saat T5/T8.
INSERT INTO public.products (id, kind, title, price_idr, access_days, sort_order, is_active)
VALUES ('video-bulanan', 'video_sub', 'Video Kelas + Bank Soal (30 hari)', 49000, 30, 100, false)
ON CONFLICT (id) DO NOTHING;

DROP FUNCTION IF EXISTS public.admin_list_access();
CREATE FUNCTION public.admin_list_access()
 RETURNS TABLE (id uuid, email text, product_id text, source text, starts_at timestamptz,
                expires_at timestamptz, revoked_at timestamptz, active boolean)
 LANGUAGE plpgsql
 STABLE
 SECURITY DEFINER
 SET search_path TO ''
AS $$
begin
  perform public.admin_guard();
  return query
    select e.id, u.email::text, e.product_id, e.source, e.starts_at, e.expires_at, e.revoked_at,
           (e.revoked_at is null and (e.expires_at is null or e.expires_at > now()))
      from public.entitlements e join auth.users u on u.id = e.user_id
     order by 8 desc,
              e.created_at desc
     limit 500;
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_list_access() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_list_access() TO authenticated;

-- p_days NULL = selamanya.
CREATE OR REPLACE FUNCTION public.admin_grant_access(p_email text, p_product_id text, p_days int)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $$
declare
  v_user uuid;
begin
  perform public.admin_guard();
  if p_days is not null and (p_days < 1 or p_days > 3650) then
    raise exception 'Jumlah hari tidak valid.';
  end if;
  select id into v_user from auth.users where lower(email) = lower(btrim(p_email));
  if v_user is null then
    return 'Email belum terdaftar. Minta orangnya daftar di website dulu.';
  end if;
  if not exists (select 1 from public.products where id = p_product_id) then
    return 'Produk tidak ditemukan.';
  end if;
  insert into public.entitlements (user_id, product_id, source, expires_at)
  values (v_user, p_product_id, 'admin',
          case when p_days is null then null else now() + make_interval(days => p_days) end);
  insert into public.admin_audit_log (admin_id, action, target_user_id, details)
  values (auth.uid(), 'grant_entitlement', v_user,
          jsonb_build_object('product_id', p_product_id, 'days', p_days));
  return 'ok';
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_grant_access(text, text, int) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_grant_access(text, text, int) TO authenticated;

CREATE OR REPLACE FUNCTION public.admin_revoke_access(p_id uuid)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $$
declare
  v_user uuid;
begin
  perform public.admin_guard();
  update public.entitlements set revoked_at = now()
   where id = p_id and revoked_at is null
  returning user_id into v_user;
  if v_user is not null then
    insert into public.admin_audit_log (admin_id, action, target_user_id, details)
    values (auth.uid(), 'revoke_entitlement', v_user, jsonb_build_object('entitlement_id', p_id));
  end if;
end;
$$;
REVOKE EXECUTE ON FUNCTION public.admin_revoke_access(uuid) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.admin_revoke_access(uuid) TO authenticated;
