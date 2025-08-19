# Leantime for Runtipi

## Official Docker Configuration

This Leantime configuration follows the **official Leantime Docker setup** exactly as documented.

## Important Setup Instructions

### 1. Install the App

Configure the required fields during installation:
- **Database Name**: Default `leantime`
- **Database User**: Default `leantime` 
- **Database Password**: Create a strong password
- **MySQL Root Password**: Create a strong root password
- **Site Name**: Name for your Leantime instance
- **Session Password**: Strong 20+ character password

### 2. Complete Installation Wizard

**CRITICAL STEP**: After containers start, you MUST:

1. Go to your Leantime URL: `https://your-domain.com`
2. Complete the installation wizard at `/install`
3. Follow the setup steps to:
   - Verify database connection
   - Create admin account
   - Initialize the application

### 3. Configuration Notes

This setup uses the **exact official Leantime Docker pattern**:
- **Port 80**: Standard Leantime port (not 8080)
- **MySQL 8.0**: With UTF8MB4 character set
- **Minimal volumes**: Only userfiles mounted
- **Official service names**: `mysql_leantime` and `leantime`
- **Minimal environment**: Only essential variables

### 4. After Installation

1. Log in with your admin credentials
2. Start creating projects and tasks
3. Explore Leantime's features:
   - Kanban boards and Gantt charts
   - Time tracking and reporting
   - Team collaboration tools
   - Project planning features

### 5. Troubleshooting

If you encounter issues:

1. Ensure you completed the `/install` wizard
2. Check that both containers are running
3. Verify database credentials match
4. Check container logs in Runtipi

### 6. Official Documentation

For detailed usage instructions:
- [Leantime Documentation](https://docs.leantime.io)
- [Official Docker Setup](https://github.com/Leantime/docker-leantime)

## Why This Configuration Works

This follows the **exact pattern** from Leantime's official Docker documentation:
- Uses the same service names (`mysql_leantime`)
- Uses the same port (80) 
- Uses minimal environment variables
- Mounts only the necessary volumes
- No complex health checks or init containers

This ensures maximum compatibility with Leantime's expected setup.