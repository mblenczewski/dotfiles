#!/bin/sh

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
