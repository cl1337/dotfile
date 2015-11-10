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


# arc config (on dev machine)
export PATH="$HOME/opt/arcanist/bin:$PATH"

# trifle alias (adhoc04-sjc1)
alias trifle_cb='schemaless-client -i trifle -u 14741 -d client_bills'
alias trifle_ct='schemaless-client -i trifle -u 14741 -d client_transactions_2'
# trifle_tpp cells <payment_profile_uuid>
alias trifle_tpp='schemaless-client -i trifle -u 14741 -d payment_profiles'
alias mezzanine_trip='schemaless-client -i mezzanine --u 14561 --d trips'

# prepare script env on celery06
function script_prepare {
    cp -rf /home/uber/api-config/ /home/cli
    cd /var/cache/udeploy/r/api && VAR=$(ls -dt -- */ | head -n1); echo "${VAR::-1}"
    cd /var/cache/udeploy/r/api/$VAR/current && source bin/activate
    export CLAY_CONFIG=/etc/uber/api/sjc1.yaml
    export UBERAPI_SETTINGS=/etc/uber/api/settings.ini
}
