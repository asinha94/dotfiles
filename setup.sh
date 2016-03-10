#!/bin/bash

# FILE: setup.sh
# Purpose: installs emacs, tmux, and sets up environment by copying config files on new computers
# Dependencies: Root prviliges

# Fail on errors
set -e

# Install Git first if not already installled because thats where we get emacs themes from
sudo apt-get install -q=2 git

# Clone Guake repo and install
git clone https://github.com/Guake/guake
cd guake && ./dev.sh --install

# Install tmux
sudo apt-get add ppa:webupd8team/unstable
sudo apt-get upgrade
sudo apt-get install tmux
cp .tmux.conf ~/

# Install emacs and install custom settings
sudo apt-get install emacs
cp -r .emacs .emacs.d ~/

# Copy bashrc and .bash_aliases
cp .bashrc .bash_aliases ~/

# TODO: Include zsh and oh-my-zsh stuff after I have settled on a decent looking environment
