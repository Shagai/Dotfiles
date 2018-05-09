#! /bin/sh

sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
sudo apt-get install libncurses5-dev

if [ ! -d "~/Repos" ]; then
  mkdir ~/Repos
fi

cd ~/Repos
git clone https://github.com/vim/vim.git
cd vim
git checkout v8.0.1803
make distclean
./configure						--enable-python3interp=yes \
							--with-python3-config-dir=/usr/lib/python3.5/config \
							--prefix=/usr
cd ~/Repos/vim
make -j4
sudo make install

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
