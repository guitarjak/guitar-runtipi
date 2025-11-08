# Supabase for Runtipi

Full-featured Supabase installation for Runtipi with PostgreSQL, Authentication, APIs, Realtime, and Storage.

## 🚀 Quick Install (For Non-Technical Users)

### Easy Mode - Use Defaults
1. Click "Install" in Runtipi
2. Only change **PostgreSQL Password** to something secure
3. Leave everything else as default
4. Click Install!

✅ This gets you up and running in 2 minutes for testing/learning.

⚠️ **Important**: Default keys are for testing only. Change them for production!

---

## 🔐 Generate Secure Keys (For Production)

You need 3 special keys for Supabase. Choose your method:

### Method 1: HTML Key Generator (Easiest!)

1. Open `key-generator.html` in your web browser
2. Click "Generate New Keys"
3. Copy all 3 keys to Runtipi
4. Done!

**Features:**
- ✅ Generates all keys instantly
- ✅ Works offline (nothing sent to servers)
- ✅ One-click copy to clipboard
- ✅ No technical knowledge needed

### Method 2: Bash Script

If you prefer command line:

```bash
cd apps/supabase
./generate-keys.sh
```

Then follow the instructions to generate JWT tokens at jwt.io

### Method 3: Manual Generation

**Step 1: Generate JWT Secret**
```bash
openssl rand -base64 32
```

**Step 2 & 3: Create API Keys**
1. Go to https://jwt.io
2. Use the JWT secret from Step 1
3. Generate tokens for "anon" and "service_role" roles
4. (See detailed instructions in description.md)

---

## 📋 Configuration Fields

| Field | Required | Default | Notes |
|-------|----------|---------|-------|
| PostgreSQL Database | ✅ | `supabase` | Leave default |
| PostgreSQL User | ✅ | `supabase` | Leave default |
| PostgreSQL Password | ✅ | - | **Choose strong password!** |
| JWT Secret | ✅ | Testing default | Use generator for production |
| Anon Key | ✅ | Testing default | Use generator for production |
| Service Role Key | ✅ | Testing default | Use generator for production |
| Site URL | ✅ | `http://localhost:3000` | Your server IP/domain |
| SMTP Settings | ❌ | - | Optional for email auth |

---

## 📦 What's Included

This installation provides:

- **Supabase Studio** - Web dashboard
- **PostgreSQL** - Full database with extensions
- **GoTrue** - Authentication service
- **PostgREST** - Auto-generated REST APIs
- **Realtime** - WebSocket subscriptions
- **Storage** - File storage with image transforms
- **Kong** - API gateway
- All supporting services

---

## 🛠️ Files in This Directory

- **config.json** - App configuration for Runtipi
- **docker-compose.json** - Container definitions
- **metadata/** - App description and logo
- **key-generator.html** - Browser-based key generator ⭐
- **generate-keys.sh** - Command-line key generator
- **README.md** - This file

---

## 📚 After Installation

1. **Access Dashboard**: `http://YOUR-SERVER-IP:3000`
2. **Create Tables**: Use the visual table editor
3. **Setup Auth**: Configure authentication providers
4. **Build Apps**: Use Supabase client libraries

See `metadata/description.md` for detailed tutorials!

---

## 🔒 Security Checklist

- [ ] Changed PostgreSQL password from default
- [ ] Generated new JWT secret (not using default)
- [ ] Generated new Anon key (not using default)
- [ ] Generated new Service Role key (not using default)
- [ ] Saved all keys securely (password manager)
- [ ] Service Role key never exposed to client-side
- [ ] Enabled Row Level Security on all tables
- [ ] Configured proper SMTP for production

---

## 🆘 Need Help?

- **Supabase Docs**: https://supabase.com/docs
- **Runtipi Discord**: https://discord.gg/runtipi
- **Supabase Discord**: https://discord.supabase.com

---

## 📄 License

This Runtipi app configuration is MIT licensed.
Supabase itself is Apache 2.0 licensed.
