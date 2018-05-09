#!/bin/sh

mkdir ~/Repos
cd ~/Repos
git clone https://github.com/srsudar/tmux-completion.git
cd tmux-completion
sudo cp tmux /usr/share/bash-completion/completions
