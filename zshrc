# If you come from bash you might have to change your $PATH.
# Path to your oh-my-zsh installation.
#
ZSH='/Users/chaoli/.oh-my-zsh'
HOME='/Users/chaoli'

# PATH override

# pyenv python env
PATH=/Users/chaoli/.pyenv/shims:$PATH
# rbenv ruby env
PATH=/Users/chaoli/.rbenv/shims:$PATH
# nvm nodejs env
PATH=/Users/chaoli/.nvm/:$PATH
# go src binaries
PATH=/Users/chaoli/gocode/bin:$PATH


export ZSH=/Users/chaoli/.oh-my-zsh
source $ZSH/oh-my-zsh.sh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="avit"
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pull="git fetch && git pull origin master && git submodule sync --recursive && git submodule update --init --recursive"
alias sync="boxer sync --ignore-archives cliadhoc uber/gocode/src/code.uber.internal/"
alias cls='printf "\033c"'
alias masterdiff='echo -en "\033[31m" $(git diff master --name-only) | tr " " "\n"'
alias lg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias lg2="log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias difflocal="diff2html -F ~/test.html -- -M master && open ~/test.html"

# git related alias
alias gs="git status"
alias gm="git checkout master"
alias glg="git log"
alias gc="git add . && git commit -am "
alias ga="git add ."
sq() {git rebase -i HEAD~"$@"}
gpr() {
	branch_name="$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
	git push origin $branch_name
}
gdr() {
	git push -d origin "$@"
}
alias gbr="git branch -r"
gitshort() {
	type gs
	type gm
	type glg
	type gc	
	type -f sq
	type -f gpr
	type gbr
	type -f gdr
}

# export GIT_SSH=/usr/local/bin/npmssh

alias zan="cd gocode/src/github.com/uber/zanzibar"
alias cds="cd gocode/src/code.uber.internal"
alias arcpreview="arc diff --preview --nounit --nolint --excuse notest"
alias vi="/usr/local/bin/nvim"
