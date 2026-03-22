# 🤖 Model Context Protocol (MCP) Setup Guide

Zentrale MCP-Konfiguration für VS Code, Cline und andere AI-Tools mit Anbindung von DevOps-Tools.

---

## 📋 Übersicht verfügbarer MCP-Server

| Tool           | Status         | Beschreibung                        | Env. Variable                 |
| -------------- | -------------- | ----------------------------------- | ----------------------------- |
| **GitHub**     | ✅ Aktiv       | GitHub Issues, PRs, Repos verwalten | `GITHUB_TOKEN`                |
| **GitLab**     | ✅ Aktiv       | GitLab Issues, Pipelines, Repos     | `GITLAB_TOKEN`, `GITLAB_HOST` |
| **Docker**     | ✅ Aktiv       | Container & Images verwalten        | `DOCKER_HOST`                 |
| **Terraform**  | ✅ Aktiv       | Infrastruktur als Code              | `TF_VAR_*`                    |
| **Kubernetes** | ✅ Aktiv       | K8s Cluster & Ressourcen            | `KUBECONFIG`                  |
| **PostgreSQL** | ✅ Aktiv       | Datenbank-Queries & Management      | `DATABASE_URL`                |
| **Context7**   | ✅ Aktiv       | Up-to-date Code Dokumentation       | `CONTEXT7_API_KEY`            |
| **AWS**        | ⏸️ Deaktiviert | Cloud-Infrastruktur (aktivierbar)   | `AWS_PROFILE`, `AWS_REGION`   |
| **OpenAPI**    | ✅ Aktiv       | REST API Integration                | -                             |
| **Memory**     | ✅ Aktiv       | MCP Memory-Management               | -                             |

---

## 🚀 Schnellstart

### 1. Environment Variables einrichten

Erstelle eine `.env`-Datei im Home-Verzeichnis oder laden diese in dein Shell-Profile:

```bash
# GitHub
export GITHUB_TOKEN="ghp_xxxxxxxxxxxx"

# GitLab (optional)
export GITLAB_TOKEN="glpat_xxxxxxxxxxxx"
export GITLAB_HOST="https://gitlab.com"  # oder dein selbstgehostetes GitLab

# Docker
export DOCKER_HOST="unix:///var/run/docker.sock"  # macOS Standard

# AWS (optional)
export AWS_PROFILE="default"
export AWS_REGION="eu-central-1"

# Kubernetes
export KUBECONFIG="$HOME/.kube/config"

# Datenbank (optional)
export DATABASE_URL="postgresql://user:password@localhost:5432/dbname"
```

### 2. MCP-Konfiguration in VS Code einrichten

**Option A: Symlink (empfohlen)**

```bash
# VS Code Settings Directory
mkdir -p ~/.vscode
ln -sf ~/work/priv/dev-config/mcp/.cline_mcp_config.json ~/.vscode/mcp_config.json
```

**Option B: Manuell in `settings.json`**

```bash
open ~/.config/Code/User/settings.json
```

Füge folgendes ein:

```json
{
  "mcp.configFile": "/Users/philipp/work/priv/dev-config/.cline_mcp_config.json"
}
```

### 3. Cline Extension konfigurieren

Falls du **Cline** nutzt (VS Code Extension für Claude):

```bash
mkdir -p ~/.cline
ln -sf ~/work/priv/dev-config/mcp/.cline_mcp_config.json ~/.cline/config.json
```

---

## 🔧 MCP-Server Installation

Alle Server werden via npm installiert. Falls du offline arbeiten möchtest:

```bash
# Alle MCP-Server global installieren
npm install -g \
  @modelcontextprotocol/server-github \
  @modelcontextprotocol/server-gitlab \
  @modelcontextprotocol/server-docker \
  @modelcontextprotocol/server-terraform \
  @modelcontextprotocol/server-kubernetes \
  @modelcontextprotocol/server-postgresql \
  @upstash/context7-mcp \
  @modelcontextprotocol/server-aws \
  @modelcontextprotocol/server-openapi \
  @modelcontextprotocol/server-memory
```

---

## 📚 Server-spezifische Konfiguration

### GitHub

```bash
# PAT mit diesen Scopes erstellen:
# - repo (full control)
# - gist
# - workflow (optional)
# - read:org (für Org-Repos)

export GITHUB_TOKEN="ghp_xxxxxxxxxxxx"
```

### GitLab

```bash
# Access Token mit Scopes erstellen:
# - api (REST API)
# - read_repository
# - write_repository (optional)

export GITLAB_TOKEN="glpat_xxxxxxxxxxxx"
export GITLAB_HOST="https://gitlab.com"  # oder Instanz-URL
```

### Docker

```bash
# ✅ Auf macOS funktioniert standardmäßig:
export DOCKER_HOST="unix:///var/run/docker.sock"

# Falls via TCP:
export DOCKER_HOST="tcp://127.0.0.1:2375"
```

