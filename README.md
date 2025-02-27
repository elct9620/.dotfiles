.dotfiles
=========

The Aotokitsuruya's Development Environment

Configure
---

## Git

Add the following to `~/.gitconfig`

```bash
[include]
    path = ~/.dotfiles/.gitconfig
```

## Tmux

```bash
brew install tmux
```

### Link Dotfiles

```bash
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

### iTerm2

Configure Profile to set "Command" to `tmux attach -t base || tmux new -s base` enable when iTerm2 started.

## ZSH

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
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.dotfiles/.oh-my-zsh/themes/aotoki.zsh-theme ~/.oh-my-zsh/themes/aotoki.zsh-theme
```

## Dircolors

### Corutils

```bash
brew install coreutils
```

### Link Dotfiles

```
ln -s ~/.dotfiles/.dircolors ~/.dircolors
```

## rbenv

```bash
brew install rbenv
```

## Bat

The `cat` alternative

```bash
brew install bat
```

## Clipboard Support

```bash
brew install reattach-to-user-namespace
```
