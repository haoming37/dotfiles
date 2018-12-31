#!/bin/bash
#INSTALL_PATH=$HOME/bin/nvim

#if [ ! -e $INSTALL_PATH ]; then
#    mkdir -p `dirname $INSTALL_PATH`
#    curl -L -o $INSTALL_PATH https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
#    chmod +x $INSTALL_PATH
#fi
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update && apt-get install neovim

if ! cat $HOME/.bashrc|grep XDG_CONFIG_HOME >/dev/null;then
    echo "export XDG_CONFIG_HOME=$HOME/config" >>$HOME/.bashrc
    export XDG_CONFIG_HOME=$HOME/config
fi

if [ ! -e $XDG_CONFIG_HOME/nvim ]; then
    mkdir -p $XDG_CONFIG_HOME/nvim
fi

if [ ! -e $HOME/.cache/dein/userconfig ]; then
    mkdir -p $HOME/.cache/dein/userconfig 
fi

ln -s ${PWD}/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

#install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh
nvim -e +norm':call dein#install()' +q!
