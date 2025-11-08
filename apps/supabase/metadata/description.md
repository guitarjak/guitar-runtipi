# Supabase

Supabase is an open source Firebase alternative. Start your project with a Postgres database, Authentication, instant APIs, Realtime subscriptions, and Storage.

## Features

### PostgreSQL Database
Every Supabase project comes with a full Postgres database with powerful extensions including PostGIS, pg_graphql, and more.

### Authentication
Add user sign ups and logins with GoTrue authentication service. Secure your data with Row Level Security policies and support for multiple auth providers.

### Auto-generated REST APIs
Instantly auto-generate a RESTful API from your database schema using PostgREST. No backend code required.

### Realtime Subscriptions
Listen to database changes in real-time. Subscribe to inserts, updates, and deletes with WebSocket connections.

### File Storage
Store and serve large files with the built-in storage API. Supports image transformations via ImgProxy.

### Supabase Studio Dashboard
Beautiful web interface to manage your entire backend - database tables, authentication, storage, and more.

## Architecture

This installation includes 10 services working together:

- **Supabase Studio** - Management dashboard (main interface)
- **Kong** - API gateway routing all requests
- **GoTrue** - Authentication and user management
- **PostgREST** - Auto-generated REST APIs
- **Realtime** - WebSocket server for subscriptions
- **Storage API** - File storage and retrieval
- **ImgProxy** - On-the-fly image transformations
- **PostgreSQL** - Primary database with Supabase extensions
- **postgres-meta** - Database introspection and management
- **Kong Init** - Configuration setup (runs once)

## Getting Started

After installation, access Supabase Studio through port 3000.

### Initial Setup

1. Access the Supabase Studio dashboard
2. Your database is automatically configured with the credentials you provided
3. Create your first table using the table editor
4. Configure authentication providers if needed
5. Use the auto-generated API keys in your applications

### Using the APIs

All APIs are accessible through the Kong gateway:

- **REST API**: `${SITE_URL}/rest/v1/`
- **Auth API**: `${SITE_URL}/auth/v1/`
- **Realtime**: `${SITE_URL}/realtime/v1/`
- **Storage**: `${SITE_URL}/storage/v1/`

### API Keys

Two types of API keys are configured:

- **Anon Key**: Safe to use in browsers and mobile apps (respects Row Level Security)
- **Service Role Key**: Full database access bypassing RLS (keep secret, server-side only)

### Database Connection

Direct PostgreSQL connection details:
- Host: `supabase-db`
- Port: `5432`
- Database: As configured
- User/Password: As configured

## Client Libraries

Use official Supabase client libraries in your apps:

```javascript
import { createClient } from '@supabase/supabase-js'

const supabase = createClient(
  'YOUR_SITE_URL',
  'YOUR_ANON_KEY'
)
```

## Security Notes

- Keep your Service Role Key secret - it has full database access
- Always use Row Level Security policies to protect your data
- The Anon Key is safe for client-side use when RLS is enabled
- Configure SMTP settings to enable email-based authentication
- Change all default secrets before production use

## Storage

Files are stored in `${APP_DATA_DIR}/storage` and persisted across restarts. Image transformations are handled automatically by ImgProxy.

## Documentation

For full documentation, visit [supabase.com/docs](https://supabase.com/docs)

## Community

- GitHub: [github.com/supabase/supabase](https://github.com/supabase/supabase)
- Discord: [discord.supabase.com](https://discord.supabase.com)
- Twitter: [@supabase](https://twitter.com/supabase)
