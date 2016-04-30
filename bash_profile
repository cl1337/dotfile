# added by auto deploy script
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
force_color_prompt=yes
alias ls="ls --color=auto"
alias la="ls -Al"
alias pull-master="git fetch; git pull origin master"
alias masterdiff="git diff master --name-only"
alias tmux="export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock; tmux"
PS1="\[$BLUE\]\u@\h\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
