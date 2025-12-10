# Strapi - Open Source Headless CMS

Strapi is a Node.js headless CMS for building REST and GraphQL APIs that connect to any frontend, mobile app, or service. Model content visually, manage media, extend with plugins, and deliver structured content anywhere.

## Key Features

- **Flexible content modeling**: Build collection and single types through the Content Type Builder.
- **API ready**: Automatic REST and optional GraphQL APIs, with role-based permissions.
- **Media library**: Upload, transform, and organize media with local or remote providers.
- **Customization**: Extend controllers, routes, and middlewares; add plugins and webhooks.
- **Localization and workflow**: Internationalization, draft/publish, and review workflows.
- **Secure access**: Admin panel auth, API tokens, and granular RBAC.

## Deployment Notes

- Uses the `naskio/strapi:5.30.1` community image (supports Strapi v4/v5) and PostgreSQL 16 for persistence.
- Strapi project files persist in `${APP_DATA_DIR}/app`; PostgreSQL data persists in `${APP_DATA_DIR}/postgres`.
- Required secrets: `APP_KEYS`, `API_TOKEN_SALT`, `ADMIN_JWT_SECRET`, and `JWT_SECRET`. Generate strong values (e.g., `openssl rand -hex 32`) and keep them safe.
- Database credentials come from the app form fields and are injected into both containers.

## First-Time Setup

1) Deploy the app and wait for Strapi to finish installing into the mounted `/srv/app` volume.
2) Visit the Strapi URL on port 1337 to create the first admin user.
3) Configure content types, roles/permissions, and API tokens as needed.
4) Back up `${APP_DATA_DIR}/app` (project files/uploads) and `${APP_DATA_DIR}/postgres` regularly.
