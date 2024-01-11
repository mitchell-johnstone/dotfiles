#!/bin/sh
sudo apt update # To get the latest package lists
sudo apt install snapd # install snapd to install packages
sudo snap install core # install snapd runtime env

###############
# NVIM
###############

## Languages!
# install c++ content
sudo apt install build-essential
sudo snap install clangd --classic
# install nodejs content
sudo snap install node --classic

# Install neovim
# nightly builds for latest, from https://github.com/neovim/neovim/blob/master/INSTALL.md
sudo snap install --edge nvim --classic
# setup the configuration
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.config/nvim
mkdir -p ~/.config/
cp -r dotfiles/nvim/config/nvim ~/.config/nvim

###############
# VIM
###############
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle # for pathogen https://github.com/tpope/vim-pathogen

cp vim/vimrc ~/.vim/vimrc

# install gruvbox colorscheme
git clone --depth=1 https://github.com/morhetz/gruvbox.git ~/.vim
rm -rf ~/.vim/.git

REPOS=(
    "https://github.com/ludovicchabant/vim-gutentags"
    "https://github.com/justinmk/vim-dirvish.git"
    "https://github.com/vim-airline/vim-airline.git"
)

# install all of the repos that we don't require any special config
for REPO in ${REPOS[@]}
do
    git clone  "${REPO}" ~/.vim/bundle
done

###############
# TMUX
###############

# Add the Tmux content
# Uses TPM for package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp dotfiles/tmux/tmux.conf ~/.tmux.conf
# Need to install packages with Prefix <C-a> and then capital I

###############
# Bash Setup
###############

cp dotfiles/bash/bash_aliases ~/.bash_aliases

# Add a nice fortune teller to bashrc
sudo apt-get install cowsay fortune lolcat
echo "fortune | cowsay | lolcat" >> .bashrc

# Add in the Tao of the Programming to fortune teller
sudo cat dotfiles/fortune/tao-compressed | base64 -d | gunzip > /usr/share/games/fortunes/tao
sudo strfile -c % /usr/share/games/fortunes/tao /usr/share/games/fortunes/tao.dat
