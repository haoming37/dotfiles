git clone https://github.com/vim/vim 
cd vim
./configure
make
cp src/vim ../bin/
rm -rf ../vim_runtime
cp -R vim/runtime ../vim_runtime
