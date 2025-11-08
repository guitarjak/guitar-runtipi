# Supabase

Supabase is an open source Firebase alternative providing core backend services for building modern applications.

## Features

### PostgreSQL Database
Every Supabase project comes with a full Postgres database, the world's most trusted relational database.

### Authentication
Add user sign ups and logins with JWT-based authentication, securing your data with Row Level Security.

### Auto-generated REST APIs
Instantly auto-generate RESTful APIs from your database schema using PostgREST. No code required.

### Supabase Studio Dashboard
Manage your database, authentication, and more from a beautiful web interface.

## Getting Started

After installation, access Supabase Studio through the configured port (default: 3000).

### Initial Setup

1. Access the Supabase Studio dashboard
2. Create your database schema using the table editor
3. Configure authentication settings
4. Use the auto-generated API keys in your applications

### API Keys

Two types of API keys are configured:

- **Anon Key**: Safe to use in browsers and mobile apps (public access with RLS)
- **Service Role Key**: Full access to bypass Row Level Security (keep secret, server-side only)

### Database Connection

Connect to your PostgreSQL database using:
- Host: `supabase-db`
- Port: `5432`
- Database: As configured in settings
- User/Password: As configured in settings

## Services Included

This installation includes:
- **Supabase Studio**: Web-based management interface
- **GoTrue**: Authentication service
- **PostgREST**: Auto-generated REST APIs
- **PostgreSQL**: Full-featured relational database with Supabase extensions

## Security Notes

- Keep your Service Role Key secret - it has full database access
- Always use Row Level Security policies to protect your data
- The Anon Key is safe for client-side use when RLS is properly configured
- Configure SMTP settings to enable email features (optional)

## Documentation

For full documentation, visit [supabase.com/docs](https://supabase.com/docs)

## Community

- GitHub: [github.com/supabase/supabase](https://github.com/supabase/supabase)
- Discord: [discord.supabase.com](https://discord.supabase.com)
- Twitter: [@supabase](https://twitter.com/supabase)
