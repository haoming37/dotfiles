#!/bin/bash
curl -L http://tamacom.com/global/global-6.6.2.tar.gz|tar zx -C ./
cd global-6.6.2
./configure
make
if [ -e ~/bin ]; then
   cp gtags/gtags ~/bin
   cp global/global ~/bin
fi
if [ -e ~/.vim/plugin ]; then
    cp gtags.vim ~/.vim/plugin
fi
