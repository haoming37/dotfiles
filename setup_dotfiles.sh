#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
for x in $(ls -a|grep -i "^\.[a-z]"|grep -v .git)
do
    if [ -e ~/${x} ]; then
        if [ -L ~/${x} ]; then
            mv ~/${x} ~/${x}_old 
        else
            rm ~/${x}
        fi
    fi
    ln -s $script_dir/${x} ~/${x}
done
