git clone https://github.com/vim/vim 
cd vim
./configure --enable-python3interp vi_cv_path_python3=/usr/bin/python3.5 \
    --with-python3-config-dir=/usr/bin/python3.5/config-3.5m-x86_64-linux-gnu 
make
cp src/vim ../bin/
rm -rf ../vim_runtime
cp -R runtime ../vim_runtime
