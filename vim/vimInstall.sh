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
./configure --with-features=huge \
	    --enable-multibyte \
							--enable-rubyinterp=yes \
							--enable-pythoninterp=yes \
							--with-python-config-dir=/usr/lib/python2.7/config \
							--enable-python3interp=yes \
							--with-python3-config-dir=/usr/lib/python3.5/config \
							--enable-perlinterp=yes \
							--enable-luainterp=yes \
							--enable-gui=gtk2 \
							--enable-cscope \
							--prefix=/usr
cd ~/Repos/vim
make 
sudo make install

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
