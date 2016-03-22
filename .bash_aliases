# Run tmux in guake on startup
run_tmux_in_guake() {
    ppid=$(ps -h -o ppid -p $$ 2>/dev/null)
    ppid_comm=$(ps -h -o comm -p $ppid 2>/dev/null)

    case $ppid_comm in
        (guake | python2) if command -v tmux>/dev/null; then
	    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
	    fi
	    ;;
    esac
}

run_tmux_in_guake

# Personal Aliases
alias scd='cd'
alias sl='ls'
alias sls='ls'
alias emacs='emacs -nw'
alias rm~dr='rm~ --dry-run'

# Personal functions
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
