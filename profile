#!/bin/sh

#
# ENV
#
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:$PATH
export CLICOLOR="true"

############
#  EDITOR  #
############
export EDITOR="vim -p" # -p = 1 tab/file
alias vi="vim -p"
alias svi="sudo $EDITOR"


export PATH=$HOME/local/node/bin:/usr/local/bin:/usr/local/sbin:$PATH
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules


# rvm 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
