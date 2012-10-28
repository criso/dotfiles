#!/bin/zsh

source ~/.profile
source /etc/profile.d/autojump.zsh

fpath=(~/local/dotfiles/zsh-completions/src $fpath)


setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt AUTO_CD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt EXTENDEDGLOB


#
# Includes
#
# autoload colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit
autoload -U colors
colors

zmodload -a autocomplete
zmodload -a complist

# Set input mode to emacs 
bindkey -e

# Bind <C-r> to history search
bindkey "^r" history-incremental-search-backward

############
#  COLORS  #
############

zstyle -e ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle -e ':completion:*' list-colors 'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bold]" )'

# highlights='${PREFIX:+=(#bi)($PREFIX:t)(?)*==$color[red]=$color[green];$color[bold]}':${(s.:.)LS_COLORS}}
# 
# zstyle -e ':completion:*' list-colors \
# 	'reply=( "'$highlights'" )'


# zstyle -e ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
# zstyle -e ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'

#<-- For when you get sick and tired of all the colors and just want them to go away!
# zstyle ':completion:*' list-colors '' 

#
# Aliases
#

# git
alias gush='git push'
alias github='gush origin master'
alias origin='gush origin master'
alias gist='git status'
alias gull='git pull'
alias gadd='git add'
alias gim='git commit -m'
alias c='git commit'

if [[ $(uname) = 'Darwin' ]]; then
  alias l='ls -alAghp'
  alias ls='ls -p'
else
  alias l='ls -alAGhp --color=always'
  alias ls='ls -p --color=always'
fi
alias ..='cd ..'

# other
alias vi='vim'
alias e='vim'
alias chrome='chromium-browser'
alias pdf='mupdf'
alias -g ack='ack-grep -ia'

#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=1000
REPORTTIME=10


#
# ANSI Color Codes
#
CLEAR=$reset_color
RED=$fg[red]
GREEN=$fg[green]
YELLOW=$fg[yellow]
BLUE=$fg[blue]
PURPLE=$fg[magenta]
CYAN=$fg[cyan]
GREY=$'\e[0;94m'

#
# Set prompt style
#
ACTION="%{$PURPLE%}:%a%{$CLEAR%}"

zstyle ':vcs_info:*:prompt:*'                enable git
zstyle ':vcs_info:*:prompt:*'                check-for-changes true
zstyle ':vcs_info:*:prompt:*'  stagedstr     "%{$YELLOW%}"
zstyle ':vcs_info:*:prompt:*'  unstagedstr   "%{$GREEN%}"
zstyle ':vcs_info:*:prompt:*'  actionformats "(%{$BLUE%}%u%c%b${ACTION})%{$CLEAR%} "
zstyle ':vcs_info:*:prompt:*'  formats       "%{$BLUE%}%c%u(%c%b%c%u)%{$CLEAR%} "
zstyle ':vcs_info:*:prompt:*'  nvcsformats   ""

function precmd {
  local last=$?
  local prompt=""

  # Status
  if [[ $last -eq 0 ]]; then
    prompt=$GREEN
  elif [[ $last  -eq 1 ]]; then
    prompt=$YELLOW
  else
    prompt=$RED
  fi

  cursor="%{$prompt%}%#%{$CLEAR%}"
  vcs_info 'prompt'

  print -Pn "\e]0;%m:%~\a" 
}

preexec () {
	print -Pn "\e]0;$1\a" 
}

#
# Set Prompts
#
PROMPT="%{$GREY%}%n%{$CLEAR%} %~ "'${vcs_info_msg_0_}${cursor}'" %{$CLEAR%}"
RPROMPT='%{$BLUE%}%w %T %M%{$CLEAR%}'



