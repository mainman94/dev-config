# 🚀 MCP Integration Guide (Schnellstart)

Zentrale MCP-Konfiguration für VS Code, Cline & Claude Integration.

---

## 📦 Was wurde erstellt?

```
/Users/philipp/work/priv/dev-config/
├── .cline_mcp_config.json          ← 🎯 Zentrale MCP-Konfiguration
├── .env.mcp.template               ← 📋 Environment Template (rename & fill)
├── MCP_SETUP.md                    ← 📚 Detaillierte Dokumentation
├── setup-mcp.sh                    ← 🤖 Automatisiertes Setup-Skript
├── mcp-helpers.sh                  ← 🛠️  Shell Helper Functions & Aliase
├── vscode-mcp-settings.json        ← ⚙️  VS Code Settings Snippet
└── .gitignore                      ← 🔐 Updated (sensible Dateien excluded)
```

---

## ⚡ Schnellstart (5 Minuten)

### 1️⃣ Setup-Skript ausführen

```bash
cd /Users/philipp/work/priv/dev-config/mcp
./setup-mcp.sh
```

### 2️⃣ Environment konfigurieren

```bash
# Kopiere Template
cp .env.mcp.template ~/.env.mcp

# Editiere und füge Token ein
nano ~/.env.mcp
```

**Minimal benötigte Token:**

- `GITHUB_TOKEN`: https://github.com/settings/tokens/new
- `GITLAB_TOKEN` (optional): https://gitlab.com/-/user_settings/personal_access_tokens

### 3️⃣ Shell konfigurieren

```bash
# Füge zu deiner ~/.zshrc oder ~/.bashrc hinzu:
[ -f ~/.env.mcp ] && source ~/.env.mcp
source /Users/philipp/work/priv/dev-config/mcp-helpers.sh
```

Dann neu laden:

```bash
source ~/.zshrc  # oder ~/.bashrc
```

### 4️⃣ VS Code konfigurieren

**Option A: Automatisch (symlink)**

```bash
mkdir -p ~/.vscode
ln -sf /Users/philipp/work/priv/dev-config/.cline_mcp_config.json ~/.vscode/mcp_config.json
```

**Option B: Manuell in VS Code Settings**

1. Öffne: `Cmd + Shift + P` → "Preferences: Open Settings (JSON)"
2. Füge hinzu:

```json
{
  "mcp.configFile": "/Users/philipp/work/priv/dev-config/.cline_mcp_config.json"
}
```

### 5️⃣ Validieren

```bash
# Test MCP Status
mcp-status

# Validiere Konfiguration
mcp-validate

# Zeige verfügbare MCP Server
mcp-context
```

---

## 🔧 Integration Optionen

### 🤖 VS Code + Cline Extension

```bash
# 1. Installiere Cline: https://github.com/cline/cline
# 2. Extension Settings öffnen (Gear Icon)
# 3. MCP Config Path setzen:
#    /Users/philipp/work/priv/dev-config/.cline_mcp_config.json
# 4. Cline neu starten
```

### 🤖 VS Code + Copilot (GitHub Enterprise)

```json
// In ~/.config/Code/User/settings.json:
{
  "github.copilot.enable": true,
  "mcp.configFile": "/Users/philipp/work/priv/dev-config/.cline_mcp_config.json"
}
```

### 💻 Terminal Direct Access

Alias nutzen zur direkten Interaktion:

```bash
# GitHub
gh-repos                  # Alle Repos zeigen
gh pr list               # PRs zeigen

# Docker
docker-containers        # Alle Container
docker-cleanup          # System bereinigen

# Kubernetes
k get pods              # Alle Pods
kctx                    # Zeige aktuellen Kontext

# Terraform
tf-plan                 # Plan erstellen
tf-validate             # Validieren

# MCP Status
mcp-status              # Alle Connected Services
```

---

## 📚 Verfügbare Tools & Services

