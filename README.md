# MCP App

A Ruby on Rails application that implements Model Context Protocol (MCP) tools for user management. This application provides a RESTful API and MCP tools for creating, listing, and managing users with comprehensive profile information.

## Features

- **User Management**: Create and manage users with detailed profile information
- **MCP Tools**: Custom tools for user operations via Model Context Protocol
- **RESTful API**: Standard Rails API endpoints
- **PostgreSQL Database**: Robust data storage with proper indexing
- **Docker Support**: Containerized deployment ready
- **Health Check Endpoint**: Built-in health monitoring at `/up`

## Tech Stack

- **Ruby**: 3.2.2
- **Rails**: 7.1.4
- **Database**: PostgreSQL
- **Web Server**: Puma
- **MCP**: fast-mcp gem for Model Context Protocol implementation
- **Testing**: Capybara, Selenium WebDriver
- **Development**: Web Console, Debug gem

## Prerequisites

- Ruby 3.2.2
- PostgreSQL
- Docker (optional, for containerized deployment)

## Installation

### Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mcp_app
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   ```bash
   # Create and migrate the database
   bin/rails db:create
   bin/rails db:migrate
   
   # Seed with sample data (optional)
   bin/rails db:seed
   ```

4. **Start the Rails server**
   ```bash
   bin/rails server
   ```

The application will be available at `http://localhost:3000`

### Docker Deployment

1. **Build the Docker image**
   ```bash
   docker build -t mcp_app .
   ```

2. **Run the container**
   ```bash
   docker run -p 3000:3000 mcp_app
   ```

## Database Schema

### Users Table

The application includes a comprehensive user management system with the following fields:

- `email` (string, required, unique)
- `first_name` (string, required)
- `last_name` (string, required)
- `phone_number` (string, optional)
- `date_of_birth` (date, optional)
- `address` (string, optional)
- `city` (string, optional)
- `state` (string, optional)
- `country` (string, optional)
- `postal_code` (string, optional)
- `role` (string, default: "user")
- `status` (string, default: "active")
- `last_login_at` (datetime, optional)

## MCP Tools

The application includes several MCP tools for user management:

### CreateUserTool
Creates a new user with required and optional parameters.

**Parameters:**
- `first_name` (required): User's first name
- `last_name` (required): User's last name
- `email` (optional): User's email address

### ListUser
Retrieves and displays all users in the system.

**Returns:** JSON array of users with name and email information.

## API Endpoints

- `GET /up` - Health check endpoint
- Additional RESTful endpoints can be added as needed

## Testing

Run the test suite:

```bash
bin/rails test
```

For system tests:

```bash
bin/rails test:system
```

## Development

### Adding New MCP Tools

1. Create a new tool file in `app/tools/`
2. Inherit from `ApplicationTool`
3. Define the tool description and arguments
4. Implement the `call` method

Example:
```ruby
class MyCustomTool < ApplicationTool
  description 'Description of what this tool does'

  arguments do
    required(:param1).filled(:string).description("Description of parameter")
    optional(:param2).filled(:string).description("Optional parameter")
  end

  def call(param1:, param2: nil)
    # Your tool logic here
  end
end
```

