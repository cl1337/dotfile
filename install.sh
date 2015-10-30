 #!/bin/bash

# downloading files
echo "downloading config files"
curl -o bash_profile https://raw.githubusercontent.com/cl1337/dotfile/master/bash_profile
curl -o ~/.tmux.conf https://raw.githubusercontent.com/cl1337/dotfile/master/tmux.conf
curl -o zshrc https://raw.githubusercontent.com/cl1337/dotfile/master/zshrc

echo "updating shell and tmux configs"

stamp_line="<<<<<<<<<<<<<<<<<<<<<<<STAMPED>>>>>>>>>>>>>>>>>>>>>>>>>"

if [ grep "$stamp_line" ~/.bash_profile ] ; then
    echo "$stamp_line" >> ~/.bash_profile
    cat bash_profile >> ~/.bash_profile
else
    echo "bash profile has stamped, check if you need to update"
fi

if [ grep "$stamp_line" ~/.zshrc ] ; then
    echo "$stamp_line" >> ~/.zshrc
    cat zshrc >> ~/.zshrc
else
    echo "zsh profile has stamped, check if you need to update"
fi

if [ "$(echo $0)" = "-zsh" ] ; then
    zsh ~/.zshrc
elif [ "$(echo $0)" = "-bash" ] ; then
    source ~/.bash_profile
else
    echo "shell is not bash or zsh, abort ..."
fi

echo "improving vim"
# vim install
# decide to install vim basic or vim loaded, for now just vim basic
curl -o ~/.vimrc https://raw.githubusercontent.com/cl1337/dotfile/master/vim/vimrc.basic
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
echo "colorscheme gruvbox" >> ~/.vimrc
echo "end of install"


# function vim74 {
#     alias vim="/home/uber/bin/vim"
# }