| Tool           | Aktiv | Beschreibung         | Setup            |
| -------------- | ----- | -------------------- | ---------------- |
| **GitHub**     | ✅    | Issues, PRs, Repos   | `GITHUB_TOKEN`   |
| **GitLab**     | ✅    | Pipelines, Repos     | `GITLAB_TOKEN`   |
| **Docker**     | ✅    | Container Management | `DOCKER_HOST`    |
| **Terraform**  | ✅    | Infrastruktur        | `TF_CLOUD_TOKEN` |
| **Kubernetes** | ✅    | Cluster Management   | `KUBECONFIG`     |
| **PostgreSQL** | ✅    | Database Queries     | `DATABASE_URL`   |
| **AWS**        | ⏸️    | Cloud Services       | `AWS_PROFILE`    |
| **OpenAPI**    | ✅    | REST API Integration | -                |

### 🎁 Zusätzlich empfohlen:

**Secrets Management:**

- HashiCorp Vault
- 1Password CLI
- AWS Secrets Manager

**Monitoring:**

- Prometheus
- Grafana
- Datadog

**CI/CD:**

- ArgoCD
- Jenkins
- GitHub Actions (native)

**Database:**

- Redis
- MongoDB
- MySQL/MariaDB

---

## 🧪 Testing & Debugging

### Test Individual Server

```bash
# GitHub Test
gh auth status

# Docker Test
docker ps

# Terraform Test
terraform version

# Kubernetes Test
kubectl config current-context
```

### Troubleshooting

**Problem: Token nicht erkannt**

```bash
# Prüfe ob .env.mcp geladen wird
echo $GITHUB_TOKEN

# Neu laden:
source ~/.env.mcp
mcp-validate
```

**Problem: MCP Server startet nicht**

```bash
# Prüfe Node/npm
npm --version

# Reinstalliere Server
mcp-reinstall

# Schau in VS Code Output Panel
# Command Palette → Output → Cline/MCP
```

**Problem: VS Code erkennt Config nicht**

```bash
# Prüfe Config Pfad
cat ~/.vscode/mcp_config.json

# Oder symlink neu erstellen
rm ~/.vscode/mcp_config.json
ln -sf /Users/philipp/work/priv/dev-config/.cline_mcp_config.json ~/.vscode/mcp_config.json

# Restart VS Code
```

---

## 📖 Weitere Ressourcen

- **Detailed Setup**: [MCP_SETUP.md](MCP_SETUP.md)
- **MCP Official Docs**: https://modelcontextprotocol.io
- **GitHub MCP Server**: https://github.com/modelcontextprotocol/servers
- **Cline Extension**: https://github.com/cline/cline

---

## 📋 Checkliste

- [ ] Setup-Skript ausgeführt (`./setup-mcp.sh`)
- [ ] `.env.mcp` erstellt und konfiguriert (`nano ~/.env.mcp`)
- [ ] Shell-Profile aktualisiert (`.zshrc` / `.bashrc`)
- [ ] VS Code MCP Config gesetzt (symlink oder settings.json)
- [ ] Cline Extension installiert (falls verwendet)
- [ ] `mcp-validate` erfolgreich ausgeführt
- [ ] `mcp-status` zeigt aktive Server
- [ ] GitHub/GitLab API erreichbar (`gh auth status`, etc.)
- [ ] Token haben passende Scopes

---

## 💡 Nützliche Befehle

```bash
# MCP Management
mcp-status           # Status aller Server
mcp-validate         # Validiere Konfiguration
mcp-load             # Lade .env.mcp
mcp-config           # Editiere MCP Config
mcp-env              # Editiere .env.mcp
mcp-logs             # Zeige MCP Logs
mcp-context          # Zeige verfügbare Server

# Schnelle Checks
gh auth status       # GitHub Check
docker ps            # Docker Check
kubectl config current-context  # K8s Check
terraform version    # Terraform Check
psql --version       # PostgreSQL Check

# Repository
dev-config           # CD zu dev-config
mcp-repo            # CD zu dev-config (alternative)
```

---

**🎉 Fertig! Deine zentrale MCP-Konfiguration ist einsatzbereit.**

Fragen? Schau in [MCP_SETUP.md](MCP_SETUP.md) für detaillierte Dokumentation.
