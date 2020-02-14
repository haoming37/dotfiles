#!/bin/bash
#INSTALL_PATH=$HOME/bin/nvim

#if [ ! -e $INSTALL_PATH ]; then
#    mkdir -p `dirname $INSTALL_PATH`
#    curl -L -o $INSTALL_PATH https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
#    chmod +x $INSTALL_PATH
#fi
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update && sudo apt-get -y install neovim

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

if [ ! -e $HOME/.cache/tmp ]; then
    mkdir -p  $HOME/.cache/tmp
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo "$XDG_CONFIG_HOME/nvim/init.vim" --create-dirs \
    https://raw.githubusercontent.com/haoming37/dotfiles/master/nvim/init.vim



nvim +PlugInstall +qall

#install dein
#curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
#sh ./installer.sh ~/.cache/dein
#rm installer.sh
#nvim -e +norm':call dein#install()' +q!
