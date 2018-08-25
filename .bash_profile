# Source .bash_aliases
if [ -f /Users/asinha/.bash_aliases ]; then
    . /Users/asinha/.bash_aliases
fi

# Shit that Mac should really do already
export PS1='\u@\H:\w$ '
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias la='ls -al'
alias ll='ls -l'

export PATH="$HOME/.cargo/bin:$PATH"
