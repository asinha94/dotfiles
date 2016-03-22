#!/bin/bash

# FILE: setup.sh
# Purpose: installs emacs, tmux, and sets up environment by copying config files on new computers
# Dependencies: Root prviliges

# Fail on errors
set -e

function copy-configs ()
{
    cp -r .bash_aliases .tmux.conf .emacs .emacs.d ~/
}

function install-tmux ()
{
    # Install tmux. If not in public repositories, add the webupd8team ppa, which has tmux
    if ! sudo apt-get -y install tmux ; then
	sudo apt-get add ppa:webupd8team/unstable
	sudo apt-get upgrade
	sudo apt-get -y Install tmux
    fi
}

function install-emacs ()
{
    sudo apt-get -y install emacs
}

function install-guake ()
{
    # Clone Guake repo and install
    git clone https://github.com/Guake/guake
    mv guake ../ && ../guake/dev.sh --install
}

if [[ $1 == *"update"* ]]; then
    
    # Just copy the config files
    copy-configs

else

    # Install tmuc
    install-tmux
    
    # Install emacs
    install-emacs

    # Copy all the configuration file to home
    copy-configs
    
    # Install guake
    install-guake
    
    # TODO: Include zsh and oh-my-zsh stuff after I have settled on a decent looking environment and finally fixed that powerline fonts issue

fi
