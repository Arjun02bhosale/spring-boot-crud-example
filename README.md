# System Design

## Architecture

- Spring Boot REST API
- MySQL Database (via Docker Compose)
- Containerized using Docker
- Versioned using Git tags
- Deployed to Kubernetes (each version in a separate namespace)
- NGINX ingress for routing
- CI/CD via GitHub Actions

## Why This Design?

- Scalable via HPA
- Clean version isolation
- Easy container updates via CI/CD# spring-boot-crud-example