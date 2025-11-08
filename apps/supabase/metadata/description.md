# Supabase

Supabase is an open source Firebase alternative. Start your project with a Postgres database, Authentication, instant APIs, Realtime subscriptions, and Storage.

## 🚀 Quick Start for Non-Technical Users

**Don't worry about the configuration!** Here's what you need to know:

### For Testing/Learning (Use Defaults)
1. Install the app - **just click install**
2. Leave all fields with their default values
3. Only change the PostgreSQL Password to something you'll remember
4. Click install and you're done!

⚠️ **Default keys are for testing only** - they work but aren't secure for production.

### For Production (Generate Secure Keys)

You need to generate 3 special keys. Here are **3 easy methods**:

#### Method 1: Use Our Simple Generator (Easiest!)
1. Visit: https://supabase.com/docs/guides/self-hosting/docker
2. Scroll to "Generate API Keys"
3. Click "Generate Keys" button
4. Copy the values into Runtipi

#### Method 2: Use Your Computer Terminal
Open Terminal (Mac/Linux) or PowerShell (Windows) and run:

```bash
# Generate JWT Secret (copy this)
openssl rand -base64 32

# For Anon and Service keys, visit https://jwt.io
# Use the JWT secret you just generated
```

#### Method 3: Use JWT.io (Manual but Educational)
1. Go to https://jwt.io
2. In the "Decoded" section, paste this for **Anon Key**:
   ```json
   {
     "iss": "supabase",
     "role": "anon",
     "iat": 1642768000
   }
   ```
3. In "Verify Signature", paste your JWT Secret
4. Copy the "Encoded" token - this is your Anon Key
5. Repeat for **Service Role Key** with:
   ```json
   {
     "iss": "supabase",
     "role": "service_role",
     "iat": 1642768000
   }
   ```

### Configuration Fields Explained

| Field | What to Enter | Example |
|-------|---------------|---------|
| **PostgreSQL Database Name** | Leave default | `supabase` |
| **PostgreSQL User** | Leave default | `supabase` |
| **PostgreSQL Password** | Any strong password | `MyS3cur3P@ssw0rd!` |
| **JWT Secret** | Random 32+ characters | Use generator above |
| **Anon Key** | Public API key (JWT token) | Use generator above |
| **Service Role Key** | Admin API key (JWT token) | Use generator above |
| **Site URL** | Your server address | `http://192.168.1.100:3000` |
| **SMTP (all)** | Leave empty unless you need email | (optional) |

### Finding Your Site URL
- **Local network**: `http://YOUR-SERVER-IP:3000`
- **With domain**: `http://yourdomain.com:3000`
- **Don't know your IP?** Run `hostname -I` on your server

---

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

## After Installation

### 1. Access Supabase Studio
Open your browser to `http://YOUR-SERVER-IP:3000` (or the Site URL you configured)

### 2. Start Building!
The dashboard gives you:
- **Table Editor** - Create database tables visually
- **SQL Editor** - Run custom SQL queries
- **Authentication** - Manage users and auth settings
- **Storage** - Upload and manage files
- **API Docs** - Auto-generated API documentation

### 3. Connect Your App

Use the Supabase JavaScript client:

```bash
npm install @supabase/supabase-js
```

```javascript
import { createClient } from '@supabase/supabase-js'

const supabase = createClient(
  'http://YOUR-SERVER-IP:3000',  // Your Site URL
  'YOUR-ANON-KEY'                 // The Anon Key you configured
)

// Now you can use Supabase!
const { data, error } = await supabase
  .from('your_table')
  .select('*')
```

### Using the APIs

All APIs are accessible through your Site URL:

- **REST API**: `${YOUR_SITE_URL}/rest/v1/`
- **Auth API**: `${YOUR_SITE_URL}/auth/v1/`
- **Realtime**: `${YOUR_SITE_URL}/realtime/v1/`
- **Storage**: `${YOUR_SITE_URL}/storage/v1/`

### API Keys

Two types of API keys are configured:

- **Anon Key**: Safe to use in browsers and mobile apps (respects Row Level Security)
- **Service Role Key**: Full database access bypassing RLS (keep secret, server-side only)

### Direct Database Connection

You can also connect directly to PostgreSQL:
- **Host**: Your server IP
- **Port**: 5432
- **Database**: (what you configured)
- **User/Password**: (what you configured)

## Email Setup (Optional)

To enable email-based authentication:

1. Get SMTP credentials from:
   - Gmail (use App Password)
   - SendGrid (free tier)
   - Mailgun
   - AWS SES

2. Fill in during installation:
   - **SMTP Host**: `smtp.gmail.com` (for Gmail)
   - **SMTP Port**: `587`
   - **SMTP User**: Your email
   - **SMTP Password**: Your email password/app password
   - **SMTP Sender**: `noreply@yourdomain.com`

3. Without SMTP:
   - Sign-ups still work
   - Users won't receive confirmation emails
   - You can manually verify users in Studio

## Security Best Practices

1. **Change default keys before production!**
   - Default values are for testing only
   - Generate new keys for any public-facing deployment

2. **Use strong passwords**
   - PostgreSQL password should be complex
   - Don't reuse passwords from other services

3. **Enable Row Level Security (RLS)**
   - Always protect your tables with RLS policies
   - The Anon Key respects RLS (safe for client-side)
   - The Service Role Key bypasses RLS (never expose!)

4. **Keep Service Role Key secret**
   - Never commit to Git
   - Never use in client-side code
   - Only use on your backend server

5. **Configure CORS properly**
   - By default, CORS allows all origins (`*`)
   - In production, restrict to your domain

## Troubleshooting

### App Won't Start
- Check all required fields are filled
- Make sure PostgreSQL password is at least 8 characters
- Wait 2-3 minutes for all services to initialize

### Can't Access Dashboard
- Verify your Site URL is correct
- Check if port 3000 is accessible
- Try `http://localhost:3000` if on the same machine

### Authentication Not Working
- Verify JWT Secret, Anon Key, and Service Role Key match
- The Anon/Service keys must be signed with your JWT Secret
- Check browser console for error messages

### Need to Reset?
- Uninstall the app from Runtipi
- Reinstall with new configuration
- Your data is preserved unless you delete app data

## Storage

Files are stored in persistent volumes and survive restarts:
- **Database**: Stored in app data directory
- **Uploaded Files**: Stored in storage directory
- **Backups**: Use Runtipi's backup feature

## Learn More

- **Official Docs**: https://supabase.com/docs
- **YouTube Tutorials**: Search "Supabase tutorial"
- **Community**:
  - Discord: https://discord.supabase.com
  - GitHub: https://github.com/supabase/supabase
  - Twitter: @supabase

## Example Projects

Once installed, try these beginner projects:

1. **Todo App** - Create a simple task manager
2. **Blog** - Build a blog with auth and storage
3. **Chat App** - Use Realtime for live messaging
4. **Photo Gallery** - Practice with Storage and ImgProxy

Check Supabase docs for step-by-step tutorials!

---

**Need Help?** Visit the Supabase Discord or Runtipi community forums.
