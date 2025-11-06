# UniBee - Open-Source Billing Platform for SaaS

UniBee is an open-source universal billing solution designed specifically for SaaS businesses. Unlike expensive and complex platforms like Recurly, Chargebee, and Paddle, UniBee offers a user-friendly, cost-effective alternative with both community and enterprise versions.

## Features

### Subscription Management
Manage your subscriptions with ease. Create, update, and cancel subscriptions with a few clicks.

### Automated Invoicing
Automatically generate and send invoices to your customers, reducing manual work and improving cash flow.

### Billable Metrics Tracking
Track your billable metrics and generate reports to analyze your business performance with detailed insights.

### Product & Plan Management
Create and manage your products and plans with ease. Set up multiple pricing tiers, trial periods, and billing cycles.

### Webhooks
Receive real-time notifications about events that happen in your account, enabling seamless integration with your systems.

### User Management
Manage your users and their permissions with ease. Control access to different features and data.

### Comprehensive Reporting
Generate detailed reports to analyze your business performance, track revenue, and monitor subscription metrics.

### Transaction Management
Manage your transactions and refunds with ease. Track all payment activities in one place.

### Discount Management
Create and manage discounts for your customers. Set up promotional codes, seasonal discounts, and customer-specific pricing.

### Flexible Integration
- **Admin Portal**: Full-featured administrative interface for managing your billing operations
- **User Portal**: Pre-built customer-facing portal for subscription management
- **API Access**: Comprehensive API for custom integrations with your existing systems

## What You Get

This Runtipi deployment includes:
- **UniBee API**: Core billing engine and REST API
- **Admin Portal**: Web interface for managing billing operations (Main service)
- **User Portal**: Customer-facing subscription management interface
- **License API**: License management service for enterprise features
- **MySQL Database**: Persistent data storage
- **Redis**: Caching and session management

## Getting Started

After installation:

1. Access the admin portal through the main app URL provided by Runtipi
2. Complete the initial setup wizard
3. Configure the UniBee API URL in the app settings (typically `http://unibee-api/api`)
4. Configure your payment gateway integrations
5. Create your first products and subscription plans

**Note**: This deployment exposes the Admin Portal as the main interface. The API and User Portal are accessible internally to other services. If you need external access to the API or User Portal, you can configure additional reverse proxy rules in your Runtipi/Traefik configuration.

## Documentation

For detailed documentation, API reference, and integration guides, visit:
- [Official Documentation](https://docs.unibee.dev/)
- [GitHub Repository](https://github.com/UniBee-Billing/unibee)
- [User Portal Repository](https://github.com/UniBee-Billing/unibee-user-portal)
- [Admin Portal Repository](https://github.com/UniBee-Billing/unibee-admin-portal)
- [API Repository](https://github.com/UniBee-Billing/unibee-api)

## License

This project is licensed under the AGPLv3 License.

## Support

For questions and support:
- Email: help@unibee.dev
- Community: [Telegram Community](https://t.me/+KC_L87uFTl82NDI0)
- Official Channel: [Telegram Channel](https://t.me/+xncwy-uZFE1lMTI0)
