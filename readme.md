# Dev Config Setup

A collection of configuration files and setup instructions for a productive development environment on macOS.

## Symlinks for Central Configuration Files

To apply changes from this repo immediately, set up symlinks.  
Falls die Zieldatei schon existiert, entferne sie vorher:

```bash
rm -f ~/.config/starship.toml
ln -sf ~/work/priv/dev-config/.config/starship.toml ~/.config/starship.toml

rm -f ~/.zshrc
ln -sf ~/work/priv/dev-config/.zshrc ~/.zshrc

rm -f ~/.config/kitty/kitty.conf
ln -sf ~/work/priv/dev-config/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

rm -f ~/.config/kitty/current-theme.conf
ln -sf ~/work/priv/dev-config/.config/kitty/current-theme.conf ~/.config/kitty/current-theme.conf


```

## Oh My Zsh Plugins

Some plugins must be cloned manually; others are included with Oh My Zsh.

### External Plugins (manual installation)

```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/history-substring-search
```

### Built-in Oh My Zsh Plugins

Add these to the `plugins` list in your `.zshrc` (no need to clone):

- dotenv
- helm
- gcloud
- aws
- pip
- argocd
- k9s
- thefuck

### Recommended Tools

Install these tools via Homebrew:

```bash
brew install fd ripgrep kubectx nvim kitty gh fzf k9s kubectl-argo-rollouts starhship tfenv
brew install --cask gcloud-sdk kitty font-jetbrains-mono-nerd-font
```

## Notes

- After changing `.zshrc` or `starship.toml`, restart your terminal or run `source ~/.zshrc`.
- Extend the plugin list in `.zshrc` as desired. See [Oh My Zsh Plugin List](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).
- For further customization, refer to the respective plugin repositories.

## Fonts

Download JetBrains Mono Nerd Font:

- [JetBrainsMono.zip](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)
