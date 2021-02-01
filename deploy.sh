#!/bin/sh

BAKDIR="$HOME/dotfiles.bak"

## if backup dotfiles dir doesn't exist, create it. otherwise clear it
[ -d "$BAKDIR" ] && rm -rf "$BAKDIR"
mkdir "$BAKDIR" "$BAKDIR/.config" "$BAKDIR/.local"


## backup previous dotfiles
[ -f "$HOME/.profile" ] && cp "$HOME/.profile" "$BAKDIR"
[ -f "$HOME/.bash_profile" ] && cp "$HOME/.bash_profile" "$BAKDIR"
[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$BAKDIR"
[ -f "$HOME/.xprofile" ] && cp "$HOME/.xprofile" "$BAKDIR"
[ -f "$HOME/.xinitrc" ] && cp "$HOME/.xinitrc" "$BAKDIR"
[ -d "$HOME/services" ] && cp -r "$HOME/services" "$BAKDIR"

[ -d "$HOME/.config" ] && cp -r "$HOME/.config" "$BAKDIR/.config"
[ -d "$HOME/.local" ] && cp -r "$HOME/.local" "$BAKDIR/.local"

# archive the backup to take up less space
CURRDIR="$(pwd)"
cd "$BAKDIR"
tar cfj "$HOME/dotfiles-$(date +%Y%m%d).tar.gz" $(find)
cd "$CURRDIR"


## clear stale dotfiles directories
rm -rf "$HOME/.config" "$HOME/.local"
mkdir "$HOME/.config" "$HOME/.local"

## copy over new dotfiles
cp .shellrc .profile "$HOME"

ln -sf .profile "$HOME/.bash_profile"
ln -sf .shellrc "$HOME/.bashrc"
ln -sf .config/xinitrc "$HOME/.xinitrc"

cp -r .config "$HOME"
cp -r .local "$HOME"

cp -r services "$HOME"


## post-deploy actions
mv /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak
cp .sysconfig/xinitrc /etc/X11/xinit/

XORG_CONF="/etc/X11/xorg.conf.d"
[ -d $XORG_CONF ] || mkdir $XORG_CONF
[ -f $XORG_CONF/00-keyboard.conf ] && \
	mv $XORG_CONF/00-keyboard.conf $XORG_CONF/00-keyboard.conf.bak
cp .sysconfig/00-keyboard.conf $XORG_CONF/00-keyboard.conf

mv /etc/ssh/ssh_config /etc/ssh/ssh_config.bak
cp .sysconfig/ssh_config /etc/ssh/

mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cp .sysconfig/sshd_config /etc/ssh/

cp .sysconfig/sudoers.d/mikolaj /etc/sudoers.d/
