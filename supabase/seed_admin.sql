-- =============================================================================
-- CRYPT admin setup: run this ONCE in the Supabase SQL Editor
-- =============================================================================
--
-- Run it AFTER supabase/migrations/0001_moderation.sql
--
-- This does NOT need your username. The access code is all you set here.
-- You type the code into the app afterwards, and the server promotes your
-- account when it matches.
--
-- 1. Replace  CHANGE-THIS-TEXT  below with a code of your choosing.
-- 2. Highlight the whole file and click Run.
-- 3. Sign up in the app.
-- 4. Settings -> Admin access -> type your code.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Store your access code
--
-- Only a bcrypt hash is kept. The code itself is never written to the
-- database, and it is never compiled into the app, so it cannot be read out
-- of the APK.
--
-- To change the code later, run just this statement again with a new code.
-- -----------------------------------------------------------------------------

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
-- admin_access has no is_admin column: that flag lives on public.users, which
-- only exists once you have signed up in the app. This table only holds the
-- code hash and the failed-attempt counter.
--
-- The '$2a$12$...' prefix proves the code was hashed rather than stored as
-- plain text. If you see your real code here, crypt() did not run.
-- -----------------------------------------------------------------------------

select
  id,
  left(code_hash, 7) || '...' as code_start,
  failed_count,
  updated_at
from public.admin_access;

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
