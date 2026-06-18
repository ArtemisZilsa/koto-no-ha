-- RPC untuk menambah XP dari kuis ke akun + update streak harian.
-- Logika streak identik dengan mark_item_known (same-day no-op, kemarin +1, gap reset 1).
CREATE OR REPLACE FUNCTION public.award_quiz_xp(p_xp integer)
 RETURNS TABLE(total_xp integer, streak_days integer)
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
declare
  v_uid uuid := auth.uid();
  v_today date := (now() at time zone 'utc')::date;
  v_last date;
  v_streak integer;
  v_xp integer;
begin
  if v_uid is null then
    raise exception 'not authenticated';
  end if;
  -- batasi nilai agar tidak bisa dicurangi sembarang
  if p_xp is null or p_xp < 0 then
    p_xp := 0;
  elsif p_xp > 1000 then
    p_xp := 1000;
  end if;

  select p.last_active_date, p.streak_days into v_last, v_streak
  from public.profiles p where p.id = v_uid for update;

  if v_last is null or v_last < v_today - 1 then
    v_streak := 1;
  elsif v_last = v_today - 1 then
    v_streak := coalesce(v_streak, 0) + 1;
  end if;
  -- v_last = v_today: streak tidak berubah

  update public.profiles p
  set total_xp = coalesce(p.total_xp, 0) + p_xp,
      streak_days = coalesce(v_streak, p.streak_days, 0),
      last_active_date = v_today
  where p.id = v_uid
  returning p.total_xp, p.streak_days into v_xp, v_streak;

  return query select coalesce(v_xp, 0), coalesce(v_streak, 0);
end;
$function$;
