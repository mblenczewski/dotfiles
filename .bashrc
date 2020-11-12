#
# ~/.shellrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty stop undef ## ctrl-s no longer pauses terminal

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
