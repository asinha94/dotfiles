# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


run_tmux_in_guake() {
    ppid=$(ps -h -o ppid -p $$ 2>/dev/null)
    ppid_comm=$(ps -h -o comm -p $ppid 2>/dev/null)

    case $ppid_comm in
        (guake) if command -v tmux>/dev/null; then
	    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
	    fi
	    ;;
    esac
}

run_tmux_in_guake

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# env variables
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export PATH=/opt/apache-maven-3.3.3/bin:$PATH
export ORACLE_HOME=/usr/lib/oracle/12.1/client64

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Personal Stuff
alias updir='. /home/asinha/scripts/updir.sh'
alias eot='cd /home/asinha/p4/depot/dev/asinha/AAA1/SRC/tools/aaa-eot'
alias lls='ls -I *.*~'
alias fcount='num=$(lls -1 | wc -l); echo "$num non-temp files"'
alias ft='cd /opt/rim/aaa-ft/etc/aws-functional-tests/functional/ && ./run-all-tests.sh -o RLYDB01 ASINHA_AAA ASINHA_AAA -v'
alias eotlist='eot && ./run.sh -l'
alias scd='cd'
alias sl='ls'
alias sls='ls'
alias cf='ls -1t | head -0' 
alias emacs='emacs -nw'
alias rm~dr='rm~ --dry-run'

function latest () # Find latest n files in current directory
{	
	list=0
	[ "$@" -eq "$@" ] && list="$@"
	ll -1t | tail -n +3 | head -$list
}


function cl ()
{
	cd "$@" && ls
}

function cls ()
{
	cd "$@" && clear && ls
}

function updir () # cd Up a number of directories
{
	UPDIR_LVL=$1

	if [ $# -lt 1 ]; then
    		UPDIR_LVL=1
	fi

	UPDIR=""
	for i in `seq 1 $UPDIR_LVL`;
	do
    	UPDIR="$UPDIR../"
	done

	cd $UPDIR
}

function mkcd ()  # make directory and cd into it
{ 
	mkdir "$@" && cd "$@" 
}

function rm~
{
    case "$1" in
	"--dry-run")
	    find . -name "*~" -type f -printf "[dry-run] Removing file %p\n"
	    ;;
	"")
	    find . -name "*~" -type f -printf "Removing file %p\n" -delete
	    ;;
	*)
	    echo "Unsupported option \"$1\". Did you mean --dry-run?"
            ;;
        esac

}

function flash
{
    echo -ne "$@\r"
    sleep 2
}

function flash-off
{
    echo -e "\n$@"
    sleep 2
}