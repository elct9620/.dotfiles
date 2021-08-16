# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aotoki"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
DISABLE_UPDATE_PROMPT=true

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby bundler gem git-flow golang gitignore heroku laravel npm pow powder rake bower zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Alias
alias vi="vim"
alias cat="bat"

# Homebrew install binaries is high priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Config default editor
export EDITOR="vim"

# Multi-Version Programming Language
eval "$(rbenv init -)" # rbenv
# [ -f $HOME/.phpbrew/bashrc ] && source ~/.phpbrew/bashrc # PHPBrew
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv init -)"

alias rubocop-fix="rubocop -a --only FrozenStringLiteralComment,StringLiterals,EmptyLines,OrderedGems,TrailingWhitespace,TrailingCommaInArrayLiteral,Layout/LeadingCommentSpace,Style/SymbolArray,Style/MutableConstant,Layout/SpaceInsideBlockBraces,Layout/LeadingBlankLines,Style/ExpandPathArguments,Style/PercentLiteralDelimiters,Style/UnneededPercentQ,Style/HashSyntax,Layout/AlignHash,Layout/EmptyLineAfterMagicComment,Layout/EmptyLineAfterGuardClause,Style/WordArray,Gemspec/OrderedDependencies"

# Golang
export GOPATH=$HOME/Workspace/Golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Yarn
export PATH="$PATH:$(yarn global bin)"

# Android SDK
export ANDROID_HOME=$HOME/Workspace/SDKs/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME
# export ANDROID_NDK_HOME=$HOME/Workspace/SDKs/android-ndk-r10c
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/elct9620/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/elct9620/google-cloud-sdk/completion.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Git Foresta
#
# https://github.com/takaaki-kasai/git-foresta
function gifo() { git-foresta --style=10 "$@" | less -RSX }
function gifa() { git-foresta --all --style=10 "$@" | less -RSX }
compdef _git gifo=git-log
compdef _git gifa=git-log

# Apex
_apex()  {
  COMPREPLY=()
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="$(apex autocomplete -- ${COMP_WORDS[@]:1})"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

# Highlight Code to RTF
function light() {
  if [ -z "$2" ]
    then src=$(pbpaste)
  else
    src=$(cat $2)
  fi
  echo $src | highlight -O rtf --syntax $1 --font SourceCodePro --style solarized-light --font-size 24 | pbcopy
  echo "Highlight in $1 completed!"
}

# Composer Optimize
# composer() {
#   # Requirement
#   #
#   # Curl, Filter, Hash, iconv, JSON, OpenSSL, Phar
#   #
#   # Color: Posix
#   # Cache: Opcache
#   php \
#     -n \
#     "$HOME/.phpbrew/bin/composer" $*
# }

# complete -F _apex apex

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# DIRCOLORS
eval $(gdircolors -b $HOME/.dotfiles/.dircolors)
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# Ruby Helper
json() {
  ruby -rawesome_print -rjson -e 'ap JSON.parse(STDIN.read)'
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# OPS config
export OPS_DIR="$HOME/.ops"
export PATH="$HOME/.ops/bin:$PATH"

# Kubectl
source <(kubectl completion zsh)

export PATH=$PATH:$HOME/Library/Python/3.8/bin

# Emscripten
# source $HOME/Workspace/SDKs/emsdk/emsdk_env.sh &> /dev/null

# added by travis gem
[ -f /Users/elct9620/.travis/travis.sh ] && source /Users/elct9620/.travis/travis.sh
