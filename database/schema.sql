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

-- The hosted ARHM workspace is shared by manually provisioned sign-in accounts.
-- The stable owner UUID is the existing account that currently holds the canonical checklist.
create policy "ARHM team members share one checklist"
  on public.arhm_sync_records
  for all
  to authenticated
  using (user_id = 'f0391028-3dce-44b4-8b1d-01f63d647a87'::uuid)
  with check (user_id = 'f0391028-3dce-44b4-8b1d-01f63d647a87'::uuid);

alter publication supabase_realtime add table public.arhm_sync_records;
