#!/bin/bash

# Add any newer doftiles to the list
FILES=".emacs .emacs.d .bash_aliases .bash_profile .tmux.conf"
CURRENT_DIR=`pwd`

# Symmolic links
for f in $FILES
ln -sf $CURRENT_DIR/$f ~/$f

# Install the extra stuff that I need
sudo apt-get install -y tmux guake emacs arp-scan
