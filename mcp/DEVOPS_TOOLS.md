# 🚀 DevOps Tools & MCP Server Empfehlungen

Erweiterte Tools zur Integration in die zentrale MCP-Konfiguration.

---

## 📋 Kategorisierte Tool-Empfehlungen

### � Developer & AI-Coding Tools

| Tool               | MCP          | Beschreibung                     | Use Case                               |
| ------------------ | ------------ | -------------------------------- | -------------------------------------- |
| **Context7**       | ✅ Available | Up-to-date Code Documentation    | Real-time API docs für 1000+ Libraries |
| **GitHub Copilot** | ✅ Built-in  | GitHub Native AI Code Completion | IDE Integration                        |
| **Cline**          | 🔄 Community | AI Agent for VS Code             | Full Development Workflows             |
| **Cursor**         | 🔄 IDE       | AI-powered Code Editor           | Advanced Code Generation               |
| **Claude Code**    | 🔄 IDE       | Claude Integration               | Interactive Coding                     |

**Empfehlung für dev-config:**

- **Context7** ist bereits integriert ✅
- Verhindert halluzinierte APIs
- Fetcht aktuelle Dokumentation
- Version-spezifische Beispiele

---

### �🔐 Secrets & Security Management

| Tool                     | MCP          | Beschreibung           | Use Case                          |
| ------------------------ | ------------ | ---------------------- | --------------------------------- |
| **HashiCorp Vault**      | ✅ Available | Zentrale Secret Engine | Prod-Secrets, Dynamic Credentials |
| **1Password CLI**        | ✅ Available | Team Password Manager  | Team Secrets, Credentials Sharing |
| **AWS Secrets Manager**  | ✅ Via AWS   | AWS-native Secrets     | AWS-basierte Infrastruktur        |
| **Bitwarden**            | 🔄 Community | Self-hosted Secrets    | Self-hosted Option                |
| **Apache SealedSecrets** | 🔄 Community | K8s Secrets Encryption | Kubernetes Native                 |

**Empfehlung für dev-config:**

- Use **Vault** für Development/Staging
- Use **1Password** für Team-Secrets
- Use **AWS Secrets Manager** für Production

---

### 📊 Monitoring, Logging & Observability

| Tool              | MCP          | Tier           | Beschreibung                              |
| ----------------- | ------------ | -------------- | ----------------------------------------- |
| **Prometheus**    | ✅ Available | OSS            | Metrics Collection & Storage              |
| **Grafana**       | ✅ Available | OSS/Enterprise | Visualization & Dashboarding              |
| **ELK Stack**     | 🔄 Community | OSS            | Logging (Elasticsearch, Logstash, Kibana) |
| **Datadog**       | ✅ Available | SaaS           | Full-Stack Monitoring                     |
| **New Relic**     | ✅ Available | SaaS           | APM & Infrastructure Monitoring           |
| **Loki**          | 🔄 Community | OSS            | Log Aggregation (Prometheus-compatible)   |
| **Jaeger**        | 🔄 Community | OSS            | Distributed Tracing                       |
| **Sentry**        | ✅ Available | SaaS/OSS       | Error Tracking & Performance              |
| **OpenTelemetry** | 🔄 Community | OSS            | Unified Observability Framework           |

**Empfehlung für dev-config:**

```json
{
  "prometheus": { "type": "OSS", "for": "local-dev" },
  "grafana": { "type": "OSS", "for": "visualization" },
  "sentry": { "type": "SaaS", "for": "error-tracking" }
}
```

---

### 🚀 CI/CD & Deployment Automation

| Tool               | MCP          | Beschreibung                       | Integration                      |
| ------------------ | ------------ | ---------------------------------- | -------------------------------- |
| **ArgoCD**         | ✅ Available | GitOps Deployment                  | K8s-native, Git-driven           |
| **Jenkins**        | ✅ Available | Pipeline Orchestration             | Self-hosted CI/CD                |
| **GitHub Actions** | ✅ Built-in  | GitHub Native CI/CD                | Kostenlos für public repos       |
| **GitLab CI/CD**   | ✅ Built-in  | GitLab Native CI/CD                | Integrated in GitLab             |
| **Flux**           | 🔄 Community | GitOps Deployment                  | K8s-native Alternative zu ArgoCD |
| **Spinnaker**      | 🔄 Community | Multi-cloud Deployment             | Complex Deployments              |
| **CloudFormation** | ✅ Via AWS   | AWS Infrastructure as Code         | AWS-only                         |
| **Ansible**        | ✅ Available | Configuration Management           | Multi-cloud, Agentless           |
| **Pulumi**         | ✅ Available | Infrastructure as Code (Python/Go) | Modern IaC                       |

