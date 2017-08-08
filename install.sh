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

usage() {
    echo "Usage: sh install.sh <option>"
    echo "Where option is one of the following:"
    echo "  - all: Install everything"
    echo "  - bash: Install bashrc"
    echo "  - git: Install some git configuration"
    echo "  - termite: Install some termite configuration"
    echo "  - tmux: Install some tmux configuration"
    echo "  - vim: vimrc and all my .vim. Also runs vim_bundle.sh"
}

bash() {
    echo " + Installing bashrc"
    echo "      cp ./bash/bashrc ~/.bashrc"
    echo " 	cp ./bash/dir_colors ~/.dir_colors"
    cp ./bash/bashrc ~/.bashrc
    cp ./bash/dir_colors ~/.dir_colors
}

git() {
    echo " + Installing git configuration"
    echo "      mkdir -p ~/.config/git"
    echo "      cp ./git/gitconfig ~/.gitconfig"
    echo "      cp ./git/gitignore ~/.config/git/gitignore"
    mkdir -p ~/.config/git
    cp ./git/gitconfig ~/.gitconfig
    cp ./git/gitignore ~/.config/git/gitignore
}

termite() {
    echo " + Installing termite configuration"
    echo "      mkdir -p ~/.config/termite"
    echo "      cp ./termite/config ~/.config/termite/"
    mkdir -p ~/.config/termite
    cp ./termite/config ~/.config/termite/
}

tmux() {
    echo " + Installing tmux configuration"
    echo "      cp ./tmux/tmux.conf ~/.tmux.conf"
    cp ./tmux/tmux.conf ~/.tmux.conf
}

vim() {
    echo " + Installing and preparing vim configuration"
    echo "      mkdir -p ~/.vim"
    echo "      cp -r ./vim/* ~/.vim/"
    echo "      mv ~/.vim/vimrc ~/.vimrc"
    echo "      mv ~/.vim/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py"
    echo "      sh ~/.vim/vim_vundle.sh"
    mkdir -p ~/.vim
    cp -r ./vim/* ~/.vim/
    mv ~/.vim/vimrc ~/.vimrc
    mv ~/.vim/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
    sh ~/.vim/vim_bundle.sh
}

case "$1" in
    "all")
        bash
        git
        termite
        tmux
        vim
        ;;

    "bash")     bash     ;;
    "git")      git  ;;
    "termite")  termite  ;;
    "tmux")     tmux     ;;
    "vim")      vim      ;;
    *)          usage    ;;
esac
