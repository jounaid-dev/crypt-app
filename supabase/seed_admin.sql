-- =============================================================================
-- CRYPT admin setup: run this ONCE in the Supabase SQL Editor
-- =============================================================================
--
-- Run it AFTER supabase/migrations/0001_moderation.sql
-- and AFTER supabase/migrations/0002_admin_unlock_status.sql.
--
-- This does NOT need your username. The access code is all you set here.
-- You type the code into the app afterwards, and the server promotes your
-- account when it matches.
--
-- 1. Replace  CHANGE-THIS-TEXT  below with a code of your choos
insert into public.admin_access (id, code_hash, failed_count, failed_at)
values (
  true,
  crypt('CHANGE-THIS-TEXT', gen_salt('bf')),
  0,
  null
)
on conflict (id) do update
  set code_hash  = excluded.code_hash,
      updated_at = now(),
      failed_count = 0,
      failed_at = null;

-- -----------------------------------------------------------------------------
-- Confirm it worked.
--
-- Two rows come back.
--
-- config_check must say  ok.  If it says  placeholder  or  no row  then the
-- code is not usable: either the placeholder text above was not replaced, or
-- this file was never run. The app will refuse with
-- "No admin code is set on the server yet" in that case.
--
-- The '$2a$12$...' style hash prefix proves the code was hashed rather than
-- stored as plain text. If you see your real code here, crypt() did not run.
--
-- locked_out should be false. If it is true, the counter below resets it.
-- -----------------------------------------------------------------------------

select
  case
    when a.id is null then 'no row'
    when a.code_hash like '$2%'
      and a.code_hash <> crypt('CHANGE-THIS-TEXT', a.code_hash)
      then 'ok'
    else 'placeholder'
  end as config_check,
  coalesce(a.failed_count, 0) as failed_count,
  case
    when coalesce(a.failed_count, 0) >= 5
      and a.failed_at is not null
      and now() < a.failed_at + interval '15 minutes'
    then true
    else false
  end as locked_out,
  left(a.code_hash, 7) || '...' as code_start
from (select true as id) s
left join public.admin_access a on a.id;

-- -----------------------------------------------------------------------------
-- Reset the failed-attempt counter
--
-- Only needed if you mistyped the code several times and got blocked. The
-- block also lifts on its own after 15 minutes.
-- -----------------------------------------------------------------------------

-- update public.admin_access set failed_count = 0, failed_at = null;

-- =============================================================================
-- Optional: become admin without typing the code
--
-- Only needed if you want to skip the code on the first login. Requires a
-- username, which only exists after you have signed up in the app at least
-- once, so do this last.
-- =============================================================================

-- update public.users set is_admin = true where username = 'your_username';

-- =============================================================================
-- Optional: see which accounts exist
-- =============================================================================

-- select username, is_admin, is_premium, is_banned from public.users;

-- =============================================================================
-- Optional: lock yourself out of your own admin panel
--
-- Only do this if you think someone else has the code.
-- =============================================================================

-- update public.admin_access set failed_count = 5, failed_at = now();
