 #!/bin/bash

# downloading files
echo "downloading config files"
curl -o ~/.tmux.conf https://raw.githubusercontent.com/cl1337/dotfile/master/tmux.conf

echo "updating shell and tmux configs"

stamp_line="#<<<<<<<<<<<<<<<<<<<<<<<STAMPED>>>>>>>>>>>>>>>>>>>>>>>>>"
if grep --quiet "$stamp_line" ~/.bash_profile ; then
    echo "bash profile has stamped, check if you need to update"
else
    curl -o bash_profile https://raw.githubusercontent.com/cl1337/dotfile/master/bash_profile
    echo "$stamp_line" >> ~/.bash_profile
    cat bash_profile >> ~/.bash_profile
    source ~/.bash_profile
fi

if grep --quiet "$stamp_line" ~/.zshrc ; then
    echo "zsh profile has stamped, check if you need to update"
else
    curl -o zshrc https://raw.githubusercontent.com/cl1337/dotfile/master/zshrc
    echo "$stamp_line" >> ~/.zshrc
    cat zshrc >> ~/.zshrc
    source ~/.zshrc
fi

if [ "$(echo $0)" = "-zsh" ] ; then
    zsh ~/.zshrc
elif [ "$(echo $0)" = "-bash" ] ; then
    source ~/.bash_profile
else
    echo "shell is not bash or zsh, abort ..."
fi

echo "improving vim"
# vim instal
curl -o ~/.vimrc https://raw.githubusercontent.com/cl1337/dotfile/master/vim/vimrc.basic
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
echo "colorscheme gruvbox" >> ~/.vimrc
echo "clean ups ... "
rm -rf zshrc
rm -rf bash_profile
echo "end of install"



# TODO
# install vim 74

# function vim74 {
#     alias vim="/home/uber/bin/vim"
# }

# install sublime config
# mac path
# '/Users/chaoli/Library/Application Support/Sublime Text 3/Packages/User'
