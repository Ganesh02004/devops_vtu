# 🚀 Secure Flask App with Jenkins CI/CD + SonarQube + Trivy + Minikube

This project demonstrates a complete DevSecOps pipeline for a Flask web application using:

- ✅ Jenkins (Pipeline as Code)
- ✅ SonarQube (Code Quality Analysis)
- ✅ Trivy (Container Image Vulnerability Scanning)
- ✅ Docker (Image Build and Push)
- ✅ Docker Hub (Image Registry)
- ✅ Kubernetes via Minikube (Deployment)

---

## 🧩 Project Structure

#YAML

---

## 🛠 Prerequisites

- Jenkins (with plugins):
  - SonarQube Scanner for Jenkins
  - Docker Pipeline
  - Kubernetes CLI
  - Git, Credentials, Pipeline
- Docker Desktop or Docker Engine
- SonarQube server running (e.g., via Docker)
- Minikube (or any K8s cluster)
- Trivy installed (on Jenkins host)
- GitHub repository (to host this code)

---

## 🔐 Credentials to Configure in Jenkins

| ID                | Type         | Used For                |
|------------------|--------------|--------------------------|
| `docker-hub-creds` | Username/Password | Docker Hub login         |
| `sonar-token`      | Secret Text  | SonarQube auth token     |

---

## 🚀 Pipeline Flow (Jenkinsfile)

1. **Checkout Code** from GitHub
2. **Run SonarQube Analysis** on the source code
3. **Build Docker Image**
4. **Scan Docker Image with Trivy**
5. **Push Docker Image** to Docker Hub
6. **Deploy to Minikube** via `kubectl apply`

Each image is uniquely tagged with the build timestamp and number.

---

## 🧪 SonarQube Configuration

Make sure `sonar-project.properties` is at the project root. Example:

```properties
sonar.projectKey=secure-flask-app
sonar.projectName=Secure Flask App
sonar.sources=.
sonar.python.version=3

**
📦 Docker Image**
ganesh02004/secure_flask_app:version(after scanning with the trivy)


