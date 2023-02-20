#!/bin/sh

cp .profile "$HOME"

ln -sf .profile "$HOME/.bash_profile"
ln -sf .config/bashrc "$HOME/.bashrc"
ln -sf .config/xinitrc "$HOME/.xinitrc"
ln -sf .config/vimrc "$HOME/.vimrc"
ln -sf .config/mutt/mailcap "$HOME/.mailcap"
ln -sf .config/mbsyncrc "$HOME/.mbsyncrc"
ln -sf .config/msmtprc "$HOME/.msmtprc"
ln -sf .config/muttrc "$HOME/.muttrc"

cp -r .config "$HOME"
cp -r .local "$HOME"

mkdir "$HOME/music" "$HOME/playlists"
