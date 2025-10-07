# === ZSH Basics ===
export ZSH="$HOME/.oh-my-zsh"

# Set Theme (Starship prompt empfohlen)
#ZSH_THEME="robbyrussell"   # wird durch Starship überschrieben

# === Plugins ===
plugins=(
  git
  docker
  kubectl
  kubectx
  terraform
  fzf
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  command-not-found
  kitty
  macos
)

source $ZSH/oh-my-zsh.sh

# === Starship Prompt ===
eval "$(starship init zsh)"
source <(fzf --zsh)

# === History ===
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE
setopt SHARE_HISTORY

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
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# === Extra DevOps Helpers ===
# Show active k8s context in prompt (via Starship)
export STARSHIP_CONFIG=~/.config/starship.toml
eval $(thefuck --alias FUCK)
eval $(thefuck --alias) 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/philippmatthiashauptmann/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


