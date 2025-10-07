# === ZSH Basics ===
export ZSH="$HOME/.oh-my-zsh"

# Set Theme (Starship prompt empfohlen)
#ZSH_THEME="robbyrussell"   # wird durch Starship überschrieben

# === Plugins ===
plugins=(
  aws
  colored-man-pages
  command-not-found
  docker
  dotenv
  fzf
  gcloud
  git
  helm
  history-substring-search
  kubectl
  macos
  pip
  terraform
  thefuck
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# === Starship Prompt ===
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# === History ===
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# === Aliases for DevOps ===
alias k=kubectl
alias tf=terraform
alias d=docker
alias dc="docker compose"
alias lg="lazygit"
alias htop="htop -t"

# safer navigation
alias ..="cd .."
alias ...="cd ../.."

# Quick kube namespace switch
alias kns="kubectl config set-context --current --namespace"

# === Exports ===
export EDITOR="vi"
export PAGER="less -FirSwX"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# === FZF Integration ===
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# === Completion ===
autoload -Uz compinit
if [ -d ~/.zcompdump ]; then
  compinit -C
else
  compinit
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' rehash true

# === Extra DevOps Helpers ===
# Show active k8s context in prompt (via Starship)
export STARSHIP_CONFIG=~/.config/starship.toml

export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Terminal-Title setzen
precmd() { print -Pn "\e]0;%n@%m: %~\a" }

# Homebrew Pfad ergänzen (optional, falls installiert und nicht schon im PATH)
if [ -d /opt/homebrew/bin ] && [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


