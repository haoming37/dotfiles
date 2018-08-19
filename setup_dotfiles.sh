#!/bin/bash
#set symbolic link
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
for x in $(ls -a|grep -i "^\.[a-z]"|grep -v .git|sed -e '$abin')
do
    if [ -e ~/${x} ]; then
        if [ -L ~/${x} ]; then
            mv ~/${x} ~/${x}_old 
        elif [ -d ~/${x} ]; then
            mv ~/${x} ~/${x}_old
        else
            rm ~/${x}
        fi
    fi
    ln -s $script_dir/${x} ~/${x}
done
#install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh
$script_dir/bin/vim -e +norm':call dein#install()' +q!
