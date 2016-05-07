force_color_prompt=yes
ZSH_THEME="agnoster"

# define postgreSQL server start/stop
pg_s() { pg_ctl "$@" -D /usr/local/var/postgres/ ;}

alias la="ls -Al"
alias ssh="ssh -A"
alias pull-master="git fetch; git pull origin master"
alias masterdiff="git diff master --name-only"

# use auth tmux
alias tmux="export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock; tmux"

# cd to sync path
function cds {
    cd "/Users/ChaoLi/Uber/sync/$1.dev.uber.com/home/uber/"
}
alias cds=cds

# lab env
function setlab {
	if [ ! -d "$HOME/cli" ]; then
		mkdir -p ~/cli
	fi

    if [ ! -d "$HOME/cli/.ssh" ]; then
        cp -rf ~/.ssh ~/cli/.
    fi
}

function lab {
	export HOME="$HOME/cli"
	source ~/.zshrc
	cd ~
}

function qlab {
	export HOME="/path/to/origin/home"
	source ~/.zshrc
	cd ~
}
