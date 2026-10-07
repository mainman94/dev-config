# AGENTS

macOS dotfiles (zsh, starship, tmux, ghostty) and MCP setup notes. The files
are symlinked into `$HOME` (see readme.md), so **an edit here changes the
live shell config immediately**.

## Rules

- Check zsh changes with `zsh -n .zshrc` before saving. A syntax error breaks
  every new terminal.
- Secrets never go into this repo. `mcp/.env.mcp.template` holds placeholders
  only. Real values go into a local, gitignored `.env.mcp`.
- Keep `readme.md` in sync when a tool, plugin, or symlink is added.
