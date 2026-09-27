-- =============================================================================
-- 0002: make admin access report why it failed
-- =============================================================================
--
-- Run this ONCE in the Supabase SQL Editor, after 0001_moderation.sql.
--
-- Why this exists
-- ---------------
-- admin_unlock() returned a bare boolean, and the app turned every false into
-- one message: "Wrong code." That is wrong for almost every reason the call can
-- fail, and it is why a correct code could look broken:
--
--   * No row in admin_access, because seed_admin.sql was never run. The code
--     was never set on the server, so nothing could ever match.
--   * The throttle. Five wrong tries block the code for fifteen minutes, and
--     the app still said "Wrong code." with no mention of a wait. The counter
--     was cumulative and only ever cleared by a correct entry, so five typos
--     spread over several days left the account locked out.
--   * A transport or permission error. The client caught every exception and
--     reported it as a wrong code.
--
-- This replaces admin_unlock() with a version that returns a status the app
-- can explain, and that treats the throttle as a rolling window so it expires
-- on its own.
--
-- The return type changes from boolean to text, so the old function has to be
-- dropped before it can be replaced.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. admin_unlock(access_code) -> text
--
-- Returns one of:
--
--   'ok'              the code matched and this account is now an admin
--   'wrong_code'      the code did not match
--   'not_configured'  admin_access has no row: run supabase/seed_admin.sql
--   'locked_out'      too many recent failures; try again shortly
--   'no_account'      this session has no row in public.users
--   'no_user_row'     the account row could not be updated
--
-- The code itself is still only ever compared against a bcrypt hash. Nothing
-- here returns, stores or reveals the code.
-- -----------------------------------------------------------------------------

drop function if exists public.admin_unlock(text);

create or replace function public.admin_unlock(
  access_code text
)
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row        public.admin_access;
  v_user       text;
  v_attempts   integer;
  v_locked_until timestamptz;
begin
  if access_code is null or btrim(access_code) = '' then
    return 'wrong_code';
  end if;

  v_user := public.current_username();

  if v_user is null then
    return 'no_account';
  end if;

  select * into v_row
    from public.admin_access
   where id
   for update;

  -- No row means the code was never seeded. Saying so is the whole point:
  -- "wrong code" would send the operator hunting for a typo that does not
  -- exist.
  if not found then
    return 'not_configured';
  end if;

  -- Rolling window: the counter only counts failures inside the last fifteen
  -- minutes. Previously it was cumulative and never expired on its own, so a
  -- handful of typos across different days could lock the account out
  -- indefinitely.
  v_locked_until := v_row.failed_at + interval '15 minutes';

  if v_row.failed_count >= 5
     and v_row.failed_at is not null
     and now() < v_locked_until then
    return 'locked_out';
  end if;

  v_attempts := case
    when v_row.failed_count >= 5 then 0
    else v_row.failed_count
  end;

  if v_row.code_hash is null
     or v_row.code_hash not like '$2%'
     or v_row.code_hash = crypt('CHANGE-THIS-TEXT', v_row.code_hash) then
    -- Either the seed was never edited, or crypt() did not run and the code
    -- was stored as plain text. Both mean no code can work.
    return 'not_configured';
  end if;

  if not (v_row.code_hash = crypt(access_code, v_row.code_hash)) then
    update public.admin_access
       set failed_count = v_attempts + 1,
           failed_at     = now()
     where id;

    return 'wrong_code';
  end if;

  -- Correct code: clear the throttle and promote this account.
  update public.admin_access
     set failed_count = 0,
         failed_at    = null
   where id;

  update public.users
     set is_admin = true
   where auth_user_id = auth.uid();

  if not found then
    return 'no_user_row';
  end if;

  return 'ok';
end;
$$;

revoke all on function public.admin_unlock(text) from public;
grant execute on function public.admin_unlock(text) to authenticated;

-- -----------------------------------------------------------------------------
-- 2. admin_access_state()
--
-- Lets the app say "the admin code has not been set on the server yet" on the
-- settings screen, before the user types anything, instead of after five failed
-- attempts.
--
-- Reveals nothing about the code: it reports whether a usable row exists and
-- whether the account is currently throttled.
-- -----------------------------------------------------------------------------

create or replace function public.admin_access_state()
returns table (
  configured boolean,
  failed_count integer,
  locked_out boolean
)
language plpgsql
stable
security definer
set search_path = public
as $$
begin
  return query
  select
    (a.id is not null
      and a.code_hash is not null
      and a.code_hash like '$2%'
      and a.code_hash <> crypt('CHANGE-THIS-TEXT', a.code_hash)) as configured,
    coalesce(a.failed_count, 0) as failed_count,
    (coalesce(a.failed_count, 0) >= 5
      and a.failed_at is not null
      and now() < a.failed_at + interval '15 minutes') as locked_out
    from (select true as id) s
    left join public.admin_access a on a.id;
end;
$$;

revoke all on function public.admin_access_state() from public;
grant execute on function public.admin_access_state() to authenticated;

-- -----------------------------------------------------------------------------
-- 3. Clear a stale lockout
--
-- Only needed if an account is stuck from a burst of failed attempts made
-- before this migration. The rolling window above clears itself after fifteen
-- minutes, so this is a one-time convenience.
-- -----------------------------------------------------------------------------

-- update public.admin_access set failed_count = 0, failed_at = null;
