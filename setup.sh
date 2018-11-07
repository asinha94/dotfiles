#!/bin/bash

# Add any newer doftiles to the list
FILES=".emacs .emacs.d .bash_aliases"
CURRENT_DIR=`pwd`

# Symmolic links
cd $HOME
for f in $FILES; do
    ln -sf $CURRENT_DIR/$f ~/$f
done