**Dev-Config Empfehlung:**

```bash
# GitHub Actions für CI (built-in)
# ArgoCD für Production K8s Deployment
# Ansible für Server-Provisioning
```

---

### ☸️ Kubernetes & Container Orchestration

| Tool               | MCP          | Beschreibung           | Level              |
| ------------------ | ------------ | ---------------------- | ------------------ |
| **kubectl**        | ✅ Available | K8s CLI                | Essential          |
| **Helm**           | ✅ Available | K8s Package Manager    | Essential          |
| **Kustomize**      | 🔄 Community | K8s Template Engine    | Advanced           |
| **k9s**            | 🔄 Community | K8s TUI Dashboard      | Developer Friendly |
| **kubectx**        | 🔄 Community | K8s Context Switcher   | Helper Tool        |
| **Lens**           | 🔄 Community | K8s IDE                | Visual Management  |
| **Sealed Secrets** | 🔄 Community | K8s Secret Encryption  | Security           |
| **KEDA**           | 🔄 Community | K8s Event Auto-scaling | Scaling            |
| **Istio**          | 🔄 Community | Service Mesh           | Advanced           |
| **Cilium**         | 🔄 Community | eBPF-based Networking  | Advanced           |

**Setup für dev-config:**

```bash
# oh-my-zsh plugins:
- kubectl
- helm
- k9s

# MCP Integration:
- Kubernetes (builtin)
- Add Helm nach Bedarf
```

---

### 📦 Database & Data Management

| Tool              | MCP          | Typ               | Beschreibung            |
| ----------------- | ------------ | ----------------- | ----------------------- |
| **PostgreSQL**    | ✅ Available | SQL               | Primary Database        |
| **MySQL**         | 🔄 Community | SQL               | Alternative SQL DB      |
| **MongoDB**       | 🔄 Community | NoSQL             | Document Database       |
| **Redis**         | 🔄 Community | Cache/Queue       | In-memory Cache         |
| **Elasticsearch** | 🔄 Community | Search/Analytics  | Full-text Search        |
| **DynamoDB**      | ✅ Via AWS   | NoSQL             | AWS-managed Database    |
| **RDS**           | ✅ Via AWS   | SQL               | AWS-managed Database    |
| **pgAdmin**       | 🔄 Community | PostgreSQL UI     | Web-based PG Management |
| **DBeaver**       | 🔄 Community | Universal DB Tool | IDE-like DB Management  |
| **Liquibase**     | 🔄 Community | DB Migration      | Schema Versioning       |

**Für dev-config:**

```json
{
  "postgresql": { "role": "primary-db", "mcp": true },
  "redis": { "role": "cache/queue", "mcp": false },
  "pgAdmin": { "role": "management-ui", "mcp": false }
}
```

---

### 🔗 API & Integration Tools

| Tool                | MCP            | Beschreibung            | Use Case        |
| ------------------- | -------------- | ----------------------- | --------------- |
| **OpenAPI/Swagger** | ✅ Available   | API Documentation       | API Design      |
| **GraphQL**         | ✅ Available   | Query Language          | Modern APIs     |
| **Postman**         | 🔄 API         | REST Client             | API Testing     |
| **Insomnia**        | 🔄 API         | REST/GraphQL Client     | API Development |
| **AWS API Gateway** | ✅ Via AWS     | Managed API Service     | Serverless APIs |
| **Kong**            | 🔄 API Gateway | Open-source API Gateway | API Management  |
| **Traefik**         | 🔄 Routing     | Modern HTTP Router      | Load Balancing  |
| **tRPC**            | 🔄 Community   | Type-safe APIs          | TypeScript APIs |

---

### 🔍 Infrastructure as Code (IaC)

