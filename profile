#!/bin/sh

#
# ENV
#
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:$PATH
export CLICOLOR="true"

############
#  EDITOR  #
############
export EDITOR="gvim -f" # -p = 1 tab/file
alias vi="vim -p"
alias svi="sudo $EDITOR"


export PATH=$HOME/local/node/bin:/usr/local/bin:/usr/local/sbin:$PATH
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules

# export PATH=$HOME/local/node/bin:$PATH
# export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules:/usr/local/lib/jsctags
# # export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH for doctorjs
# export EDITOR=vim

# rvm 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
