-- RPC ringkasan progres belajar untuk halaman /progress.
-- Satu round-trip: profil + mastery per level + ringkasan SRS + heatmap aktivitas.
-- Guard auth.uid(): kembalikan struktur nol bila tidak login.
CREATE OR REPLACE FUNCTION public.get_progress_overview(p_days integer DEFAULT 119)
 RETURNS json
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
declare
  v_uid uuid := auth.uid();
  v_days integer := least(greatest(coalesce(p_days, 119), 1), 366);
  v_profile json;
  v_levels json;
  v_srs json;
  v_activity json;
begin
  if v_uid is null then
    return json_build_object(
      'profile', json_build_object('total_xp', 0, 'streak_days', 0, 'level_code', null, 'level_name', null),
      'levels', '[]'::json,
      'srs', json_build_object('total', 0, 'reviewed', 0, 'mastered', 0, 'due', 0),
      'activity', '[]'::json
    );
  end if;

  -- Profil + level saat ini.
  select json_build_object(
    'total_xp', coalesce(p.total_xp, 0),
    'streak_days', coalesce(p.streak_days, 0),
    'level_code', l.code,
    'level_name', l.name
  )
  into v_profile
  from public.profiles p
  left join public.levels l on l.id = p.current_level_id
  where p.id = v_uid;

  -- Mastery kosakata & kanji per level N5..N1 (level_id 1..5).
  with lv as (
    select generate_series(1, 5) as level_id
  ),
  vt as (
    select level_id, count(*)::int as total from public.vocab where level_id between 1 and 5 group by level_id
  ),
  kt as (
    select level_id, count(*)::int as total from public.kanji where level_id between 1 and 5 group by level_id
  ),
  vk as (
    select v.level_id, count(*)::int as known
    from public.user_item_progress uip
    join public.vocab v on v.id = uip.item_id
    where uip.user_id = v_uid and uip.item_type = 'vocab'
    group by v.level_id
  ),
  kk as (
    select k.level_id, count(*)::int as known
    from public.user_item_progress uip
    join public.kanji k on k.id = uip.item_id
    where uip.user_id = v_uid and uip.item_type = 'kanji'
    group by k.level_id
  )
  select json_agg(json_build_object(
    'level_id', lv.level_id,
    'vocab_total', coalesce(vt.total, 0),
    'vocab_known', coalesce(vk.known, 0),
    'kanji_total', coalesce(kt.total, 0),
    'kanji_known', coalesce(kk.known, 0)
  ) order by lv.level_id)
  into v_levels
  from lv
  left join vt on vt.level_id = lv.level_id
  left join kt on kt.level_id = lv.level_id
  left join vk on vk.level_id = lv.level_id
  left join kk on kk.level_id = lv.level_id;

  -- Ringkasan SRS.
  select json_build_object(
    'total', (select count(*)::int from public.flashcards),
    'reviewed', (select count(*)::int from public.user_flashcard_progress where user_id = v_uid),
    'mastered', (select count(*)::int from public.user_flashcard_progress where user_id = v_uid and interval_days >= 35),
    'due', (select count(*)::int from public.user_flashcard_progress where user_id = v_uid and next_review_at <= now())
  )
  into v_srs;

  -- Heatmap aktivitas: gabungan tanggal dari tiga sumber, dihitung per hari.
  with act as (
    select known_at::date as d from public.user_item_progress where user_id = v_uid and known_at is not null
    union all
    select last_reviewed_at::date from public.user_flashcard_progress where user_id = v_uid and last_reviewed_at is not null
    union all
    select answered_at::date from public.quiz_results where user_id = v_uid and answered_at is not null
  )
  select coalesce(json_agg(json_build_object('d', to_char(d, 'YYYY-MM-DD'), 'n', n) order by d), '[]'::json)
  into v_activity
  from (
    select d, count(*)::int as n
    from act
    where d >= (now() at time zone 'utc')::date - (v_days - 1)
    group by d
  ) g;

  return json_build_object(
    'profile', coalesce(v_profile, json_build_object('total_xp', 0, 'streak_days', 0, 'level_code', null, 'level_name', null)),
    'levels', coalesce(v_levels, '[]'::json),
    'srs', v_srs,
    'activity', v_activity
  );
end;
$function$;
