-- Applied to the hosted ARHM project on 2026-11-11.
-- Existing per-account rows remain in place. The app now reads/writes the canonical owner's rows.
DROP POLICY IF EXISTS "Users manage only their ARHM records" ON public.arhm_sync_records;
DROP POLICY IF EXISTS "ARHM team members share one checklist" ON public.arhm_sync_records;
CREATE POLICY "ARHM team members share one checklist"
  ON public.arhm_sync_records
  FOR ALL
  TO authenticated
  USING (user_id = 'f0391028-3dce-44b4-8b1d-01f63d647a87'::uuid)
  WITH CHECK (user_id = 'f0391028-3dce-44b4-8b1d-01f63d647a87'::uuid);
