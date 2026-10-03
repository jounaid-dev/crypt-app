-- =============================================================================
-- CRYPT admin database: full reset and rebuild
-- =============================================================================
-- Paste the ENTIRE file into Supabase -> SQL Editor -> Run.
--
-- DROP PHASE: removes every CRYPT object (policies, view,
-- functions, reports/payment_proofs/admin_access tables) in
-- dependency order, so the create phase starts from a clean
-- slate no matter what is currently in the database.
--
-- User accounts in public.users are NOT deleted. Uploaded
-- files in the storage buckets are NOT deleted. Only the
-- reports, payment proofs and admin access rows are removed.
--
-- The ONLY thing you edit is the access code in the
-- "SET YOUR ADMIN CODE" section near the bottom. The string
-- CHANGE-THIS-TEXT inside the function bodies is a sentinel
-- that detects a code that was never set. Do not
-- search-and-replace the whole file.
-- =============================================================================

-- =============================================================================
-- DROP PHASE
-- =============================================================================

-- Policies call the functions, so they must be dropped
-- before the functions can be dropped.
drop policy if exists users_select_own on public.users;
drop policy if exists users_insert_own on public.users;
drop policy if exists users_update_own on public.users;

drop policy if exists reports_insert_own on public.reports;
drop policy if exists reports_select_own on public.reports;

drop policy if exists payment_proofs_insert_own on public.payment_proofs;
drop policy if exists payment_proofs_select_own on public.payment_proofs;

drop policy if exists report_screenshots_insert_own on storage.objects;
drop policy if exists payment_proofs_insert_own on storage.objects;
drop policy if exists report_screenshots_read on storage.objects;
drop policy if exists payment_proofs_read on storage.objects;

drop view if exists public.user_public_identity;

-- The report and proof listing functions return these
-- tables' row types, so the tables cannot be dropped until
-- the functions are gone.
drop function if exists public.admin_unlock(text);
drop function if exists public.admin_access_state();
drop function if exists public.admin_pending_counts();
drop function if exists public.admin_set_premium(text, boolean);
drop function if exists public.admin_set_ban(text, boolean, text);
drop function if exists public.admin_list_reports(text);
drop function if exists public.admin_set_report_status(uuid, text, text);
drop function if exists public.admin_list_payment_proofs(text);
drop function if exists public.admin_review_payment_proof(uuid, text, text);
drop function if exists public.admin_search_users(text);
drop function if exists public.admin_signed_url(text, text);
drop function if exists public.my_account_flags();
drop function if exists public.is_admin();
drop function if exists public.current_username();

drop table if exists public.reports;
drop table if exists public.payment_proofs;
drop table if exists public.admin_access;

-- =============================================================================
-- CREATE PHASE
-- =============================================================================

create extension if not exists pgcrypto;

-- -----------------------------------------------------------------------------
-- 1. Account flags on public.users
-- -----------------------------------------------------------------------------

alter table public.users
  add column if not exists is_admin      boolean not null default false,
  add column if not exists is_premium    boolean not null default false,
  add column if not exists is_banned     boolean not null default false,
  add column if not exists banned_at     timestamptz,
  add column if not exists banned_reason text,
  add column if not exists premium_since timestamptz,
  add column if not exists created_at    timestamptz not null default now(),
  add column if not exists auth_user_id  uuid;

create index if not exists users_username_idx
  on public.users (username);

-- -----------------------------------------------------------------------------
-- 1b. Remove duplicate account rows
--
-- Two rows for the same login break the unique index below.
-- Keep exactly one row per auth_user_id and one row per
-- username. The kept row is the one carrying admin or premium
-- flags, else the newest signup. Chats, reports and payment
-- proofs are never touched.
-- -----------------------------------------------------------------------------

delete from public.users
where auth_user_id is not null
  and ctid not in (
    select ctid from (
      select ctid,
             row_number() over (
               partition by auth_user_id
               order by (is_admin::int + is_premium::int) desc,
                        created_at desc,
                        ctid desc
             ) as rn
      from public.users
      where auth_user_id is not null
    ) ranked
    where rn = 1
  );

