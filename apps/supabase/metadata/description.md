# Supabase

Supabase is an open source Firebase alternative. It provides all the backend services you need to build a product.

## Features

### PostgreSQL Database
Every Supabase project comes with a full Postgres database, the world's most trusted relational database.

### Authentication
Add user sign ups and logins, securing your data with Row Level Security.

### Auto-generated APIs
Instantly auto-generate RESTful APIs from your database schema. No code required.

### Realtime
Listen to database changes and broadcast data to authorized clients.

### Storage
Store and serve large files. Control access with Row Level Security policies.

### Edge Functions
Deploy serverless functions globally to execute custom business logic.

### Studio Dashboard
Manage your database, authentication, storage, and more from a beautiful web interface.

## Getting Started

After installation, you can access Supabase Studio through the configured port (default: 8000).

### Initial Setup

1. Access the Supabase Studio dashboard
2. Use the dashboard credentials you configured during installation
3. Create your first project
4. Start building your database schema
5. Use the auto-generated API keys in your applications

### API Keys

Two types of API keys are configured:

- **Anon Key**: Safe to use in browsers and mobile apps (public access)
- **Service Role Key**: Full access to bypass Row Level Security (keep secret, server-side only)

### Database Connection

Connect to your PostgreSQL database using:
- Host: `supabase-db`
- Port: `5432`
- Database: As configured in settings
- User/Password: As configured in settings

## Security Notes

- Keep your Service Role Key secret - it has full database access
- Always use Row Level Security policies to protect your data
- The Dashboard Password should be strong and kept secure
- Configure SMTP settings to enable email features

## Documentation

For full documentation, visit [supabase.com/docs](https://supabase.com/docs)

## Community

- GitHub: [github.com/supabase/supabase](https://github.com/supabase/supabase)
- Discord: [discord.supabase.com](https://discord.supabase.com)
- Twitter: [@supabase](https://twitter.com/supabase)
