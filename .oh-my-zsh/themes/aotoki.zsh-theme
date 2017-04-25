# ---------------------------------------------------------------
# Aotoki Theme for oh-my-zsh theme by Aotoki (elct9620@frost.tw)
# Home Page : http://frost.tw/
# --------------------------------------------------------------

# LS Color
LSCOLORS=xxbxcxxxxxdxBxxxxxCxExBhCh

#Color Shortcuts
R=$fg[red]
G=$fg[green]
B=$fg[blue]
Y=$fg[yellow]
RB=$fg_blod[red]
GB=$fg_blod[green]
YB=$fg_blod[yellow]
RESET=$reset_color

#Functions

# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

# get the name of the branch we are on (copied and modified from git.zsh)
function custom_git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_prompt_ahead)$(custom_git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

#PREFIX
PREFIX="[%{$B%}$(whoami)%{$RESET%}]"

#PROMPT
PROMPT='$PREFIX %1~ $(custom_git_prompt)%% %b%{$RESET%}'

#Git Colors
ZSH_THEME_GIT_PROMPT_PREFIX="%{$YB%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$YB%}›%{$RESET%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$BB%}➔"

ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$G%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$G%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$G%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$G%}D"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$R%}⁇"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$R%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$R%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$R%}UU"
