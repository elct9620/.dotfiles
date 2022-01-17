.dotfiles
=========

The Aotokitsuruya's Development Environment

Configure
---

### Tmux

```bash
brew install tmus
```

### Link Dotfiles

```bash
ln -s ~/.dotfiles ~/.tmux.conf
```

### ZSH

```bash
brew install zsh
```

### Oh My ZSH

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Auto Suggestions

```bash
brew install zsh-autosuggestions
```

### ZSH Syntax Highlight

```bash
brew install zsh-syntax-highlighting
```

### Link Dotfiles

```bash
rm ~/.zshrc
ln -s ~/.dotfiles ~/.zshrc
ln -s ~/.dotfiles/.dotfiles/.oh-my-zsh/themes/aotoki.zsh-theme ~/.dotfiles/.oh-my-zsh/themes/aotoki.zsh-theme
```

### Coreutils

```bash
brew install coreutils
```

### rbenv

```bash
brew install rbenv
```

### Bat

The `cat` alternative

```bash
brew install bat
```

### Clipboard Support

```bash
brew install reattach-to-user-namespace
```

