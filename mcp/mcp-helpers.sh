#!/bin/bash
# 🤖 MCP Helper Functions & Aliases
# Füge zu deiner ~/.zshrc oder ~/.bashrc hinzu:
# source /Users/philipp/work/priv/dev-config/mcp/mcp-helpers.sh

# ============================================================
# 🔧 MCP Utility Functions
# ============================================================

# Check MCP Connection Status
mcp-status() {
    echo "📊 MCP Server Status:"
    echo ""
    echo "Checking servers..."
    
    # GitHub
    if command -v gh &> /dev/null && [ -n "$GITHUB_TOKEN" ]; then
        echo "  ✅ GitHub: Connected ($(gh auth status --show-token 2>/dev/null | head -1))"
    else
        echo "  ❌ GitHub: Not configured (missing gh CLI or GITHUB_TOKEN)"
    fi
    
    # Docker
    if docker info > /dev/null 2>&1; then
        echo "  ✅ Docker: Running ($(docker --version))"
    else
        echo "  ❌ Docker: Not running or not accessible"
    fi
    
    # Terraform
    if command -v terraform &> /dev/null; then
        echo "  ✅ Terraform: $(terraform version -json | jq -r '.terraform_version')"
    else
        echo "  ❌ Terraform: Not installed"
    fi
    
    # Kubernetes
    if command -v kubectl &> /dev/null; then
        KCTX=$(kubectl config current-context 2>/dev/null)
        echo "  ✅ Kubernetes: Context=$KCTX"
    else
        echo "  ❌ Kubernetes: kubectl not installed"
    fi
    
    # PostgreSQL
    if command -v psql &> /dev/null; then
        echo "  ✅ PostgreSQL: Installed"
    else
        echo "  ❌ PostgreSQL: psql not installed"
    fi
    
    # Context7
    if [ -n "$CONTEXT7_API_KEY" ]; then
        echo "  ✅ Context7: API Key configured"
    else
        echo "  ⚠️  Context7: No API Key (get one: https://context7.com/dashboard)"
    fi
    
    echo ""
}

# Load MCP Environment
mcp-load() {
    if [ -f ~/.env.mcp ]; then
        source ~/.env.mcp
        echo "✅ MCP environment loaded from ~/.env.mcp"
    else
        echo "❌ ~/.env.mcp not found. Run: cp .env.mcp.template ~/.env.mcp"
        return 1
    fi
}

# Edit MCP Config
mcp-config() {
    ${EDITOR:-nano} "/Users/philipp/work/priv/dev-config/mcp/.cline_mcp_config.json"
}

# Edit MCP Environment
mcp-env() {
    ${EDITOR:-nano} ~/.env.mcp
}

# Validate MCP Configuration
mcp-validate() {
    echo "🔍 Validating MCP Configuration..."
    echo ""
    
    CONFIG_FILE="/Users/philipp/work/priv/dev-config/mcp/.cline_mcp_config.json"
    
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "❌ Config file not found: $CONFIG_FILE"
        return 1
    fi
    
    # JSON Validation
    if command -v jq &> /dev/null; then
        if jq empty "$CONFIG_FILE" 2>/dev/null; then
            echo "✅ JSON Syntax: Valid"
        else
            echo "❌ JSON Syntax: Invalid"
            jq . "$CONFIG_FILE" 2>&1 | head -20
            return 1
        fi
    fi
    
    # Check Environment Variables
    echo ""
    echo "Environment Variables:"
    [ -n "$GITHUB_TOKEN" ] && echo "  ✅ GITHUB_TOKEN is set" || echo "  ⚠️  GITHUB_TOKEN not set"
    [ -n "$GITLAB_TOKEN" ] && echo "  ✅ GITLAB_TOKEN is set" || echo "  ⚠️  GITLAB_TOKEN not set"
    [ -n "$CONTEXT7_API_KEY" ] && echo "  ✅ CONTEXT7_API_KEY is set" || echo "  ⚠️  CONTEXT7_API_KEY not set"
    [ -n "$AWS_PROFILE" ] && echo "  ✅ AWS_PROFILE=$AWS_PROFILE" || echo "  ⚠️  AWS_PROFILE not set"
    [ -n "$KUBECONFIG" ] && echo "  ✅ KUBECONFIG is set" || echo "  ⚠️  KUBECONFIG not set"
    [ -n "$DOCKER_HOST" ] && echo "  ✅ DOCKER_HOST is set" || echo "  ⚠️  DOCKER_HOST not set"
    
    echo ""
    echo "✅ Validation complete!"
}

