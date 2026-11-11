# ARHM Operations Checklist

A responsive checklist for the Assam Rifles Half Marathon, with separate Race Day and Bib Expo modes, route references, biker assignments, and the team contact directory.

## Shared use

The site is hosted on GitHub Pages. Checklist records are stored in Supabase and sync between signed-in devices through Supabase Realtime. Sign in with the same email and password on your phone and laptop.

Before the first account sign-up, set the Supabase project's **Authentication → URL Configuration**:

- **Site URL:** `https://santhosharun99.github.io/arhm-operations-checklist/`
- **Redirect URL:** `https://santhosharun99.github.io/arhm-operations-checklist/**`

Then open the site, choose **Create account**, and confirm the email. Sign in with that account on every device.

## Data protection

The repository contains only the site code. Checklist details are stored in the Supabase table `public.arhm_sync_records`. Row Level Security limits access to the user ID on the signed-in session. The browser uses only the Supabase publishable key; no service-role key is included here.

Export checklist status and keep a separate record of important contact details. The Supabase Free plan may pause projects after a week of low activity, so open the app and confirm sync shortly before event day.

## Local copy

You may still open the standalone checklist file for offline, device-local use. That copy does not sync with the hosted site.
