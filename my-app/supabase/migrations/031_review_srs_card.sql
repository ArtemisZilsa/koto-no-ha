-- RPC review kartu SRS (mode sederhana 2 tombol, penjadwalan ala Leitner).
-- Menyimpan progres per (user, kartu), menaikkan XP & streak saat "sudah hafal".
-- Logika streak identik dengan award_quiz_xp (same-day no-op, kemarin +1, gap reset 1).
CREATE OR REPLACE FUNCTION public.review_srs_card(p_card_id uuid, p_known boolean)
 RETURNS json
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
  v_ladder int[] := ARRAY[1, 3, 7, 16, 35, 90];
  v_cur_interval int;
  v_idx int;
  v_new_interval int;
  v_next timestamptz;
  v_xp_gain int := 2;  -- XP per kartu yang sudah hafal
begin
  if v_uid is null then
    raise exception 'not authenticated';
  end if;
  if p_card_id is null then
    raise exception 'card_id required';
  end if;

  -- Interval kartu saat ini (default 1 utk kartu baru / belum ada progres).
  select interval_days into v_cur_interval
  from public.user_flashcard_progress
  where user_id = v_uid and flashcard_id = p_card_id;
  v_cur_interval := coalesce(v_cur_interval, 1);

  if p_known then
    -- naik satu anak tangga Leitner (mentok di 90 hari).
    v_idx := coalesce(array_position(v_ladder, v_cur_interval), 1);
    v_new_interval := v_ladder[least(v_idx + 1, array_length(v_ladder, 1))];
  else
    v_new_interval := 1;  -- ulangi besok
  end if;
  v_next := now() + (v_new_interval || ' days')::interval;

  -- Upsert progres kartu.
  insert into public.user_flashcard_progress
    (user_id, flashcard_id, interval_days, next_review_at, review_count, last_reviewed_at)
  values
    (v_uid, p_card_id, v_new_interval, v_next, case when p_known then 1 else 0 end, now())
  on conflict (user_id, flashcard_id) do update
    set interval_days   = v_new_interval,
        next_review_at   = v_next,
        review_count     = public.user_flashcard_progress.review_count + case when p_known then 1 else 0 end,
        last_reviewed_at = now();

  -- XP & streak hanya saat "sudah hafal".
  if p_known then
    select p.last_active_date, p.streak_days into v_last, v_streak
    from public.profiles p where p.id = v_uid for update;

    if v_last is null or v_last < v_today - 1 then
      v_streak := 1;
    elsif v_last = v_today - 1 then
      v_streak := coalesce(v_streak, 0) + 1;
    end if;

    update public.profiles p
    set total_xp = coalesce(p.total_xp, 0) + v_xp_gain,
        streak_days = coalesce(v_streak, p.streak_days, 0),
        last_active_date = v_today
    where p.id = v_uid
    returning p.total_xp, p.streak_days into v_xp, v_streak;
  else
    select p.total_xp, p.streak_days into v_xp, v_streak
    from public.profiles p where p.id = v_uid;
  end if;

  return json_build_object(
    'next_review_at', v_next,
    'interval_days', v_new_interval,
    'total_xp', coalesce(v_xp, 0),
    'streak_days', coalesce(v_streak, 0)
  );
end;
$function$;
</content>