# Setup MCP
mcp-setup() {
    echo "🚀 Running MCP Setup..."
    bash /Users/philipp/work/priv/dev-config/mcp/setup-mcp.sh
}

# Reinstall MCP Servers
mcp-reinstall() {
    echo "📦 Reinstalling MCP servers..."
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
    echo "✅ MCP servers reinstalled"
}

# View MCP Logs
mcp-logs() {
    if [ -d "$HOME/.cline" ]; then
        tail -f "$HOME/.cline/logs.txt" 2>/dev/null || echo "No logs found"
    else
        echo "🤖 Cline logs are typically in VS Code output panel"
        echo "   View: Command Palette > Output > Cline"
    fi
}

# Generate MCP Context (useful for sharing)
mcp-context() {
    echo "📋 MCP Configuration Context:"
    echo ""
    echo "File: .cline_mcp_config.json"
    echo "Location: /Users/philipp/work/priv/dev-config/mcp/"
    echo ""
    echo "Available Servers:"
    if command -v jq &> /dev/null; then
        jq -r '.mcpServers | keys[]' /Users/philipp/work/priv/dev-config/mcp/.cline_mcp_config.json
    else
        grep '"[a-z]*":' /Users/philipp/work/priv/dev-config/mcp/.cline_mcp_config.json | sed 's/.*"\([^"]*\)".*/  - \1/'
    fi
    echo ""
    echo "Setup Guide: /Users/philipp/work/priv/dev-config/mcp/MCP_SETUP.md"
}

# ============================================================
# 🎯 Praktische Aliase
# ============================================================

# MCP Management
alias mcp='echo "MCP Commands: mcp-status, mcp-load, mcp-config, mcp-env, mcp-validate, mcp-setup, mcp-logs, mcp-context"'
alias mcp-help='mcp'

# GitHub
alias gh-token-new='open https://github.com/settings/tokens/new'
alias gh-repos='gh repo list --limit 100'

# GitLab  
alias gl-token-new='open https://gitlab.com/-/user_settings/personal_access_tokens'

# Docker
alias docker-cleanup='docker system prune -a --force'
alias docker-images='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"'
alias docker-containers='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Size}}"'

# Kubernetes
alias k='kubectl'
alias kctx='kubectl config current-context'
alias kns='kubectl config get-contexts'

# Terraform
alias tf='terraform'
alias tf-plan='terraform plan -out=tfplan'
alias tf-apply='terraform apply tfplan'
alias tf-validate='terraform validate'
alias tf-fmt='terraform fmt -recursive'

# PostgreSQL
alias psql-local='psql -h localhost -U postgres'

# AWS
alias aws-whoami='aws sts get-caller-identity'
alias aws-profile='echo "Current profile: $AWS_PROFILE"'

# Development
alias dev-config='cd /Users/philipp/work/priv/dev-config'
alias mcp-repo='cd /Users/philipp/work/priv/dev-config && pwd'

# ============================================================
# 📝 Initialization
# ============================================================

# Auto-load MCP environment wenn available
if [ -f ~/.env.mcp ]; then
    source ~/.env.mcp
    # echo "MCP environment loaded ✅"
fi

# ============================================================
# ℹ️ Info
# ============================================================

# Optionale Startup Message
# echo "🤖 MCP Helpers loaded. Try: mcp-help"
