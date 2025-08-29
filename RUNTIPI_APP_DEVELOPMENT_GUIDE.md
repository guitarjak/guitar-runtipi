# Runtipi App Development Guide

This comprehensive guide explains how to add new applications to the Runtipi app store based on analysis of working apps (postiz, leantime, answer).

## Table of Contents

1. [Directory Structure](#directory-structure)
2. [Required Files](#required-files)
3. [Configuration Reference](#configuration-reference)
4. [Docker Compose Configuration](#docker-compose-configuration)
5. [Form Fields Guide](#form-fields-guide)
6. [Categories & Standards](#categories--standards)
7. [Testing & Validation](#testing--validation)
8. [Common Patterns](#common-patterns)
9. [Troubleshooting](#troubleshooting)
10. [Examples](#examples)

## Directory Structure

Every app must follow this exact structure:

```
apps/
└── your-app-name/
    ├── config.json              # App configuration and metadata
    ├── docker-compose.json      # Container definitions
    └── metadata/
        ├── description.md       # Detailed app description
        └── logo.jpg            # App logo (JPG format)
```

### Naming Conventions

- **Folder name**: Use lowercase, hyphens for spaces (e.g., `my-app`)
- **App ID**: Must match folder name exactly
- **Files**: Use exact names as shown above

## Required Files

### 1. config.json
Contains app metadata, configuration options, and form fields.

### 2. docker-compose.json
Defines Docker services, volumes, environment variables, and dependencies.

### 3. metadata/description.md
Markdown file with detailed app description, features, and setup instructions.

### 4. metadata/logo.jpg
App logo in JPG format (recommended size: 256x256px or larger, square aspect ratio).

## Configuration Reference

### config.json Schema

```json
{
  "urn": "runtipi:app-name",                    // Optional: URN identifier
  "name": "App Name",                           // Required: Display name
  "id": "app-name",                            // Required: Unique identifier
  "available": true,                           // Required: App availability
  "short_desc": "Brief app description",       // Required: Short description
  "author": "Author Name",                     // Required: App author
  "port": 8080,                               // Required: Main port
  "categories": ["utilities"],                 // Required: App categories
  "description": "Detailed description...",    // Required: Long description
  "tipi_version": 2,                          // Required: Tipi version
  "version": "1.0.0",                         // Required: App version
  "source": "https://github.com/...",         // Required: Source URL
  "website": "https://example.com",           // Required: Official website
  "exposable": true,                          // Required: Can be exposed publicly
  "supported_architectures": [                 // Required: Supported CPU architectures
    "amd64",
    "arm64"
  ],
  "created_at": 1704067200000,                // Required: Creation timestamp
  "updated_at": 1704067200000,                // Required: Update timestamp
  "dynamic_config": true,                     // Required: Has configuration form
  "form_fields": [...]                        // Optional: Configuration form fields
}
```

### Valid Categories

Based on test validation, these are the only valid categories:

- `network`
- `media`
- `development`
- `automation`
- `social`
- `utilities`
- `photography`
- `security`
- `featured`
- `books`
- `data`
- `music`
- `finance`
- `gaming`
- `ai`

## Docker Compose Configuration

### docker-compose.json Schema

```json
{
  "services": [
    {
      "name": "service-name",                  // Required: Service name
      "image": "docker/image:tag",             // Required: Docker image
      "isMain": true,                          // Optional: Main service flag
      "internalPort": "8080",                  // Required for main service: Internal port
      "command": "/start-command",             // Optional: Custom start command
      "environment": {                         // Optional: Environment variables
        "VAR_NAME": "${FORM_FIELD_NAME}"
      },
      "volumes": [                             // Optional: Volume mounts
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data",
          "readOnly": false                    // Optional: Read-only flag
        }
      ],
      "dependsOn": ["other-service"],          // Optional: Service dependencies
      "healthCheck": {                         // Optional: Health check configuration
        "test": "command to test health",
        "interval": "30s",
        "timeout": "10s",
        "retries": 5
      },
      "restart": "unless-stopped"             // Optional: Restart policy
    }
  ]
}
```

### Built-in Variables

These variables are automatically provided by Runtipi:

- `${APP_DATA_DIR}` - App's data directory
- `${LOCAL_DOMAIN}` - Local domain for the app
- `${INTERNAL_IP}` - Internal IP address
- Form field variables: `${FIELD_ENV_VARIABLE}`

## Form Fields Guide

### Field Types

#### Text Field
```json
{
  "type": "text",
  "label": "Field Label",
  "hint": "Helpful hint for users",
  "max": 100,                                  // Max length
  "min": 1,                                    // Min length
  "required": true,                            // Is required
  "env_variable": "ENV_VAR_NAME",             // Environment variable name
  "default": "default value"                   // Optional default value
}
```

#### Password Field
```json
{
  "type": "password",
  "label": "Password",
  "hint": "Strong password required",
  "max": 100,
  "min": 8,
  "required": true,
  "env_variable": "PASSWORD"
}
```

#### Boolean Field
```json
{
  "type": "boolean",
  "label": "Enable Feature",
  "hint": "Check to enable this feature",
  "required": false,
  "env_variable": "ENABLE_FEATURE"
}
```

### Field Properties

- `type`: Field input type (`text`, `password`, `boolean`)
- `label`: User-friendly field name
- `hint`: Optional help text
- `max`/`min`: Length constraints for text fields
- `required`: Whether field is required
- `env_variable`: Environment variable name in containers
- `default`: Optional default value

## Categories & Standards

### Versioning
- Use semantic versioning (e.g., `1.0.0`, `v2.1.3`)
- Include version prefix if used upstream (`v1.0.0`)
- Keep versions in sync with upstream releases

### Timestamps
- Use Unix timestamps in milliseconds
- `created_at`: When app was first added
- `updated_at`: When app was last modified

### Architecture Support
Most apps should support both:
- `amd64` - Intel/AMD 64-bit
- `arm64` - ARM 64-bit (Apple Silicon, ARM servers)

## Testing & Validation

### Run Tests
```bash
bun test
```

This validates:
- All required files exist
- `config.json` matches schema
- `docker-compose.json` matches schema
- Categories are valid

### Common Validation Errors

1. **Invalid category**: Use only categories from the valid list
2. **Missing required fields**: Check all required fields are present
3. **Invalid file structure**: Ensure all required files exist
4. **Schema mismatch**: Verify JSON structure matches expected schema

## Common Patterns

### Single Container App
```json
{
  "services": [
    {
      "name": "app-name",
      "image": "app/image:latest",
      "isMain": true,
      "internalPort": "8080",
      "environment": {
        "CONFIG_VAR": "${USER_INPUT}"
      },
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

### App + Database
```json
{
  "services": [
    {
      "name": "app",
      "image": "app/image:latest",
      "isMain": true,
      "internalPort": "8080",
      "dependsOn": ["database"],
      "environment": {
        "DB_HOST": "database",
        "DB_USER": "${DB_USER}",
        "DB_PASSWORD": "${DB_PASSWORD}"
      }
    },
    {
      "name": "database",
      "image": "postgres:15",
      "environment": {
        "POSTGRES_USER": "${DB_USER}",
        "POSTGRES_PASSWORD": "${DB_PASSWORD}",
        "POSTGRES_DB": "${DB_NAME}"
      },
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/postgres",
          "containerPath": "/var/lib/postgresql/data"
        }
      ]
    }
  ]
}
```

### Multi-Service Stack
```json
{
  "services": [
    {
      "name": "app",
      "image": "app/image:latest",
      "isMain": true,
      "internalPort": "8080",
      "dependsOn": ["database", "redis"],
      "environment": {
        "DATABASE_URL": "postgresql://user:pass@database:5432/db",
        "REDIS_URL": "redis://redis:6379"
      }
    },
    {
      "name": "database",
      "image": "postgres:15",
      "environment": {
        "POSTGRES_USER": "user",
        "POSTGRES_PASSWORD": "password",
        "POSTGRES_DB": "database"
      },
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/postgres",
          "containerPath": "/var/lib/postgresql/data"
        }
      ]
    },
    {
      "name": "redis",
      "image": "redis:7.2",
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/redis",
          "containerPath": "/data"
        }
      ]
    }
  ]
}
```

## Troubleshooting

### App Not Appearing
1. **Run tests**: `bun test` to check for validation errors
2. **Check git status**: Ensure files are committed to git
3. **Restart Runtipi**: Service may need restart to detect new apps
4. **Clear browser cache**: Force refresh the interface

### App Won't Start
1. **Check container logs**: Look for error messages
2. **Verify image exists**: Ensure Docker image is available
3. **Check environment variables**: Verify all required vars are set
4. **Review dependencies**: Ensure dependent services start first
5. **Check command**: Verify custom commands are correct

### Database Connection Issues
1. **Check service names**: Database host should match service name
2. **Verify credentials**: Ensure username/password match
3. **Check initialization**: Some apps need manual DB setup
4. **Review volumes**: Ensure database data persists correctly

## Examples

### Simple App (Answer)
- **Single container**
- **No configuration form**
- **Minimal setup**

```json
// config.json - Simple configuration
{
  "name": "Apache Answer",
  "id": "answer",
  "categories": ["utilities"],
  "form_fields": []
}

// docker-compose.json - Single service
{
  "services": [
    {
      "name": "answer",
      "image": "apache/answer:latest",
      "isMain": true,
      "internalPort": "9080"
    }
  ]
}
```

### Medium Complexity (Leantime)
- **App + Database**
- **Multiple form fields**
- **Health checks**

```json
// config.json - Multiple required fields
{
  "form_fields": [
    {
      "type": "text",
      "label": "Database Name",
      "required": true,
      "env_variable": "MYSQL_DATABASE"
    },
    {
      "type": "password",
      "label": "Database Password",
      "required": true,
      "env_variable": "MYSQL_PASSWORD"
    }
  ]
}

// docker-compose.json - Two services with health check
{
  "services": [
    {
      "name": "leantime",
      "image": "leantime/leantime:latest",
      "isMain": true,
      "dependsOn": ["mysql_leantime"],
      "environment": {
        "LEAN_DB_HOST": "mysql_leantime",
        "LEAN_DB_PASSWORD": "${MYSQL_PASSWORD}"
      }
    },
    {
      "name": "mysql_leantime",
      "image": "mysql:8.0",
      "healthCheck": {
        "test": "mysqladmin ping -h localhost",
        "interval": "30s",
        "timeout": "10s",
        "retries": 5
      }
    }
  ]
}
```

### Complex App (Postiz)
- **Multi-service stack**
- **Advanced form fields**
- **Multiple volumes**

```json
// config.json - Complex form with various field types
{
  "form_fields": [
    {
      "type": "text",
      "label": "Main URL",
      "required": true,
      "env_variable": "MAIN_URL"
    },
    {
      "type": "boolean",
      "label": "Disable Registration",
      "required": false,
      "env_variable": "DISABLE_REGISTRATION"
    },
    {
      "type": "text",
      "label": "Facebook App ID",
      "required": false,
      "env_variable": "FACEBOOK_APP_ID"
    }
  ]
}

// docker-compose.json - Three services with dependencies
{
  "services": [
    {
      "name": "postiz",
      "image": "ghcr.io/gitroomhq/postiz-app:latest",
      "isMain": true,
      "dependsOn": ["postiz-postgres", "postiz-redis"],
      "environment": {
        "DATABASE_URL": "postgresql://user:pass@postiz-postgres:5432/db",
        "REDIS_URL": "redis://postiz-redis:6379"
      },
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/config",
          "containerPath": "/config"
        },
        {
          "hostPath": "${APP_DATA_DIR}/uploads",
          "containerPath": "/uploads"
        }
      ]
    },
    {
      "name": "postiz-postgres",
      "image": "postgres:17-alpine"
    },
    {
      "name": "postiz-redis",
      "image": "redis:7.2"
    }
  ]
}
```

## Best Practices

### Security
- Use strong default passwords for databases
- Don't expose unnecessary ports
- Use read-only volumes where possible
- Validate user inputs in form fields

### Performance
- Use specific image tags instead of `latest` when possible
- Configure appropriate health checks
- Use efficient base images (alpine variants)
- Set reasonable resource limits

### User Experience
- Provide clear form field labels and hints
- Use sensible defaults for optional fields
- Write comprehensive descriptions
- Include setup instructions in metadata

### Maintenance
- Keep versions updated with upstream
- Test apps before committing changes
- Document any special setup requirements
- Follow semantic versioning

---

*This guide is based on analysis of working Runtipi apps and should be updated as the platform evolves.*