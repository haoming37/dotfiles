sudo apt-get install automake libevent-dev libncurses5-dev pkg-config build-essential
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make -j4
cp tmux ../bin
