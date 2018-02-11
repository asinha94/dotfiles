#!/bin/bash

# Install the extra stuff that I need
sudo apt-get update
sudo apt-get install -y tmux guake emacs arp-scan zsh fonts-powerline

# Install oh my zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Add any newer doftiles to the list
FILES=".emacs .emacs.d .bash_aliases .bash_profile .tmux.conf .zshrc"
CURRENT_DIR=`pwd`

# Symmolic links
for f in $FILES; do
    ln -sf $CURRENT_DIR/$f ~/$f
done

# Copy agnoster modified theme
cp -f agnoster.zsh-theme ~/.oh-my-zsh/themes/


