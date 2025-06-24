README.md

💼 Product Service

A Dockerized Spring Boot microservice for managing a product catalog. This project includes versioned deployments in Kubernetes and automated CI/CD with GitHub Actions.

🐳 Docker Build & Push

# Build Docker image
docker build -t pooja06bhosale/product-service:v1.0.0 .

# Push image to Docker Hub
docker push pooja06bhosale/product-service:v1.0.0

☘️ Kubernetes Deployment

kubectl apply -f kubernetes/product-v1.yaml
kubectl apply -f kubernetes/product-v1-1.yaml
kubectl apply -f kubernetes/product-v2.yaml
kubectl apply -f kubernetes/product-ingress.yaml

Namespaces:

product-v1

product-v1-1

product-v2

Routes via Ingress:

/v1/health, /v1/products

/v1.1/products/search?keyword=...

/v2/products/search?keyword=... (with error handling)

📀 CI/CD Pipeline

GitHub Actions config: .github/workflows/ci-cd.yml

Triggered by:

Push to main

Tag push (e.g., v1.0.0)

Pipeline includes:

Docker build

Docker push to Docker Hub

Kubernetes manifest deployment

📒 Git Tags & Versioning

git tag v1.0.0
git tag v1.1.0
git tag v2.0.0
git push --tags

See CHANGELOG.md for version history.

🔢 Local Testing

docker run -p 8080:8080 pooja06bhosale/product-service:v1.0.0
curl http://localhost:8080/health

📃 Endpoints Summary

GET /health

GET /products

GET /products/search?keyword=... (v1.1+)
