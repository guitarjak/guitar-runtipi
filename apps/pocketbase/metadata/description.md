# PocketBase - Realtime Backend in One File 🚀

PocketBase is a lightweight, open source backend that ships as a single executable. It bundles an embedded SQLite database, REST and realtime APIs, file storage, authentication, and an admin dashboard out of the box.

## ⭐ Why Use PocketBase?
- Built-in admin UI for managing data, users, and files
- Realtime subscriptions over WebSockets
- Simple REST APIs and SDKs for web/mobile
- SQLite storage with automatic migrations
- File uploads with storage rules and thumbnails
- Hook system for custom business logic

## 📦 What This App Includes
- Official `pocketbase/pocketbase:0.22.13` container
- Persistent volumes for data, public assets, and hook scripts
- Default HTTP port `8090` (exposable in Runtipi)

## 🚀 Getting Started
1. Install the app and expose it if you want remote access.
2. Open the admin UI: `http://YOUR-SERVER-IP:8090/_/`.
3. Create the first admin user (this becomes the owner).
4. Define collections, fields, and access rules.
5. Optionally add custom hooks in `${APP_DATA_DIR}/pb_hooks`.

## 💾 Persistence
- `${APP_DATA_DIR}/pb_data` → PocketBase data (SQLite, migrations, settings)
- `${APP_DATA_DIR}/pb_public` → Public files/assets
- `${APP_DATA_DIR}/pb_hooks` → Custom hook scripts

## 🔒 Notes
- Enable HTTPS/SSL in front of PocketBase for production.
- Back up `${APP_DATA_DIR}/pb_data` regularly; it contains your database.
- First admin is created via the web UI; no default credentials are set.

## 📚 Resources
- Docs: https://pocketbase.io/docs
- Repo: https://github.com/pocketbase/pocketbase
