create table public.arhm_sync_records (
  user_id uuid not null references auth.users (id) on delete cascade,
  bucket text not null check (bucket in ('race', 'expo', 'contacts', 'bikers', 'places', 'custom_tasks')),
  record_id text not null,
  payload jsonb not null check (jsonb_typeof(payload) = 'object'),
  updated_at timestamptz not null default now(),
  primary key (user_id, bucket, record_id)
);

alter table public.arhm_sync_records enable row level security;
revoke all on table public.arhm_sync_records from anon, authenticated;
grant select, insert, update, delete on table public.arhm_sync_records to authenticated;

create policy "Users manage only their ARHM records"
  on public.arhm_sync_records
  for all
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

alter publication supabase_realtime add table public.arhm_sync_records;
