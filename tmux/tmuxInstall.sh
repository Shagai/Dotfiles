#!/bin/sh

mkdir ~/Repos
cd ~/Repos
git clone https://github.com/tmux/tmux.git
sudo apt-get install libevent1-dev libevent-dev
cd tmux
git checkout 2.7
make distclean
sh autogen.sh
./configure
make -j4
make check # optional, requires dejagnu and tcllib
sudo make install # as root
