SYSTEM_DESIGN.md

🛋️ Overview

This system is a REST-based product catalog microservice built using Spring Boot. The application is containerized using Docker and deployed to Kubernetes with support for versioning, autoscaling, and Ingress-based routing.

📊 Architecture Components

Spring Boot Microservice

/health, /products, /products/search

MySQL Database

Used in local Docker Compose

Docker + Docker Compose

For local containerization and DB

Kubernetes (Minikube)

Each version deployed in separate namespace

Managed resources + autoscaling (HPA)

Ingress controller (NGINX)

GitHub Actions CI/CD

Automates build, push, deploy, test

🔄 Version Management

v1.0.0: Basic /health and /products endpoints

v1.1.0: /products/search support

v2.0.0: Enhanced search with error handling

All versions are tagged in Git using semantic versioning.

✅ Design Justification

Namespace Isolation: Keeps environments clean and separate per version.

HPA + Limits: Enables safe autoscaling and avoids resource overuse.

Ingress: Clean, URL-based version routing.

GitHub Actions: Seamless DevOps pipeline to Docker + K8s.

