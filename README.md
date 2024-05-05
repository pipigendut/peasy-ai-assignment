
# Peasy AI Asssignment

This document provides instructions and guidelines for completing the assignment using Ruby on Rails, Sidekiq, PostgreSQL, Redis, and Linux. The assignment involves creating Sidekiq jobs to interact with APIs, store data in a PostgreSQL database, and perform various calculations and updates based on the data.

## Usage
### Development
For development purposes, you can run the Rails application locally without Docker.

```
rails db:create
rails db:migrate
rails server
```

### Production
For production deployment, use Docker Compose to build and run the containers.

```
docker-compose up -d
```

## Conclusion
Follow the provided instructions to set up and deploy your Ruby on Rails application using Docker Compose. Customize configurations and environment variables as needed to suit your application requirements. If you encounter any issues or need further assistance, refer to Docker and Rails documentation or seek help from the community. Happy coding!