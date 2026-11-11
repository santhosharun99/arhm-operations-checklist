# ARHM Operations Checklist

A responsive checklist for the Assam Rifles Half Marathon, with separate Race Day and Bib Expo modes, route references, biker assignments, and the team contact directory.

## Shared use

The site is hosted on GitHub Pages. Checklist records are cached on the device and stored in Supabase. Pending edits retry when the connection returns, and signed-in devices sync through Supabase Realtime. Sign in with the same email and password on your phone and laptop.

The site is sign-in only; public sign-ups are disabled. An administrator provisions the account in Supabase under **Authentication → Users → Add user**. Manage the password through Supabase Auth; do not create a table containing plain-text passwords. Sign in with that account on every device.

## Data protection

The repository contains only the site code. Checklist details are stored in the Supabase table `public.arhm_sync_records`. Row Level Security limits access to the user ID on the signed-in session. The browser uses only the Supabase publishable key; no service-role key is included here.

Export checklist status and keep a separate record of important contact details. The Supabase Free plan may pause projects after a week of low activity, so open the app and confirm sync shortly before event day.

## Local copy

You may still open the standalone checklist file for offline, device-local use. That copy does not sync with the hosted site.
