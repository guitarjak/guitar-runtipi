# Leantime for Runtipi

## Important Setup Instructions

After installing this app in Runtipi, you MUST complete the following steps:

### 1. Complete the Installation Wizard

Once the containers are running:

1. Open your Leantime URL: `https://your-domain.com`
2. You will be redirected to the installation wizard
3. Follow the setup wizard to:
   - Configure your database connection (should auto-detect)
   - Create your admin account
   - Set up your first project

### 2. Configuration Notes

- **Database**: Uses MySQL 8.4 with proper UTF8MB4 support
- **Volumes**: All user files, plugins, and logs are persisted
- **Permissions**: Init container sets proper file permissions for Runtipi
- **Language**: Default is en-US, configurable during setup
- **Session Security**: Uses secure session encryption

### 3. Environment Variables

Required variables that will be configured during app installation:

- `LEAN_EMAIL_RETURN`: Admin email address
- `LEAN_SITENAME`: Name of your Leantime instance  
- `LEAN_LANGUAGE`: Language code (e.g., en-US)
- `LEAN_SESSION_PASSWORD`: Secure random string (20+ characters)
- Database credentials (automatically configured)

### 4. First Login

After completing the installation wizard:

1. Go to your Leantime URL
2. Log in with the admin credentials you created
3. Start creating projects and managing tasks!

### 5. Troubleshooting

If you encounter issues:

1. Check that all containers are running in Runtipi
2. Ensure you completed the `/install` wizard
3. Verify your database credentials are correct
4. Check container logs for any error messages

### 6. Features

- Task management via Kanban boards, Gantt charts, lists
- Project planning and goal tracking  
- Team collaboration and file sharing
- Time tracking and reporting
- Built-in wikis and documentation
- Mobile responsive interface
- Available in 20+ languages

For more information, visit [Leantime Documentation](https://docs.leantime.io)