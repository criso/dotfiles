#!/bin/sh
##
# cloudhead .profile
#

#
# ENV
#
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:$PATH
export CLICOLOR="true"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export EDITOR="vim"
export LANG="en_US.UTF-8"

export PATH=$HOME/local/node/bin:/usr/local/bin:/usr/local/sbin:$PATH
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules

if [[ -z "$DISPLAY" ]] && [[ ! -a "/tmp/.X11-unix/X0" ]]; then
  startx
  logout
fi
