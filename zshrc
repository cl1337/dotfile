force_color_prompt=yes
ZSH_THEME="agnoster"
# define postgreSQL server start/stop
pg_s() { pg_ctl "$@" -D /usr/local/var/postgres/ ;}
# alias vim="/usr/local/bin/vim"
alias la="ls -Al"
alias ssh="ssh -A"
alias pull-master="git fetch; git pull origin master"
# use auth tmux
alias tmux="export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock; tmux"

function lab {
	if [ ! -d "$HOME/cli" ]; then
		mkdir -p ~/cli
	fi
	export HOME="$HOME/cli"
	source ~/.zshrc
	cd ~
}

function qlab {
	export HOME="/path/to/origin/home"
	source ~/.zshrc
	cd ~
}
