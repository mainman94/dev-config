# Dev Config Setup

## Symlinks für zentrale Konfigurationsdateien

Damit Änderungen im Repo sofort aktiv sind, kannst du Symlinks setzen:

```bash
ln -sf ~/work/priv/dev-config/.config/starship.toml ~/.config/starship.toml
ln -sf ~/work/priv/dev-config/.zshrc ~/.zshrc
```

## Oh My Zsh Plugins

Einige Plugins müssen manuell geklont werden, andere sind bereits in Oh My Zsh enthalten.

### Externe Plugins (müssen geklont werden)

```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/history-substring-search
```

### Plugins, die bereits in Oh My Zsh enthalten sind

Diese Plugins müssen **nicht** geklont werden, einfach in die Plugin-Liste in `.zshrc` aufnehmen:

- dotenv
- helm
- gcloud
- aws
- pip
- argocd
- k9s
- thefuck

### Tools (separat installieren)

- fd
- ripgrep

Installation z.B. via Homebrew:

```bash
brew install fd ripgrep
```

## Hinweise

- Nach Änderungen an `.zshrc` oder `starship.toml` das Terminal neu starten oder `source ~/.zshrc` ausführen.
- Die Plugin-Liste in `.zshrc` kann beliebig erweitert werden, siehe [Oh My Zsh Plugin List](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).
- Für weitere Anpassungen siehe die jeweiligen Plugin-Repos.