### Terraform

```bash
# Terraform working directory setzen
export TF_ROOT="~/work/infrastructure"

# Backend konfigurieren (z.B. AWS S3, Terraform Cloud)
export TF_CLOUD_TOKEN="xxxxxxxxxxxx"
export TF_CLOUD_ORGANIZATION="your-org"
```

### Kubernetes

```bash
# kubeconfig Datei setzen
export KUBECONFIG="$HOME/.kube/config"

# Kontext prüfen:
kubectl config current-context
```

### PostgreSQL

```bash
# Verbindungs-String
export DATABASE_URL="postgresql://user:password@localhost:5432/database"

# Local Development:
export DATABASE_URL="postgresql://postgres:password@localhost:5432/dev_db"
```

### Context7

```bash
# Kostenlos registrieren: https://context7.com/dashboard
# Fetcht up-to-date Code-Dokumentation direkt in deine Prompts
export CONTEXT7_API_KEY="ctx7_xxxxxxxxxxxx"

# Optional: Automatisches Setup (empfohlen)
# npx ctx7 setup
# Dieser MCP Server ist bereits in .cline_mcp_config.json konfiguriert
```

**Feature-Highlights:**

- 📚 Fetcht aktuelle Dokumentation von 1000+ Libraries
- 📌 Version-spezifisch (z.B. Next.js 14 vs 13)
- ✨ Perfekt für Code-Generation ohne Halluzinationen
- 🔧 Funktioniert in Cursor, Cline, Claude Code, VS Code

### AWS

```bash
# Aktiviere in der MCP-Config:
# "disabled": false

export AWS_PROFILE="default"
export AWS_REGION="eu-central-1"
export AWS_ACCESS_KEY_ID="AKIA..."
export AWS_SECRET_ACCESS_KEY="..."
```

---

## 💡 Zusätzliche empfohlene DevOps-Tools

Folgende Tools können ebenfalls als MCP-Server integriert werden:

### 🔐 Secrets Management

- **HashiCorp Vault** - Zentrale Secret-Verwaltung
- **AWS Secrets Manager** - AWS-native Secrets
- **1Password** - Team Password Management

### 📊 Monitoring & Observability

- **Prometheus** - Metrics & Alerting
- **Grafana** - Dashboarding
- **Datadog** - Cloud Monitoring
- **New Relic** - APM & Monitoring
- **ELK Stack** - Logging

### 🚀 CI/CD & Deployment

- **Jenkins** - CI/CD Pipeline Orchestration
- **ArgoCD** - GitOps Deployment
- **Helm** - Kubernetes Package Manager
- **Ansible** - Infrastructure Automation

### ☁️ Cloud Providers

- **Azure** (für multi-cloud Setup)
- **Google Cloud** - GCP Services

### 📦 Package & Container Registry

- **Docker Registry** - Private Container Images
- **Artifactory** - Artifact Repository
- **Nexus** - Package Management

### 📡 API & Integration

- **GraphQL** - Query API Integration
- **Kafka** - Event Streaming
- **RabbitMQ** - Message Broker

---

## ✅ Validierung

Teste deine MCP-Installation:

```bash
# Alle Server durchlaufen (braucht entsprechende Credentials)
echo "GitHub:" && npm exec -- "@modelcontextprotocol/server-github" --version
echo "Docker:" && npm exec -- "@modelcontextprotocol/server-docker" --version
echo "Terraform:" && npm exec -- "@modelcontextprotocol/server-terraform" --version
```

Oder direkter Test in VS Code:

1. Öffne Cline/Claude Extension
2. Aktiviere MCP Tools
3. Teste mit: `@github list-repos` oder `@docker list-containers`

---

## 🔗 Useful Links

- [MCP Official Docs](https://modelcontextprotocol.io)
- [GitHub MCP Server](https://github.com/modelcontextprotocol/servers)
- [Cline Extension](https://github.com/cline/cline)

---

## 📝 Sicherheitshinweise

⚠️ **WICHTIG:**

- Token niemals in Git committen
- `.env` zu `.gitignore` hinzufügen
- Für Secrets lieber Vault oder 1Password nutzen
- Tokens regelmäßig rotieren
- PAT mit minimalen Scopes erstellen

---

## 🎯 Checkliste für Setup

- [ ] `.cline_mcp_config.json` im Repository
- [ ] Environment Variables konfiguriert
- [ ] MCP Server via npm installiert
- [ ] GitHub Token erstellt & exportiert
- [ ] GitLab Token erstellt (falls verwendet)
- [ ] Docker Socket konfiguriert
- [ ] Terraform Credentials gespeichert
- [ ] kubeconfig vorhanden (falls K8s)
- [ ] Cline/Claude Extension aktiviert
- [ ] MCP-Verbindung getestet
