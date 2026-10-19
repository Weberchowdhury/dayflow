# Dayflow

A responsive, browser-based personal productivity dashboard built with HTML, CSS, and JavaScript.

## Run locally
Open `index.html` in a browser.

## Deploy publicly with GitHub + Vercel
1. Create a **public** GitHub repository named `dayflow`.
2. Upload `index.html` and this `README.md` to the repository root, then commit the changes.
3. In Vercel, choose **Add New → Project**, import the `dayflow` GitHub repository, and deploy.
4. Since this is a static HTML app, choose **Other** / no framework preset if asked. No build command or output directory is needed; leave build settings blank when Vercel permits it.
5. Once deployment finishes, open the generated `*.vercel.app` URL and share it.

## Features
- Add, complete, delete, filter, and search tasks
- Categorize tasks as Work, Learning, and Personal
- Daily habit tracker
- Focus timer with 25-minute focus and 5/15-minute break modes
- Quick notes with automatic local saving
- Daily progress summary and weekly calendar
- Responsive layout for desktop and mobile

## Important data note
This first version stores each user's data in that user's browser (`localStorage`). Publishing the app makes the interface public, but it does not create accounts or cloud synchronization. Users' data stays separate in their own browsers. Clearing browser storage can remove it.