delete from public.users
where username is not null
  and ctid not in (
    select ctid from (
      select ctid,
             row_number() over (
               partition by username
               order by (is_admin::int + is_premium::int) desc,
                        created_at desc,
                        ctid desc
             ) as rn
      from public.users
      where username is not null
    ) ranked
    where rn = 1
  );

-- -----------------------------------------------------------------------------
-- 1c. Link auth.uid() to a public.users row
--
-- Fills at most one row per username, and only when no row
-- with that username is already linked and the auth account
-- itself is not already linked to a different row, so
-- re-running this on any database state can never create a
-- duplicate link.
-- -----------------------------------------------------------------------------

update public.users u
   set auth_user_id = a.id
  from auth.users a
 where u.auth_user_id is null
   and a.email = u.username || '@crypt.invalid'
   and u.ctid = (
     select min(u3.ctid)
       from public.users u3
      where u3.username = u.username
        and u3.auth_user_id is null
   )
   and not exists (
     select 1
       from public.users u2
      where u2.username = u.username
        and u2.auth_user_id is not null
   )
   and not exists (
     select 1
       from public.users u2
      where u2.auth_user_id = a.id
        and u2.ctid <> u.ctid
   );

create unique index if not exists users_auth_user_id_idx
  on public.users (auth_user_id)
  where auth_user_id is not null;

-- -----------------------------------------------------------------------------
-- 2. Reports
-- -----------------------------------------------------------------------------

create table if not exists public.reports (
  id                uuid primary key default gen_random_uuid(),
  reporter_username text        not null,
  reported_username text,
  category          text        not null
                    check (category in ('bug', 'abuse', 'spam', 'other')),
  details           text        not null,
  screenshots       text[]      not null default '{}',
  status            text        not null default 'open'
                    check (status in ('open', 'reviewing', 'resolved', 'dismissed')),
  admin_note        text,
  created_at        timestamptz not null default now(),
  resolved_at       timestamptz,
  resolved_by       text
);

create index if not exists reports_status_created_idx
  on public.reports (status, created_at desc);

create index if not exists reports_reporter_idx
  on public.reports (reporter_username);

-- -----------------------------------------------------------------------------
-- 3. Payment proofs
-- -----------------------------------------------------------------------------

create table if not exists public.payment_proofs (
  id           uuid primary key default gen_random_uuid(),
  username     text        not null,
  amount       numeric     not null check (amount > 0),
  method       text        not null,
  reference    text        not null,
  note         text,
  proof_path   text        not null,
  status       text        not null default 'pending'
               check (status in ('pending', 'approved', 'rejected')),
  admin_note   text,
  created_at   timestamptz not null default now(),
  reviewed_at  timestamptz,
  reviewed_by  text
);

create index if not exists payment_proofs_status_created_idx
  on public.payment_proofs (status, created_at desc);

create index if not exists payment_proofs_username_idx
  on public.payment_proofs (username);

-- -----------------------------------------------------------------------------
-- 4. Private storage buckets for screenshots and payment proofs
-- -----------------------------------------------------------------------------

insert into storage.buckets (id, name, public)
values ('report-screenshots', 'report-screenshots', false)
on conflict (id) do nothing;

insert into storage.buckets (id, name, public)
values ('payment-proofs', 'payment-proofs', false)
on conflict (id) do nothing;

-- -----------------------------------------------------------------------------
-- 5. Helpers
-- -----------------------------------------------------------------------------

drop function if exists public.is_admin();

create function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public, extensions
as $$
  select coalesce(
    (select u.is_admin
       from public.users u
      where u.auth_user_id = auth.uid()),
    false
  );
$$;

revoke all on function public.is_admin() from public;
grant execute on function public.is_admin() to authenticated;

drop function if exists public.current_username();

create function public.current_username()
returns text
language sql
stable
security definer
set search_path = public, extensions
as $$
  select u.username
    from public.users u
   where u.auth_user_id = auth.uid();
$$;

revoke all on function public.current_username() from public;
grant execute on function public.current_username() to authenticated;

-- -----------------------------------------------------------------------------
-- 6. Row level security
-- -----------------------------------------------------------------------------

