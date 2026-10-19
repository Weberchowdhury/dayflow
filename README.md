# Dayflow — Google sign-in + cloud sync

This is the static HTML/CSS/JavaScript Dayflow app, connected to Supabase Auth and a per-user cloud data row.

## 1. Database setup (required)

1. Open the Supabase project used by Dayflow.
2. Open **SQL Editor** → **New query**.
3. Open `supabase-setup.sql` from this folder, copy all its contents into the SQL Editor, and click **Run**.
4. Confirm the `dayflow_data` table was created under **Table Editor**.

The SQL enables Row Level Security and adds policies so authenticated users can only access the row whose `user_id` matches their own account.

## 2. Supabase Auth settings

In **Authentication → URL Configuration**:

- Site URL: `https://dayflow-gules-two.vercel.app`
- Redirect URL allow-list: `https://dayflow-gules-two.vercel.app/**`

In **Authentication → Sign In / Providers → Google**, ensure Google is enabled and the Client ID/Secret are saved. In Google Cloud, the authorized redirect URI must be:

`https://tamtnugcnbyqqjxqzmab.supabase.co/auth/v1/callback`

If Google OAuth is still in Testing mode, add the Google accounts you want to test under Google Auth Platform → Audience → Test users.

## 3. Deploy the updated app

1. Replace the `index.html` in your existing GitHub repository with this folder's `index.html`.
2. Add `supabase-setup.sql` and this `README.md` to the repository root too.
3. Commit and push the changes. Vercel should redeploy automatically.
4. Open `https://dayflow-gules-two.vercel.app` and click **Continue with Google**.
5. Sign in and test by adding a task or note, refresh the page, and confirm the data remains. Sign out and sign in again to test account separation.

## Security notes

- The Supabase URL and publishable key are designed for browser use. The publishable key is not a password.
- Never put the Google Client Secret or Supabase `service_role`/secret key in `index.html` or GitHub.
- Do not remove the RLS policies. They protect each user's cloud row.
- This version syncs the app's tasks, habits, notes, history, streak and focus-minute state as one JSON record per account. The running focus timer itself is not synchronized.
- Data already in a browser is copied to the cloud on the first sign-in for that browser/account if no cloud record exists yet. Once a cloud record exists, it becomes the source for that account.

## Run locally

Open `index.html` in a browser. Google OAuth redirects back to the local origin, so for local testing use a local web server and add its URL to Supabase's redirect allow-list if needed.
