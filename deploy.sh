#!/bin/sh

BAKDIR="${HOME}/.dotfiles.bak"

## if backup dotfiles dir doesn't exist, create it. otherwise clear it
[ -d "${BAKDIR}" ] && rm -rf "${BAKDIR}"
mkdir "${BAKDIR}" "${BAKDIR}/.config" "${BAKDIR}/.local"


## backup previous dotfiles
[ -f "${HOME}/.profile" ] && cp "${HOME}/.profile" "${BAKDIR}"
[ -f "${HOME}/.bash_profile" ] && cp "${HOME}/.bash_profile" "${BAKDIR}"
[ -f "${HOME}/.bashrc" ] && cp "${HOME}/.bashrc" "${BAKDIR}"
[ -f "${HOME}/.xprofile" ] && cp "${HOME}/.xprofile" "${BAKDIR}"
[ -f "${HOME}/.xinitrc" ] && cp "${HOME}/.xinitrc" "${BAKDIR}"

cp -r "${HOME}/.config" "${BAKDIR}/.config"
cp -r "${HOME}/.local" "${BAKDIR}/.local"


## clear stale dotfiles directories
rm -rf "${HOME}/.config" "${HOME}/.local"
mkdir "${HOME}/.config" "${HOME}/.local"

## copy over new dotfiles
cp .bashrc .profile "${HOME}"

ln -s .profile "${HOME}/.bash_profile"
ln -s .config/xinitrc "${HOME}/.xinitrc"

cp -r .config "${HOME}"
cp -r .local "${HOME}"


## post-deploy actions
mv /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc.bak
cp .sysconfig/xinitrc /etc/X11/xinit/

mv /etc/ssh/ssh_config /etc/ssh/ssh_config.bak
cp .sysconfig/ssh_config /etc/ssh/

mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cp .sysconfig/sshd_config /etc/ssh/

cp .sysconfig/sudoers.d/mikolaj /etc/sudoers.d/
