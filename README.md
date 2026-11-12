# ARHM Operations Checklist

A responsive checklist for the Assam Rifles Half Marathon, built from the detailed master checklist workbook: 11 department pages (438 points) filterable by phase (pre-event, event execution, post-event) and timeline, plus route references, biker assignments, the team contact directory, department heads and the prize-money reference.

Checklist states are stored in the `race` bucket with record IDs `v2:<point id>` (for example `v2:d03-001`); added and removed points use the `master_v2` record in `custom_tasks` and `deleted_tasks`. Records from the earlier Race Day / Bib Expo checklist are left in the database but no longer shown.

## Shared use

The site is hosted on GitHub Pages. Checklist records are cached on the device and stored in Supabase. Pending edits retry when the connection returns, and signed-in devices sync through Supabase Realtime. Sign in with the same email and password on your phone and laptop.

The site is sign-in only; public sign-ups are disabled. An administrator provisions the account in Supabase under **Authentication → Users → Add user**. Manage the password through Supabase Auth; do not create a table containing plain-text passwords. Sign in with that account on every device.

## Data protection

The repository contains only the site code. Checklist details are stored in the Supabase table `public.arhm_sync_records`. Row Level Security limits access to the user ID on the signed-in session. The browser uses only the Supabase publishable key; no service-role key is included here.

Export checklist status and keep a separate record of important contact details. The Supabase Free plan may pause projects after a week of low activity, so open the app and confirm sync shortly before event day.

## Local copy

You may still open the standalone checklist file for offline, device-local use. That copy does not sync with the hosted site.
