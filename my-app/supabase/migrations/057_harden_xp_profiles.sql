-- 057: Tutup celah XP/streak & kolom profil yang bisa ditulis klien (T3 sprint launch).
--
-- Temuan (audit read-only 29 Sep 2026):
--   1. profiles: policy "Users can update own profile" + GRANT UPDATE di semua kolom
--      untuk anon/authenticated → user login bisa PATCH total_xp, streak_days,
--      last_active_date, bahkan is_premium miliknya sendiri langsung via REST.
--      Aplikasi TIDAK pernah menulis profiles dari klien (hanya SELECT), jadi hak
--      tulis dipersempit ke kolom yang memang boleh diubah user.
--   2. award_quiz_xp(p_xp): nilai XP dari klien, di-clamp 0..1000 tapi bisa dipanggil
--      berulang tanpa batas. Kini: maks 250/panggilan (kuis 10 soal maks 230 XP),
--      jeda minimal 20 detik antar-panggilan, dan maks 2.000 XP kuis per hari (UTC).
--   3. mark_item_known(..., p_xp): p_xp dari klien diabaikan (tetap 5 XP), dan XP hanya
--      diberikan SEKALI per item seumur akun. Sebelumnya "batal tandai" (DELETE, diizinkan
--      RLS) lalu tandai lagi = XP lagi, tanpa batas.
--   4. review_srs_card: tidak dipakai aplikasi (flashcard menulis user_srs_progress
--      lewat server action), tapi bisa dipanggil berulang untuk +2 XP. EXECUTE dicabut.
--
-- Signature fungsi TIDAK berubah, jadi kode yang sedang live tetap jalan
-- sebelum/sesudah migrasi ini diterapkan.

-- ─── 1. Ledger XP (hanya ditulis fungsi SECURITY DEFINER) ─────────────────────
CREATE TABLE IF NOT EXISTS public.xp_awards (
  id          bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id     uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  source      text NOT NULL CHECK (source IN ('quiz', 'item')),
  item_key    text,
  xp          integer NOT NULL CHECK (xp >= 0),
  awarded_at  timestamptz NOT NULL DEFAULT now()
);

-- Satu item hanya sekali memberi XP.
CREATE UNIQUE INDEX IF NOT EXISTS xp_awards_item_once
  ON public.xp_awards (user_id, source, item_key)
  WHERE item_key IS NOT NULL;

CREATE INDEX IF NOT EXISTS xp_awards_user_time
  ON public.xp_awards (user_id, source, awarded_at DESC);

ALTER TABLE public.xp_awards ENABLE ROW LEVEL SECURITY;
-- Tanpa policy: anon/authenticated tidak bisa baca/tulis sama sekali.
REVOKE ALL ON public.xp_awards FROM PUBLIC, anon, authenticated;

-- Item yang sudah ditandai sebelum migrasi dianggap sudah pernah diberi XP.
INSERT INTO public.xp_awards (user_id, source, item_key, xp, awarded_at)
SELECT uip.user_id, 'item', uip.item_type || ':' || uip.item_id::text, 0, now()
FROM public.user_item_progress uip
ON CONFLICT DO NOTHING;

-- ─── 2. profiles: klien hanya boleh mengubah kolom identitas ─────────────────
REVOKE INSERT, UPDATE, DELETE, TRUNCATE ON public.profiles FROM anon, authenticated;
GRANT UPDATE (full_name, username, avatar_url, current_level_id)
  ON public.profiles TO authenticated;
-- Baris profil dibuat oleh trigger handle_new_user (SECURITY DEFINER), bukan klien.
-- Policy INSERT/UPDATE tetap ada; GRANT kolom di atas yang membatasi.

-- ─── 3. award_quiz_xp: clamp + cooldown + batas harian ───────────────────────
CREATE OR REPLACE FUNCTION public.award_quiz_xp(p_xp integer)
 RETURNS TABLE(total_xp integer, streak_days integer)
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
declare
  c_max_per_call constant integer := 250;
  c_min_gap      constant interval := interval '20 seconds';
  c_daily_cap    constant integer := 2000;
  v_uid uuid := auth.uid();
  v_today date := (now() at time zone 'utc')::date;
  v_last date;
  v_streak integer;
  v_xp integer;
  v_last_award timestamptz;
  v_today_sum integer;
  v_grant integer;
