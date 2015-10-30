 #!/bin/bash

# downloading files
curl -o bash_profile https://raw.githubusercontent.com/cl1337/dotfile/master/bash_profile
curl -o ~/.tmux.conf https://raw.githubusercontent.com/cl1337/dotfile/master/tmux.conf
curl -o zshrc https://raw.githubusercontent.com/cl1337/dotfile/master/zshrc

cat bash_profile >> ~/.bash_profile
cat zshrc >> ~/.zshrc

tmux source ~/.tmux.conf

if [ "$(echo $0)" = "-zsh" ];then
    zsh ~/.zshrc
else if [ "$(echo $0)" = "-bash" ];then
    source ~/.bash_profile
else
    echo "shell is not bash or zsh, abort ..."
fi

# decide to install vim basic or vim loaded, for now just vim basic
curl -o ~/.vimrc https://raw.githubusercontent.com/cl1337/dotfile/master/vim/vimrc.basic
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall


# install vim 74
# append vimrc


# function vim74 {
#     alias vim="/home/uber/bin/vim"
# }

# function deploy {
#     # echo $1
#     # install vundle

#     # deploy bash config
#     curl -o ~/.bash_profile https://raw.githubusercontent.com/cl1337/dotfile/master/bash_profile
#     # deploy tmux config
#     curl -o ~/.tmux.conf https://raw.githubusercontent.com/cl1337/dotfile/master/tmux.conf
#     bash source ~/.bash_profile
#     tmux source ~/.tmux.conf
# }

# function lich_install_vim {
#     curl -o ~/.vimrc https://raw.githubusercontent.com/cl1337/dotfile/master/vim/vimrc.basic
#     if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
#         git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#     fi
#     vim +PluginInstall +qall
# }
