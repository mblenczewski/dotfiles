#
# ~/.profile
#

TLROOT="/usr/local/texlive/2021"
PATH="$TLROOT/bin/x86_64-linux:$PATH"
MANPATH="$TLROOT/texmf-dist/doc/man:$MANPATH"; export MANPATH
INFOPATH="$TLROOT/texmf-dist/doc/info:$INFOPATH"; export INFOPATH

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
export PATH

export EDITOR="vim"
export TERMINAL="st"
export READER="zathura"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.run"

[ -d "$XDG_RUNTIME_DIR" ] || mkdir "$XDG_RUNTIME_DIR"

export XAUTHORITY="$HOME/.Xauthority"

IRCROOT="$XDG_CONFIG_HOME"
[ -f "$IRCROOT/ircuser" ] && export IRCUSER="$(cat $IRCROOT/ircuser)"
[ -f "$IRCROOT/ircnick" ] && export IRCNICK="$(cat $IRCROOT/ircnick)"
[ -f "$IRCROOT/ircpass" ] && export IRCPASS="$(cat $IRCROOT/ircpass)"

export LESSHISTFILE="-"
export HISTFILE="$XDG_DATA_HOME/history"
export HISTSIZE=
export HISTFILESIZE=

export _JAWA_AWT_WM_NONREPARENTING=1  ##fix for java applications in dwm

export SVDIR="$HOME/services"
[ -d "$SVDIR" ] || mkdir "$SVDIR"

export PATH="$HOME/vulkan/1.2.170.0/x86_64/bin:$PATH"

[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1 && exec startx
