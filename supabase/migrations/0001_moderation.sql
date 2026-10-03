-- =============================================================================
-- CRYPT moderation, premium and reporting backend
-- =============================================================================
--
-- Run this once in the Supabase SQL editor (Dashboard -> SQL Editor -> New query).
-- It is idempotent enough to re-run safely.
--
-- BEFORE RUNNING
--   1. Dashboard -> Authentication -> enable the Email provider.
--   2. Dashboard -> Authentication -> Sign In / Providers -> Email:
--        turn OFF "Confirm email" and leave "Allow signups" ON.
--      CRYPT does not use real email addresses. Every account signs in with a
--      synthetic address of the form <username>@crypt.invalid, so nothing is
--      ever delivered and no confirmation is required.
--
-- WHY THIS FILE MATTERS
--   Without a Supabase session every request used to be anonymous, so
--   auth.uid() was null and Postgres could not tell an admin from anybody
--   else. These policies and functions all depend on a real signed-in user.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. Account flags on public.users
-- -----------------------------------------------------------------------------

alter table public.users
  add column if not exists is_admin    boolean not null default false,
  add column if not exists is_premium  boolean not null default false,
  add column if not exists is_banned   boolean not null default false,
  add column if not exists banned_at      timestamptz,
  add column if not exists banned_reason   text,
  add column if not exists premium_since   timestamptz;

-- The users table was created by hand in the dashboard, so created_at is not
-- guaranteed to exist. admin_search_users() returns it, so make sure it does.
alter table public.users
  add column if not exists created_at timestamptz not null default now();

create index if not exists users_username_idx
  on public.users (username);

-- -----------------------------------------------------------------------------
-- 2. Link auth.uid() to a public.users row
--
-- public.users has no auth_user_id column, so add one and backfill existing
-- rows by matching the synthetic email address.
-- -----------------------------------------------------------------------------

alter table public.users
  add column if not exists auth_user_id uuid;

update public.users u
   set auth_user_id = a.id
  from auth.users a
 where u.auth_user_id is null
   and a.email = u.username || '@crypt.invalid';

create unique index if not exists users_auth_user_id_idx
  on public.users (auth_user_id)
  where auth_user_id is not null;

-- -----------------------------------------------------------------------------
-- 3. Reports
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
-- 4. Payment proofs
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
-- 5. Private storage buckets for screenshots and payment proofs
--
-- Both are private: no public URLs, downloads go through signed URLs that only
-- an admin can mint.
-- -----------------------------------------------------------------------------

insert into storage.buckets (id, name, public)
values ('report-screenshots', 'report-screenshots', false)
on conflict (id) do nothing;

insert into storage.buckets (id, name, public)
values ('payment-proofs', 'payment-proofs', false)
on conflict (id) do nothing;

-- -----------------------------------------------------------------------------
-- 6. Helper: is the signed-in user an admin?
--
-- SECURITY DEFINER so it can read the flag on public.users even though the
-- caller is not allowed to select from that table directly.
-- -----------------------------------------------------------------------------

create or replace function public.is_admin()
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

-- -----------------------------------------------------------------------------
-- 7. Helper: the caller's public username
-- -----------------------------------------------------------------------------

create or replace function public.current_username()
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
-- 8. RLS on public.users
--
-- Before this file every client could read every column of every row, including
-- password_hash and password_salt, using the publishable key from the APK.
-- Direct reads are now limited to your own row.
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

-- -----------------------------------------------------------------------------
-- 9. Public identity lookup
--
-- Signing in on a new device needs another account's public key, its encrypted
-- identity backup, and the password salt, because the salt is an input to the
-- key derivation that unlocks the backup.
--
-- password_salt is included deliberately. A salt is not a secret: it exists
-- precisely to be stored in the clear next to a hash, and on its own it gives
-- an attacker nothing. password_hash is NOT included, and never should be,
-- because it is the thing worth attacking offline.
--
-- The client no longer needs password_hash at all, because Supabase Auth now
-- verifies the password server-side.
-- -----------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------
-- 10. RLS on reports
-- -----------------------------------------------------------------------------

alter table public.reports enable row level security;

-- You may only file a report under your own username.
drop policy if exists reports_insert_own on public.reports;
create policy reports_insert_own
  on public.reports
  for insert
  to authenticated
  with check (
    reporter_username = public.current_username()
  );

-- You may read back your own reports.
drop policy if exists reports_select_own on public.reports;
create policy reports_select_own
  on public.reports
  for select
  to authenticated
  using (
    reporter_username = public.current_username()
    or public.is_admin()
  );