alter table public.users enable row level security;

drop policy if exists users_select_own on public.users;
create policy users_select_own
  on public.users
  for select
  to authenticated
  using (auth_user_id = auth.uid());

drop policy if exists users_insert_own on public.users;
create policy users_insert_own
  on public.users
  for insert
  to authenticated
  with check (auth_user_id = auth.uid());

drop policy if exists users_update_own on public.users;
create policy users_update_own
  on public.users
  for update
  to authenticated
  using (auth_user_id = auth.uid())
  with check (auth_user_id = auth.uid());

drop view if exists public.user_public_identity;

create view public.user_public_identity
with (security_invoker = on)
as
  select username,
         public_id,
         public_key,
         public_signing_key,
         encrypted_identity,
         password_salt
    from public.users;

grant select on public.user_public_identity to authenticated;

alter table public.reports enable row level security;

drop policy if exists reports_insert_own on public.reports;
create policy reports_insert_own
  on public.reports
  for insert
  to authenticated
  with check (
    reporter_username = public.current_username()
  );

drop policy if exists reports_select_own on public.reports;
create policy reports_select_own
  on public.reports
  for select
  to authenticated
  using (
    reporter_username = public.current_username()
    or public.is_admin()
  );

revoke update, delete on public.reports from authenticated;

alter table public.payment_proofs enable row level security;

drop policy if exists payment_proofs_insert_own on public.payment_proofs;
create policy payment_proofs_insert_own
  on public.payment_proofs
  for insert
  to authenticated
  with check (username = public.current_username());

drop policy if exists payment_proofs_select_own on public.payment_proofs;
create policy payment_proofs_select_own
  on public.payment_proofs
  for select
  to authenticated
  using (
    username = public.current_username()
    or public.is_admin()
  );

revoke update, delete on public.payment_proofs from authenticated;

drop policy if exists report_screenshots_insert_own
  on storage.objects;
create policy report_screenshots_insert_own
  on storage.objects
  for insert
  to authenticated
  with check (
    bucket_id = 'report-screenshots'
    and (storage.foldername(name))[1] = public.current_username()
  );

drop policy if exists payment_proofs_insert_own
  on storage.objects;
create policy payment_proofs_insert_own
  on storage.objects
  for insert
  to authenticated
  with check (
    bucket_id = 'payment-proofs'
    and (storage.foldername(name))[1] = public.current_username()
  );

drop policy if exists report_screenshots_read on storage.objects;
drop policy if exists payment_proofs_read on storage.objects;

-- -----------------------------------------------------------------------------
-- 7. Your own account flags, and nothing else
-- -----------------------------------------------------------------------------

drop function if exists public.my_account_flags();

create function public.my_account_flags()
returns table (username text, is_premium boolean, is_banned boolean,
               banned_reason text, is_admin boolean)
language sql
stable
security definer
set search_path = public, extensions
as $$
  select u.username, u.is_premium, u.is_banned, u.banned_reason, u.is_admin
    from public.users u
   where u.auth_user_id = auth.uid();
$$;

revoke all on function public.my_account_flags() from public;
grant execute on function public.my_account_flags() to authenticated;

-- -----------------------------------------------------------------------------
-- 8. Privileged admin operations
--
-- Every function is SECURITY DEFINER and re-checks is_admin()
-- inside the function body, so a patched or repackaged app
-- that calls these directly is still rejected by the database.
-- -----------------------------------------------------------------------------

drop function if exists public.admin_set_premium(text, boolean);

create function public.admin_set_premium(
  target_username text,
  premium        boolean
)
returns void
language plpgsql
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  if target_username is null or btrim(target_username) = '' then
    raise exception 'username is required';
  end if;

  update public.users
     set is_premium    = premium,
         premium_since = case when premium then now() else null end
   where username = btrim(target_username);

  if not found then
    raise exception 'no such user: %', target_username;
  end if;
end;
$$;

revoke all on function public.admin_set_premium(text, boolean) from public;
grant execute on function public.admin_set_premium(text, boolean) to authenticated;

drop function if exists public.admin_set_ban(text, boolean, text);

