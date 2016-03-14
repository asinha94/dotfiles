#!/bin/bash

# FILE: setup.sh
# Purpose: installs emacs, tmux, and sets up environment by copying config files on new computers
# Dependencies: Root prviliges

# Fail on errors
set -e

# Install Git first if not already installled because thats where we get emacs themes from
sudo apt-get install -q=2 git

# Install tmux
sudo apt-get add ppa:webupd8team/unstable
sudo apt-get upgrade
sudo apt-get install tmux
cp .tmux.conf ~/

# Install emacs and install custom settings
sudo apt-get install emacs
cp -r .emacs .emacs.d ~/

# Copy .bash_aliases. Check manually if it is safe to copy bashrc. We don't want to overrite important configurations
cp .bash_aliases ~/

# Clone Guake repo and install
git clone https://github.com/Guake/guake
mv guake /opt && /opt/guake/dev.sh --install

# TODO: Include zsh and oh-my-zsh stuff after I have settled on a decent looking environment
