export PATH="$PATH:"/Applications/microchip/xc8/v1.37/bin""

# Source .bash_aliases
if [ -f /Users/anu/.bash_aliases ]; then
    . /Users/anu/.bash_aliases
fi

# Shit that Mac should really do already
export PS1='\u@\H:\w$ '
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias la='ls -al'
alias ll='ls -l'
