#
# ~/.profile
#

LATEX_ROOT="/usr/local/texlive/2020"
export PATH="${PATH}:${LATEX_ROOT}/bin/x86_64-linux"
export INFOPATH="${INFOPATH}:/${LATEX_ROOT}/texmf-dist/doc/info"
export MANPATH="${MANPATH}:/${LATEX_ROOT}/texmf-dist/doc/man"

[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"
[ -d "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"
export PATH

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

IRCROOT="${XDG_CONFIG_HOME}"
[ -f "${IRCROOT}/ircuser" ] && export IRCUSER="$(cat ${IRCROOT}/ircuser)"
[ -f "${IRCROOT}/ircnick" ] && export IRCNICK="$(cat ${IRCROOT}/ircnick)"
[ -f "${IRCROOT}/ircpass" ] && export IRCPASS="$(cat ${IRCROOT}/ircpass))"

export LESSHISTFILE="-"
export HISTFILE="${XDG_DATA_HOME}/history"

export _JAWA_AWT_WM_NONREPARENTING=1  ##fix for java applications in dwm

[ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"

[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg > /dev/null 2>&1 && exec startx

