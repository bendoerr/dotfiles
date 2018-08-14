#!/usr/bin/env zsh
#

setopt autocd extendedglob notify
unsetopt beep

# VI Keybinding
bindkey -v

zstyle :compinstall filename '/Users/bdoerr/.zshrc'
autoload -Uz compinit
compinit
