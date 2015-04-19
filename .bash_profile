force_color_prompt=yes

# use vim 7.4
alias vim="/home/uber/bin/vim"
alias ls="ls --color=auto"
alias pull-master="git fetch; git pull origin master"

# use auth tmux
alias tmux="export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock; tmux"

# arc config
export PATH="$HOME/opt/arcanist/bin:$PATH"
# export PATH="$PATH:./node_modules/.bin"

# git prompt
source ~/.git-prompt.sh
PS1="\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

# export UBERAPI_SETTINGS="/home/uber/api/Uber/settings.ini"
# export CLAY_CONFIG="/home/uber/api/Uber/config/development.yaml" 