-- Clients never update or delete; admins go through the RPCs below.
revoke update, delete on public.reports from authenticated;

-- -----------------------------------------------------------------------------
-- 11. RLS on payment_proofs
-- -----------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------
-- 12. Storage policies
--
-- Each user writes only into a folder named after their own username.
-- -----------------------------------------------------------------------------

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

-- No client reads objects directly at all. Admins mint signed URLs instead.
drop policy if exists report_screenshots_read on storage.objects;
drop policy if exists payment_proofs_read on storage.objects;

-- -----------------------------------------------------------------------------
-- 13. Privileged operations
--
-- Every function below is SECURITY DEFINER and re-checks is_admin() inside the
-- function body. A patched or repackaged app that calls these directly is still
-- rejected, because the check happens in the database, not in Dart.
-- -----------------------------------------------------------------------------

-- 13a. Your own account flags, and nothing else.
create or replace function public.my_account_flags()
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

-- 13b. Grant or revoke premium.
create or replace function public.admin_set_premium(
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

-- 13c. Ban or unban. Bans are reversible and keep the row.
create or replace function public.admin_set_ban(
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

-- 13d. Reports queue.
create or replace function public.admin_list_reports(
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

-- 13e. Move a report along.
create or replace function public.admin_set_report_status(
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

-- 13f. Payment proof queue.
create or replace function public.admin_list_payment_proofs(
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

-- 13g. Approve or reject a payment proof. Approving grants premium in the
--      same transaction, so the two can never disagree.
create or replace function public.admin_review_payment_proof(
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

  -- Already handled: do not let a second tap grant premium twice.
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

-- 13h. User search for the admin panel. Returns only non-sensitive columns.
create or replace function public.admin_search_users(
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

-- 13i. Mint a short-lived signed URL so an admin can view an attachment.
create or replace function public.admin_signed_url(
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
-- 14. Make yourself the first admin
--
-- Run this AFTER you have signed up and logged in once, replacing the
-- username. This is the only step that is not enforced by RLS, because there
-- is by definition no admin yet.
-- -----------------------------------------------------------------------------
--
--   update public.users set is_admin = true where username = 'your_username';
--
-- From then on, is_admin can only be changed through the database or the
-- service_role key. There is deliberately no RPC that grants admin, so a
-- compromised client cannot promote itself.

-- 13j. Admin access code
--
-- Lets an administrator unlock the admin panel by typing a code in Settings.
-- The code is compared here, in the database, and is never shipped inside the
-- APK. A password compiled into the app can be pulled out with apktool in
-- about a minute, so the app deliberately does not contain one.
--
-- The code is stored only as a bcrypt hash. Setting or changing it is done
-- from the SQL editor or the service_role key; there is no RPC that writes it,
-- so no client can set or read the code.
--
-- Repeated failures are throttled with a rolling window to make guessing
-- impractical.
--
-- To set the code, run this yourself after the migration:
--
--   select crypt('put your code here', gen_salt('bf'));
--
-- then paste the result into the update below.

create extension if not exists pgcrypto;

create table if not exists public.admin_access (
  id            boolean primary key default true check (id),
  code_hash     text        not null,
  updated_at    timestamptz not null default now(),
  failed_at     timestamptz,
  failed_count  integer     not null default 0
);

create or replace function public.admin_unlock(
  access_code text
)
returns boolean
language plpgsql
security definer
set search_path = public, extensions
as $$
declare
  v_row     public.admin_access;
  v_ok      boolean := false;
  v_user    text;
begin
  if access_code is null or btrim(access_code) = '' then
    return false;
  end if;

  v_user := public.current_username();

  if v_user is null then
    return false;
  end if;

  select * into v_row
    from public.admin_access
   where id
   for update;

  if not found then
    return false;
  end if;

  -- Throttle: after 5 failures, require 15 minutes to pass.
  if v_row.failed_count >= 5
     and v_row.failed_at is not null
     and now() - v_row.failed_at < interval '15 minutes' then
    return false;
  end if;

  v_ok := (v_row.code_hash = crypt(access_code, v_row.code_hash));

  if not v_ok then
    update public.admin_access
       set failed_count = failed_count + 1,
           failed_at     = now()
     where id;

    return false;
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
    raise exception 'no account row for this session';
  end if;

  return true;
end;
$$;

revoke all on function public.admin_unlock(text) from public;
grant execute on function public.admin_unlock(text) to authenticated;

-- Convenience counts for the admin panel badges.
create or replace function public.admin_pending_counts()
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
-- End of migration
-- =============================================================================
