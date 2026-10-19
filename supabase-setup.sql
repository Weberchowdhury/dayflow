-- Run this in Supabase Dashboard > SQL Editor > New query.
-- Stores one JSON record per authenticated user. RLS prevents users from reading or changing another user's row.
create table if not exists public.dayflow_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.dayflow_data enable row level security;

-- Recreate policies safely if you run this script more than once.
drop policy if exists "Users can read their own Dayflow data" on public.dayflow_data;
drop policy if exists "Users can insert their own Dayflow data" on public.dayflow_data;
drop policy if exists "Users can update their own Dayflow data" on public.dayflow_data;

create policy "Users can read their own Dayflow data"
  on public.dayflow_data for select
  to authenticated
  using ((select auth.uid()) = user_id);

create policy "Users can insert their own Dayflow data"
  on public.dayflow_data for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

create policy "Users can update their own Dayflow data"
  on public.dayflow_data for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
