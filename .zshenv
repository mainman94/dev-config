# === FZF Defaults ===
export FZF_DEFAULT_OPTS='--reverse --border --exact --height=50%'
export FZF_ALT_C_COMMAND='fd --type directory'
[[ $OSTYPE =~ ^darwin.* ]] && export FZF_CTRL_T_COMMAND="mdfind -onlyin . -name ."

# === Homebrew ===
export HOMEBREW_NO_ENV_HINTS=1
