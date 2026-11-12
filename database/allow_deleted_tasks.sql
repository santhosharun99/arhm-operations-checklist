alter table public.arhm_sync_records drop constraint if exists arhm_sync_records_bucket_check;
alter table public.arhm_sync_records add constraint arhm_sync_records_bucket_check check (bucket in ('race', 'expo', 'contacts', 'bikers', 'places', 'custom_tasks', 'deleted_tasks'));
