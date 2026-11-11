-- Applied to the hosted ARHM project on 2026-11-11.
-- Custom task collections use the existing object payload format: {"items": [...] }.
ALTER TABLE public.arhm_sync_records
  DROP CONSTRAINT arhm_sync_records_bucket_check,
  ADD CONSTRAINT arhm_sync_records_bucket_check
    CHECK (bucket IN ('race', 'expo', 'contacts', 'bikers', 'places', 'custom_tasks'));
