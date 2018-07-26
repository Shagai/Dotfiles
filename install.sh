#!/bin/sh

# Script for installing all the config files in an easy way so I don't have
# to manually move/copy everything
#
# For now, it will install the following things:
#  - Bashrc
#  - gnuplot config files
#  - mpd config files
#  - ncmpcpp config files
#  - vimrc and all my .vim
#  - oh-my-zsh is not installed yet and my modifications to it

LOCAL=`dirname $0`

Usage() {
    echo "Usage: sh install.sh <option>"
    echo "Where option is one of the following:"
    echo "  - all: Install everything"
    echo "  - bash: Install bashrc"
    echo "  - git: Install some git configuration"
    echo "  - termite: Install some termite configuration"
    echo "  - tmux: Install some tmux configuration"
    echo "  - vim: vimrc and all my .vim. Also runs vim_bundle.sh"
}

Bash() {
    echo " + Installing bashrc"
    echo "      cp $LOCAL/bash/bashrc ~/.bashrc"
    echo " 	cp $LOCAL/bash/dir_colors ~/.dir_colors"
    echo "	sh $LOCAL/bash/autocomplete.sh"
    cp $LOCAL/bash/bashrc ~/.bashrc
    cp $LOCAL/bash/dir_colors ~/.dir_colors
    sh $LOCAL/bash/autocomplete.sh
}

Git() {
    echo " + Installing git configuration"
    echo "	sudo apt-get install git"
    echo "      mkdir -p ~/.config/git"
    echo "      cp $LOCAL/git/gitconfig ~/.gitconfig"
    echo "      cp $LOCAL/git/gitignore ~/.config/git/gitignore"
    sudo apt-get install git
    mkdir -p ~/.config/git
    cp $LOCAL/git/gitconfig ~/.gitconfig
    cp $LOCAL/git/gitignore ~/.config/git/gitignore
}

Termite() {
    echo " + Installing termite configuration"
    echo "	sh $LOCAL/termite/termiteInstall.sh"
    echo "      mkdir -p ~/.config/termite"
    echo "      cp $LOCAL/termite/config ~/.config/termite/"
    sh $LOCAL/termite/termiteInstall.sh
    mkdir -p ~/.config/termite
    cp $LOCAL/termite/config ~/.config/termite/
}

Tmux() {
    echo " + Installing tmux configuration"
    echo "	sh $LOCAL/tmux/tmuxInstall.sh"
    echo "      cp $LOCAL/tmux/tmux.conf ~/.tmux.conf"
    echo "	cp $LOCAL/tmux/.bash_profile ~/.bash_profile"
    echo "	sh $LOCAL/tmux/tmuxCompletion.sh"
    sh $LOCAL/tmux/tmuxInstall.sh
    cp $LOCAL/tmux/tmux.conf ~/.tmux.conf
    cp $LOCAL/tmux/.bash_profile ~/.bash_profile
    sh $LOCAL/tmux/tmuxCompletion.sh
}

Vim() {
    echo " + Installing and preparing vim configuration"
    echo "	sudo apt-get install cmake python-dev python3-dev"
    echo "      sh $LOCAL/vim/vinInstall.sh"
    echo "      mkdir -p ~/.vim"
    echo "      cp -r $LOCAL/vim/* ~/.vim/"
    echo "      cp $LOCAL/vim/vimrc ~/.vimrc"
    echo "      cp $LOCAL/vim/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py"
    echo "      sh $LOCAL/vim/vim_vundle.sh"
    echo "	vim +PluginInstall +qall"
    echo "	cd ~/.vim.bundle/YouCompleteMe"
    echo "	./install.py --all"
    sudo apt-get install cmake python-dev python3-dev
    sh $LOCAL/vim/vimInstall.sh
    mkdir -p ~/.vim
    cp -r $LOCAL/vim/* ~/.vim/
    cp $LOCAL/vim/vimrc ~/.vimrc
    cp $LOCAL/vim/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
    sh $LOCAL/vim/vim_vundle.sh
    vim +PluginInstall +qall
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
}

case "$1" in
    "all")
        Bash
        Git
        Termite
        Tmux
        Vim
        ;;

    "bash")     Bash     ;;
    "git")      Git  ;;
    "termite")  Termite  ;;
    "tmux")     Tmux     ;;
    "vim")      Vim      ;;
    *)          Usage    ;;
esac
