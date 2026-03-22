#!/bin/bash

# 🤖 MCP Setup Script für macOS
# Installiert und konfiguriert alle MCP-Server

set -e

echo "🚀 MCP Configuration Setup für macOS"
echo "===================================="
echo ""

# Farben
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Node/npm Check
echo -e "${BLUE}[1/5]${NC} Prüfe Node.js/npm Installation..."
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm nicht gefunden. Bitte installieren Sie Node.js:${NC}"
    echo "   brew install node"
    exit 1
fi
echo -e "${GREEN}✓ npm Version: $(npm -v)${NC}"
echo ""

# 2. MCP Server Installation
echo -e "${BLUE}[2/5]${NC} Installiere MCP-Server..."
echo "Bitte warten, das kann 2-3 Minuten dauern..."
echo ""

MCP_SERVERS=(
    "@modelcontextprotocol/server-github"
    "@modelcontextprotocol/server-gitlab"
    "@modelcontextprotocol/server-docker"
    "@modelcontextprotocol/server-terraform"
    "@modelcontextprotocol/server-kubernetes"
    "@modelcontextprotocol/server-postgresql"    "@upstash/context7-mcp"\    "@modelcontextprotocol/server-aws"
    "@modelcontextprotocol/server-openapi"
    "@modelcontextprotocol/server-memory"
)

for server in "${MCP_SERVERS[@]}"; do
    echo "  → Installing $server..."
    npm install -g "$server" > /dev/null 2>&1 || echo -e "${YELLOW}  ⚠ Warnung: $server möglicherweise nicht verfügbar${NC}"
done
echo -e "${GREEN}✓ MCP Server installiert${NC}"
echo ""

# 3. VS Code Konfiguration
echo -e "${BLUE}[3/5]${NC} Konfiguriere VS Code..."
VS_CODE_CONFIG="$HOME/.config/Code/User/settings.json"

if [ -f "$VS_CODE_CONFIG" ]; then
    # Prüfe ob mcp.configFile bereits existiert
    if ! grep -q "mcp.configFile" "$VS_CODE_CONFIG"; then
        echo "  → Füge MCP Config zu settings.json hinzu..."
        # Einfache JSON-Manipulation (könnte auch jq verwenden)
        echo -e "${YELLOW}  ⚠ Bitte manuell hinzufügen:${NC}"
        echo '    "mcp.configFile": "/Users/philipp/work/priv/dev-config/.cline_mcp_config.json"'
    else
        echo -e "${GREEN}✓ MCP Config bereits in settings.json${NC}"
    fi
else
    echo -e "${YELLOW}⚠ VS Code settings.json nicht gefunden (VS Code nicht installiert?)${NC}"
fi
echo ""

# 4. Environment Setup
echo -e "${BLUE}[4/5]${NC} Erstelle .env.local Template..."
ENV_FILE="$HOME/.env.mcp"

if [ ! -f "$ENV_FILE" ]; then
    cat > "$ENV_FILE" << 'EOF'
# 🤖 MCP Environment Configuration
# Speichern unter ~/.env.mcp und die folgende Zeile zu ~/.zshrc/.bashrc hinzufügen:
# [ -f ~/.env.mcp ] && source ~/.env.mcp

# GitHub
export GITHUB_TOKEN="ghp_your_token_here"

# GitLab (optional)
export GITLAB_TOKEN="glpat_your_token_here"
export GITLAB_HOST="https://gitlab.com"

# Docker
export DOCKER_HOST="unix:///var/run/docker.sock"

# AWS (optional)
export AWS_PROFILE="default"
export AWS_REGION="eu-central-1"

# Kubernetes
export KUBECONFIG="$HOME/.kube/config"

# Database (optional)
export DATABASE_URL="postgresql://user:password@localhost:5432/dbname"

# Terraform (optional)
export TF_CLOUD_TOKEN="xxxxxxxxxxxx"
export TF_CLOUD_ORGANIZATION="your-org"
EOF
    echo -e "${GREEN}✓ .env.mcp Template erstellt${NC}"
    echo -e "  → Speicherort: $ENV_FILE"
    echo -e "  ${YELLOW}→ Bitte editieren und Token eintragen:${NC}"
    echo "    nano ~/.env.mcp"
else
    echo -e "${GREEN}✓ .env.mcp existiert bereits${NC}"
fi
echo ""

# 5. Shell Configuration
echo -e "${BLUE}[5/5]${NC} Prüfe Shell-Konfiguration..."
SHELL_RC="${SHELL##*/}"
if [[ "$SHELL_RC" == "zsh" ]]; then
    SHELL_CFG="$HOME/.zshrc"
elif [[ "$SHELL_RC" == "bash" ]]; then
    SHELL_CFG="$HOME/.bashrc"
fi

if [ -f "$SHELL_CFG" ] && ! grep -q "\.env\.mcp" "$SHELL_CFG"; then
    echo -e "  ${YELLOW}→ Bitte folgende Zeile zu $SHELL_CFG hinzufügen:${NC}"
    echo "    [ -f ~/.env.mcp ] && source ~/.env.mcp"
    echo ""
    echo "  Automatisch hinzufügen? (j/n)"
    read -r response
    if [[ "$response" == "j" ]]; then
        echo "[ -f ~/.env.mcp ] && source ~/.env.mcp" >> "$SHELL_CFG"
        echo -e "${GREEN}✓ Hinzugefügt zu $SHELL_CFG${NC}"
    fi
else
    echo -e "${GREEN}✓ Shell ist bereits konfiguriert${NC}"
fi
echo ""

# Summary
echo "===================================="
echo -e "${GREEN}✅ MCP Setup abgeschlossen!${NC}"
echo ""
echo "Nächste Schritte:"
echo "1. ${YELLOW}Editiere ~/.env.mcp${NC} und trage deine Tokens ein:"
echo "   nano ~/.env.mcp"
echo ""
echo "2. ${YELLOW}Shell neu laden:${NC}"
echo "   source ~/.zshrc  # oder ~/.bashrc"
echo ""
echo "3. ${YELLOW}VS Code neu starten${NC} (Code Komplettieren)"
echo ""
echo "4. ${YELLOW}Teste MCP-Verbindung${NC} in Cline oder Claude Extension"
echo ""
echo "Weitere Infos: MCP_SETUP.md"
