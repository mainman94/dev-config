# === ZSH Basics ===
export ZSH="$HOME/.oh-my-zsh"

# === Theme (Starship prompt recommended) ===
# ZSH_THEME="robbyrussell"   # Overwritten by Starship

# === Starship Prompt ===
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# === Extra DevOps Helpers ===
export STARSHIP_CONFIG=~/.config/starship.toml


# === Plugins ===
plugins=(
  argocd
  brew
  colored-man-pages
  command-not-found
  docker
  dotenv
  fzf
  gcloud
  gh
  git
  git-auto-fetch:
  helm
  history-substring-search
  k9s
  kubectl
  kubectx
  macos
  pip
  podman
  terraform
  thefuck
  tldr
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# === FZF Integration ===
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# === History ===
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY HIST_VERIFY INC_APPEND_HISTORY EXTENDED_HISTORY APPEND_HISTORY HIST_REDUCE_BLANKS

# === Aliases ===
# --- DevOps ---
alias k='kubectl'
alias tf='terraform'
alias d='docker'
alias dc='docker compose'
alias lg='lazygit'
alias htop='htop -t'

# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'

alias vi='nvim'
# === Exports ===
export EDITOR="${EDITOR:-nvim}"
export PAGER="${PAGER:-less -FirSwX}"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# === Completion ===
autoload -Uz compinit
if [ -f ~/.zcompdump ]; then
  compinit -C
else
  compinit
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' rehash true

# === TMUX Integration ===
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  if [ "$TERM" = "xterm-kitty" ]; then
    exec tmux
  fi
fi

# === Node Version Manager ===
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# === Terminal Title ===
precmd() { print -Pn "\e]0;%n@%m: %~\a" }

# === macOS Specific ===
if [[ "$OSTYPE" == darwin* ]]; then
  # --- Homebrew Path ---
  if [ -d /opt/homebrew/bin ] && [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
# End of LM Studio CLI section


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/go/bin


# bun completions
[ -s "/Users/philippmatthiashauptmann/.bun/_bun" ] && source "/Users/philippmatthiashauptmann/.bun/_bun"