| Tool               | MCP          | Sprache              | Best For                 |
| ------------------ | ------------ | -------------------- | ------------------------ |
| **Terraform**      | ✅ Available | HCL                  | Multi-cloud IaC Standard |
| **CloudFormation** | ✅ Via AWS   | JSON/YAML            | AWS-only                 |
| **Pulumi**         | ✅ Available | Python/Go/TypeScript | Programmable IaC         |
| **CDK**            | ✅ Available | TypeScript/Python    | AWS CDK                  |
| **Bicep**          | 🔄 Community | Bicep                | Azure IaC                |
| **Jsonnet**        | 🔄 Community | Jsonnet              | Templating Language      |
| **Helm Charts**    | ✅ Available | K8s Packages         | K8s Deployment           |
| **Vagrant**        | 🔄 Community | Ruby-based           | VM Management            |

**Dev-Config Setup:**

```bash
# Primär: Terraform
# Sekundär: Helm für K8s Deployments
# Optional: Pulumi als Alternative
```

---

### 👥 User & Team Management

| Tool              | MCP           | Beschreibung                  |
| ----------------- | ------------- | ----------------------------- |
| **GitHub Teams**  | ✅ Built-in   | GitHub Org Management         |
| **GitLab Groups** | ✅ Built-in   | GitLab Org Management         |
| **Authentik**     | 🔄 OSS        | Self-hosted Identity Provider |
| **Keycloak**      | 🔄 OSS        | Open-source IAM               |
| **Okta**          | 🔄 Enterprise | Cloud Identity Management     |
| **Auth0**         | 🔄 SaaS       | Identity Platform             |

---

### 🌐 Cloud Provider Tools

#### AWS

```bash
# MCP: ✅ Verfügbar
# CLI Tools (mcp-helpers.sh alias)
alias aws-whoami='aws sts get-caller-identity'
alias aws-profile='echo Current: $AWS_PROFILE'

# Empfohlene Services:
- EC2 (VMs)
- ECS/EKS (Container)
- RDS/DynamoDB (Database)
- S3 (Object Storage)
- Lambda (Serverless)
- Secrets Manager
- CloudFormation/CDK
```

#### Google Cloud (Empfohlen hinzufügen)

```bash
# Integration via gcloud CLI
# Services:
- Cloud Run (Containerized Apps)
- Cloud Functions (Serverless)
- GKE (Kubernetes)
- Cloud SQL (Managed Database)
- Firestore (NoSQL)
```

#### Azure (Empfohlen hinzufügen)

```bash
# Integration via Azure CLI
# Services:
- App Service (Web Apps)
- Container Instances
- AKS (Kubernetes)
- Azure SQL Database
# IaC: Bicep oder Terraform
```

---

## 🎯 Empfohlene Erweiterungen für dev-config

### Basierend auf dem Setup:

```json
{
  "essentials": ["github", "gitlab", "docker", "terraform", "kubernetes"],
  "recommended": ["postgresql", "openapi", "aws"],
  "optional_soon": ["vault", "prometheus", "grafana", "argocd", "helm"],
  "consideration": ["ansible", "datadog", "sentry"]
}
```

---

## 🔧 Installation nächster Tools

### Prometheus + Grafana

```bash
# Docker-basiert (einfachste Methode)
docker run -d -p 9090:9090 prom/prometheus
docker run -d -p 3000:3000 grafana/grafana

# Oder via Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack
```

### Vault

```bash
# Installation
brew install vault

# Development Server
vault server -dev

# Oder Docker
docker run -d -p 8200:8200 vault
```

### ArgoCD

```bash
# Installation auf K8s
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Access
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Get Admin Password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### Ansible

```bash
# Installation
pip install ansible
# oder
brew install ansible

# Validate Installation
ansible --version
```

---

## 🔗 Useful Resources

- **MCP Servers**: https://github.com/modelcontextprotocol/servers
- **Awesome DevOps**: https://github.com/awesome-soft/awesome-devops
- **Cloud Native Landscape**: https://landscape.cncf.io/
- **OSS Alternatives**: https://www.opensourcealternatives.to/

---

## 📝 Next Steps für dev-config

1. ✅ **Aktueller Status**: GitHub, GitLab, Docker, Terraform, Kubernetes, PostgreSQL
2. 🔄 **Nächste Phase**: AWS, ArgoCD, Prometheus/Grafana
3. 🎯 **Später**: Vault, Ansible, Datadog
4. 💡 **Über Zeit**: Multi-Cloud (Azure, GCP), spezifische Anforderungen

---

**Fragen? Weitere Tools gewünscht? Einfach in `.cline_mcp_config.json` hinzufügen!**
