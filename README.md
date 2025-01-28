# Nuxt 3 Minimal Starter

This project is a minimal starter template for Nuxt 3 applications. It includes configurations for Docker and Kubernetes, as well as a CI/CD pipeline using GitHub Actions.

## Prerequisites

Make sure you have the following installed:
- Node.js (version 18 or higher)
- Docker
- Kubernetes (Minikube or a Kubernetes cluster)
- kubectl
- npm, pnpm, or yarn

## Setup

First, clone the repository and navigate to the project directory:

```bash
git clone <repository-url>
cd gitci
```

Install the dependencies:

```bash
# npm
npm install

# pnpm
pnpm install

# yarn
yarn install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm run dev

# yarn
yarn dev
```

## Production

Build the application for production:

```bash
# npm
npm run build

# pnpm
pnpm run build

# yarn
yarn build
```

Locally preview the production build:

```bash
# npm
npm run preview

# pnpm
pnpm run preview

# yarn
yarn preview
```

## Docker

Docker allows you to containerize your application, making it easy to deploy and run in different environments. Follow these steps to build and run the Docker container:

1. Build the Docker image:

```bash
docker build -t nuxt-app .
```

2. Run the Docker container:

```bash
docker run -p 3000:3000 nuxt-app
```

## Kubernetes

Kubernetes is a powerful orchestration tool for managing containerized applications. This project includes Kubernetes manifests for deploying the Nuxt app.

### Deployment

1. Ensure your Kubernetes cluster is running.
2. Apply the Kubernetes manifests:

```bash
kubectl apply -f k8s/Deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

3. Verify the deployment:

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

### Accessing the Application

Add the following entry to your `/etc/hosts` file to access the application via the Ingress resource:

```
<minikube-ip> nuxt-app.local
```

Replace `<minikube-ip>` with the IP address of your Minikube or Kubernetes cluster.

## CI/CD Pipeline

This project includes a GitHub Actions workflow for CI/CD. The workflow is triggered on pushes to the `nuxt-version` branch and on pull requests.

### Secrets

Make sure to add the following secrets to your GitHub repository:
- `DOCKER_USERNAME`: Your DockerHub username
- `DOCKER_PASSWORD`: Your DockerHub password

### Workflow Steps

1. Checkout the repository
2. Set up Node.js
3. Install dependencies
4. Log in to DockerHub
5. Build and push the Docker image

## Recommendations

For those looking to undertake a similar project, here are some recommendations:

1. **Use a Modern Framework**: Nuxt 3 is a great choice for building modern web applications. It provides a powerful and flexible framework with excellent documentation and community support.

2. **Containerization**: Docker is essential for creating consistent development and production environments. It simplifies the deployment process and ensures that your application runs the same way everywhere.

3. **Orchestration**: Kubernetes is a robust tool for managing containerized applications at scale. It handles deployment, scaling, and management of containerized applications, making it easier to maintain and operate your application in production.

4. **CI/CD**: Implementing a CI/CD pipeline with GitHub Actions or another CI/CD tool helps automate the build, test, and deployment processes. This ensures that your application is always in a deployable state and reduces the risk of human error.

5. **Monitoring and Logging**: Consider integrating monitoring and logging tools like Prometheus, Grafana, and ELK stack to gain insights into your application's performance and troubleshoot issues effectively.

By following these recommendations, you can build, deploy, and maintain robust and scalable web applications efficiently.

Check out the [Nuxt 3 documentation](https://nuxt.com/docs/getting-started/introduction) and the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.
