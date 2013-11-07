#!/bin/zsh

ZSH=$HOME/.oh-my-zsh


plugins=(git mvn svn brew npm)

source $ZSH/oh-my-zsh.sh

source ~/.profile
# fpath=(~/local/dotfiles/zsh-completions/src $fpath)
# source ~/local/dotfiles/zsh-completions/src

# [[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# [[ -s ~/local/maven-antsy-color/mvn ]] && source ~/local/maven-antsy-color/mvn


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
autoload -Uz vcs_info
autoload -Uz compinit && compinit
autoload -U colors
colors

zmodload -a autocomplete
zmodload -a complist

# Set input mode to vim 
# bindkey -e
bindkey -v
bindkey -M viins '^[' vi-cmd-mode


# Bind <C-r> to history search
bindkey "^r" history-incremental-search-backward

############
#  COLORS  #
############

zstyle -e ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle -e ':completion:*' list-colors 'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bold]" )'

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

alias ..='cd ..'

# alias ls='ls --color'
alias ls="gls -p --color=auto --group-directories-first"

# other
alias vi='mvim -g'
alias e='mvim -g'
alias vim='mvim -g'
alias pdf='mupdf'
alias -g ack='ack -i'

#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=1000
REPORTTIME=10

# timestamps for bash history. www.debian-administration.org/users/rossen/weblog/1
# saved for later analysis
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"


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
# RPROMPT='%{$BLUE%}%w %T %M%{$CLEAR%}'

# EXPORTS

# make vim default
export EDITOR="mvim -f"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/bin:$PATH"

# export JAVA_HOME=$(/usr/libexec/java_home)

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
