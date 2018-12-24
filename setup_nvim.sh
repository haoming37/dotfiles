#!/bin/bash
INSTALL_PATH=$HOME/bin/nvim

if [ ! -e $INSTALL_PATH ]; then
    curl -L -o $INSTALL_PATH https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod +x $INSTALL_PATH
fi

if ! cat $HOME/.bashrc|grep XDG_CONFIG_HOME >/dev/null;then
    echo "export XDG_CONFIG_HOME=$HOME/config" >>$HOME/.bashrc
    source $HOME/.bashrc
fi

if [ ! -e $XDG_CONFIG_HOME/nvim ]; then
    mkdir -p $XDG_CONFIG_HOME/nvim
fi

if [! -e $HOME/.cache/dein/userconfig ]; then
    mkdir $HOME/.cache/dein/userconfig 
fi

cp .vimrc $XDG_CONFIG_HOME/nvim/init.vim
