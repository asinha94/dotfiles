# Personal Aliases
alias scd='cd'
alias sl='ls'
alias sls='ls'
alias emacs='emacs -nw'
alias rm~dr='rm~ --dry-run'
alias todo='grep -rn TODO'
alias serve='python -m SimpleHTTPServer'
alias ross=". ~/Documents/Github/polaris/ros/env.sh"

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$GOROOT/bin:/opt/firefox

# Personal functions

function tpadon ()
{
        devid=$(xinput list | grep bcm5974 | grep -oP 'id=\K[0-9]+')
        xinput --set-prop $devid "Device Enabled" 1
}

function tpadoff ()
{
        devid=$(xinput list | grep bcm5974 | grep -oP 'id=\K[0-9]+')
        xinput --set-prop $devid "Device Enabled" 0
}

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

function scan ()
{
        sudo arp-scan --interface=eth0 --localnet
}

function success-text ()
{
        ESC=\\x1b
        FG=30
        BG=40
        BLACK=0
        RED=1
        GREEN=2
        BLACK_BG=$((BG+BLACK))
        GREEN_FG=$((FG+GREEN))
        RED_FG=$((FG+RED))
        BOLD=1
        CLEAR=$ESC[m
        echo -e "${ESC}[${BLACK_BG};${GREEN_FG};${BOLD}m$@${CLEAR}"
}

#source /opt/ros/kinetic/setup.zsh