begin
  if v_uid is null then
    raise exception 'not authenticated';
  end if;

  v_grant := least(greatest(coalesce(p_xp, 0), 0), c_max_per_call);

  -- Kunci baris profil dulu supaya panggilan paralel diserialkan.
  select p.last_active_date, p.streak_days into v_last, v_streak
  from public.profiles p where p.id = v_uid for update;

  select max(a.awarded_at),
         coalesce(sum(a.xp) filter (where a.awarded_at >= (v_today::timestamp at time zone 'utc')), 0)
    into v_last_award, v_today_sum
  from public.xp_awards a
  where a.user_id = v_uid and a.source = 'quiz'
    and a.awarded_at >= (v_today::timestamp at time zone 'utc') - interval '1 day';

  if v_last_award is not null and now() - v_last_award < c_min_gap then
    v_grant := 0;
  end if;
  v_grant := least(v_grant, greatest(c_daily_cap - v_today_sum, 0));

  if v_grant > 0 then
    insert into public.xp_awards (user_id, source, xp) values (v_uid, 'quiz', v_grant);
  end if;

  if v_last is null or v_last < v_today - 1 then
    v_streak := 1;
  elsif v_last = v_today - 1 then
    v_streak := coalesce(v_streak, 0) + 1;
  end if;
  -- v_last = v_today: streak tidak berubah

  update public.profiles p
  set total_xp = coalesce(p.total_xp, 0) + v_grant,
      streak_days = coalesce(v_streak, p.streak_days, 0),
      last_active_date = v_today
  where p.id = v_uid
  returning p.total_xp, p.streak_days into v_xp, v_streak;

  return query select coalesce(v_xp, 0), coalesce(v_streak, 0);
end;
$function$;

-- ─── 4. mark_item_known: XP tetap 5, sekali per item ─────────────────────────
CREATE OR REPLACE FUNCTION public.mark_item_known(p_item_type text, p_item_id uuid, p_xp integer DEFAULT 5)
 RETURNS TABLE(known boolean, total_xp integer, streak_days integer)
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
declare
  c_item_xp constant integer := 5;  -- p_xp dari klien diabaikan (kompatibilitas signature)
  v_uid uuid := auth.uid();
  v_inserted integer := 0;
  v_first_award integer := 0;
  v_today date := (now() at time zone 'utc')::date;
  v_last date;
  v_streak integer;
  v_xp integer;
begin
  if v_uid is null then
    raise exception 'not authenticated';
  end if;
  if p_item_type not in ('vocab', 'kanji') then
    raise exception 'invalid item_type';
  end if;

  insert into public.user_item_progress (user_id, item_type, item_id)
  values (v_uid, p_item_type, p_item_id)
  on conflict (user_id, item_type, item_id) do nothing;
  get diagnostics v_inserted = row_count;

  if v_inserted > 0 then
    insert into public.xp_awards (user_id, source, item_key, xp)
    values (v_uid, 'item', p_item_type || ':' || p_item_id::text, c_item_xp)
    on conflict do nothing;
    get diagnostics v_first_award = row_count;

    select p.last_active_date, p.streak_days into v_last, v_streak
    from public.profiles p where p.id = v_uid for update;

    if v_last is null or v_last < v_today - 1 then
      v_streak := 1;
    elsif v_last = v_today - 1 then
      v_streak := coalesce(v_streak, 0) + 1;
    end if;

    update public.profiles p
    set total_xp = coalesce(p.total_xp, 0) + case when v_first_award > 0 then c_item_xp else 0 end,
        streak_days = coalesce(v_streak, p.streak_days, 0),
        last_active_date = v_today
    where p.id = v_uid;
  end if;

  select p.total_xp, p.streak_days into v_xp, v_streak
  from public.profiles p where p.id = v_uid;
  return query select true, coalesce(v_xp, 0), coalesce(v_streak, 0);
end;
$function$;

-- Hak eksekusi dipertahankan seperti 043 (CREATE OR REPLACE tidak mengubah ACL,
-- ditegaskan ulang untuk jaga-jaga).
REVOKE EXECUTE ON FUNCTION public.award_quiz_xp(integer) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.award_quiz_xp(integer) TO authenticated;
REVOKE EXECUTE ON FUNCTION public.mark_item_known(text, uuid, integer) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.mark_item_known(text, uuid, integer) TO authenticated;

-- ─── 5. review_srs_card: tidak dipakai aplikasi → tutup ──────────────────────
REVOKE EXECUTE ON FUNCTION public.review_srs_card(uuid, boolean) FROM PUBLIC, anon, authenticated;