create function public.admin_set_ban(
  target_username text,
  banned         boolean,
  reason         text default null
)
returns void
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  v_admin text;
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  select public.current_username() into v_admin;

  if target_username = v_admin then
    raise exception 'an admin cannot ban themselves';
  end if;

  update public.users
     set is_banned      = banned,
         banned_at      = case when banned then now() else null end,
         banned_reason  = case when banned then reason else null end
   where username = btrim(target_username);

  if not found then
    raise exception 'no such user: %', target_username;
  end if;
end;
$$;

revoke all on function public.admin_set_ban(text, boolean, text) from public;
grant execute on function public.admin_set_ban(text, boolean, text) to authenticated;

drop function if exists public.admin_list_reports(text);

create function public.admin_list_reports(
  status_filter text default null
)
returns setof public.reports
language plpgsql
stable
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  return query
    select r.*
      from public.reports r
     where status_filter is null or r.status = status_filter
     order by r.created_at desc;
end;
$$;

revoke all on function public.admin_list_reports(text) from public;
grant execute on function public.admin_list_reports(text) to authenticated;

drop function if exists public.admin_set_report_status(uuid, text, text);

create function public.admin_set_report_status(
  report_id  uuid,
  new_status text,
  note       text default null
)
returns void
language plpgsql
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  if new_status not in ('open', 'reviewing', 'resolved', 'dismissed') then
    raise exception 'invalid status: %', new_status;
  end if;

  update public.reports
     set status      = new_status,
         admin_note  = note,
         resolved_at = case
                         when new_status in ('resolved', 'dismissed')
                         then now()
                         else null
                       end,
         resolved_by = case
                         when new_status in ('resolved', 'dismissed')
                         then public.current_username()
                         else null
                       end
   where id = report_id;

  if not found then
    raise exception 'no such report: %', report_id;
  end if;
end;
$$;

revoke all on function public.admin_set_report_status(uuid, text, text) from public;
grant execute on function public.admin_set_report_status(uuid, text, text) to authenticated;

drop function if exists public.admin_list_payment_proofs(text);

create function public.admin_list_payment_proofs(
  status_filter text default null
)
returns setof public.payment_proofs
language plpgsql
stable
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  return query
    select p.*
      from public.payment_proofs p
     where status_filter is null or p.status = status_filter
     order by p.created_at desc;
end;
$$;

revoke all on function public.admin_list_payment_proofs(text) from public;
grant execute on function public.admin_list_payment_proofs(text) to authenticated;

drop function if exists public.admin_review_payment_proof(uuid, text, text);

create function public.admin_review_payment_proof(
  proof_id   uuid,
  new_status text,
  note       text default null
)
returns void
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  v_proof   public.payment_proofs;
  v_admin   text;
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  if new_status not in ('approved', 'rejected') then
    raise exception 'invalid status: %', new_status;
  end if;

  select public.current_username() into v_admin;

  select * into v_proof
    from public.payment_proofs
   where id = proof_id
   for update;

  if not found then
    raise exception 'no such payment proof: %', proof_id;
  end if;

  -- Already handled: a second tap cannot grant premium twice.
  if v_proof.status <> 'pending' then
    raise exception 'already reviewed';
  end if;

  update public.payment_proofs
     set status      = new_status,
         admin_note  = note,
         reviewed_at = now(),
         reviewed_by = v_admin
   where id = proof_id;

  if new_status = 'approved' then
    update public.users
       set is_premium    = true,
           premium_since = coalesce(premium_since, now())
     where username = v_proof.username;

    if not found then
      raise exception 'no such user: %', v_proof.username;
    end if;
  end if;
end;
$$;

revoke all on function public.admin_review_payment_proof(uuid, text, text) from public;
grant execute on function public.admin_review_payment_proof(uuid, text, text) to authenticated;

drop function if exists public.admin_search_users(text);

create function public.admin_search_users(
  query_text text default null
)
returns table (username text, is_premium boolean, is_banned boolean,
               banned_reason text, is_admin boolean, created_at timestamptz)
