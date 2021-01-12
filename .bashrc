#
# ~/.shellrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon ## disables ctrl-s and ctrl-q

alias pacclean="pacman -Qtdq | pacman -Rns -"

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
