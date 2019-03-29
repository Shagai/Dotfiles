#!/bin/sh

mkdir ~/Repos
cd ~/Repos
git clone https://github.com/scop/bash-completion.git
cd bash-completion
git checkout 2.8
make distclean
autoreconf -i  # if not installing from prepared release tarball
./configure
make -j4
make check # optional, requires dejagnu and tcllib
sudo make install # as root