language plpgsql
stable
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  return query
    select u.username, u.is_premium, u.is_banned, u.banned_reason,
           u.is_admin, u.created_at
      from public.users u
     where query_text is null
        or btrim(query_text) = ''
        or u.username ilike '%' || btrim(query_text) || '%'
     order by u.username
     limit 200;
end;
$$;

revoke all on function public.admin_search_users(text) from public;
grant execute on function public.admin_search_users(text) to authenticated;

drop function if exists public.admin_signed_url(text, text);

create function public.admin_signed_url(
  bucket_id text,
  object_path text
)
returns text
language plpgsql
stable
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  if bucket_id not in ('report-screenshots', 'payment-proofs') then
    raise exception 'invalid bucket: %', bucket_id;
  end if;

  return storage.create_signed_url(bucket_id, object_path, 300);
end;
$$;

revoke all on function public.admin_signed_url(text, text) from public;
grant execute on function public.admin_signed_url(text, text) to authenticated;

-- -----------------------------------------------------------------------------
-- 9. Admin access code
--
-- The code is stored only as a bcrypt hash. There is no RPC
-- that writes it, so no client can set or read the code.
-- Wrong attempts are throttled with a rolling 15 minute
-- window.
-- -----------------------------------------------------------------------------

create table if not exists public.admin_access (
  id            boolean primary key default true check (id),
  code_hash     text        not null,
  updated_at    timestamptz not null default now(),
  failed_at     timestamptz,
  failed_count  integer     not null default 0
);

-- Dropped first so the return type and parameter name are
-- always exactly what the app calls:
-- admin_unlock(access_code) -> text.
drop function if exists public.admin_unlock(text);

create function public.admin_unlock(
  access_code text
)
returns text
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  v_row          public.admin_access;
  v_user         text;
  v_attempts     integer;
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

  -- No row means the code was never seeded.
  if not found then
    return 'not_configured';
  end if;

  -- Rolling window: only failures inside the last 15 minutes count.
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

  -- The seed was never edited, or the code was stored as plain text.
  if v_row.code_hash is null
     or v_row.code_hash not like '$2%'
     or v_row.code_hash = crypt('CHANGE-THIS-TEXT', v_row.code_hash) then
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

drop function if exists public.admin_access_state();

create function public.admin_access_state()
returns table (
  configured boolean,
  failed_count integer,
  locked_out boolean
)
language plpgsql
stable
security definer
set search_path = public, extensions
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

drop function if exists public.admin_pending_counts();

create function public.admin_pending_counts()
returns table (open_reports bigint, pending_payments bigint)
language plpgsql
stable
security definer
set search_path = public, extensions
as $$
begin
  if not public.is_admin() then
    raise exception 'not authorised';
  end if;

  return query
  select
    (select count(*) from public.reports
      where status in ('open', 'reviewing'))::bigint,
    (select count(*) from public.payment_proofs
      where status = 'pending')::bigint;
end;
$$;

revoke all on function public.admin_pending_counts() from public;
grant execute on function public.admin_pending_counts() to authenticated;

-- =============================================================================
-- SET YOUR ADMIN CODE
-- =============================================================================
-- Replace ONLY the code inside the crypt() call on the marked
-- line below. Leave every other CHANGE-THIS-TEXT in this file
-- untouched: those are sentinels that detect a code that was
-- never set.
-- =============================================================================

insert into public.admin_access (id, code_hash, failed_count, failed_at)
values (
  true,
  crypt('MYADMIN', gen_salt('bf')),  -- <<<< ONLY CHANGE THIS LINE: your code between the quotes
  0,
  null
)
on conflict (id) do update
  set code_hash  = excluded.code_hash,
      updated_at = now(),
      failed_count = 0,
      failed_at = null;

-- =============================================================================
-- VERIFY: must print config_check = ok and a $2a$... hash prefix.
-- =============================================================================

select
  case
    when a.id is null then 'no row'
    when a.code_hash like '$2%'
      and a.code_hash <> crypt('CHANGE-THIS-TEXT', a.code_hash)
      then 'ok'
    else 'placeholder or plain text - the code line above was not replaced'
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

-- =============================================================================
-- End of setup
-- =============================================================================
