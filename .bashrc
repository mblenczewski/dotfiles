#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty stop undef ## ctrl-s no longer pauses terminal

## common compilation flags
export MAKEFLAGS="-j$(nproc)"
COMMON_FLAGS="-O2 -pipe -march=native -mtune=native"
export CFLAGS="${COMMON_FLAGS}" CXXFLAGS="${COMMON_FLAGS}"

## infinite history file size
HISTSIZE= HISTFILESIZE=

alias ls="ls --color=auto --group-directories-first"

