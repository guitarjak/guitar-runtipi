# BigCapital

BigCapital is a smart and open-source accounting and inventory software designed to help businesses manage finances, automate accounting processes, and generate intelligent financial reports.

## Features

### Financial Management
- **Double-Entry Accounting**: Professional accounting system with complete audit trails
- **Financial Reporting**: Generate intelligent financial reports including P&L, Balance Sheets, and Cash Flow statements
- **Multi-Currency Support**: Handle transactions in multiple currencies with automatic exchange rate updates
- **Bank Integration**: Connect and synchronize bank accounts for automatic transaction imports

### Inventory Management
- **Product Catalog**: Comprehensive inventory tracking with categories and variants
- **Stock Management**: Real-time inventory levels with automated reorder points
- **Cost Tracking**: FIFO, LIFO, and average cost methods for inventory valuation
- **Warehouse Management**: Multi-location inventory tracking

### Business Operations
- **Invoice Management**: Professional invoicing with customizable templates
- **Bill Management**: Track vendor bills and manage accounts payable
- **Customer Management**: Complete CRM with customer profiles and transaction history
- **Vendor Management**: Maintain vendor relationships and purchase history

### Advanced Features
- **API Integration**: RESTful API for custom integrations and third-party connections
- **Multi-Tenant Architecture**: Support multiple organizations within a single installation
- **User Management**: Role-based access control with customizable permissions
- **Automated Workflows**: Streamline repetitive tasks with automation rules

## Setup Requirements

### Required Configuration
1. **Application URL**: The full URL where BigCapital will be accessible
2. **JWT Secret**: A strong random string for secure authentication tokens
3. **Database Credentials**: MySQL/MariaDB username and password for data storage
4. **System Database**: Name for the main system database

### Optional Configuration
1. **Email Settings**: SMTP configuration for sending notifications and reports
2. **Registration Settings**: Control user signup and registration process

## Getting Started

1. **Initial Setup**: After installation, access BigCapital through your configured URL
2. **Admin Account**: Create your first admin account during the initial setup wizard
3. **Company Setup**: Configure your company information, fiscal year, and accounting preferences
4. **Chart of Accounts**: Customize the chart of accounts to match your business needs
5. **Integrations**: Connect bank accounts and configure any third-party integrations

## Post-Installation

### Database Migration
The system will automatically run database migrations on first startup. Monitor the migration logs to ensure successful setup.

### File Uploads
BigCapital supports file attachments for invoices, bills, and other documents. Files are stored in the persistent `uploads` directory.

### Email Configuration
For full functionality, configure SMTP settings to enable:
- Invoice and bill email delivery
- User notifications
- Password reset emails

## Security Considerations

- Use strong passwords for all database accounts
- Keep JWT secret confidential and use a cryptographically secure random string
- Enable HTTPS in production environments
- Regularly update to the latest version for security patches

## Support Resources

- **Documentation**: [https://docs.bigcapital.app](https://docs.bigcapital.app)
- **GitHub Repository**: [https://github.com/bigcapitalhq/bigcapital](https://github.com/bigcapitalhq/bigcapital)
- **Community Support**: GitHub Issues and Discussions

BigCapital is released under the AGPL-3.0 license, making it free to use and modify for your business needs.