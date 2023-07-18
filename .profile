#
# ~/.profile
#

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
export PATH

export EDITOR="vim"
export TERMINAL="st"
export READER="mupdf"

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

pkill mpd
mpd
