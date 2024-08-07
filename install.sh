#!/usr/bin/env bash

# Get the latest package lists
sudo apt update
sudo apt upgrade

# Install and start snap
sudo apt install snapd # install snapd to install packages
sudo snap install core # install snapd runtime env
sudo snap install curl # install curl command, used later

sudo apt-get install cowsay fortune lolcat

## Languages!
# install c++ content
sudo apt install build-essential
sudo snap install clangd --classic
# install nodejs content
sudo snap install node --classic
# Install python content
sudo snap install pyright --classic

# Remove old files
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim

## Tools for VIM/NVIM
# BurntSushi/ripgrep github
sudo apt-get install ripgrep
# Install Universal ctags for gutentags
sudo apt install universal-ctags

# }}}
# NVIM {{{

# Install neovim
# nightly builds for latest, from https://github.com/neovim/neovim/blob/master/INSTALL.md
sudo snap install --edge nvim --classic

# setup the configuration
mkdir -p ~/.config/
cp -r nvim/config/nvim ~/.config/nvim

# Install vim
sudo apt install vim

# }}} 
# VIM {{{
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle # for pathogen https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/skeleton

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > ~/.vim/autoload/pathogen.vim
# NOTE: THE URL for Pathogen changed. The old curl command was:
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Copy necessary config files
cp vim/vimrc ~/.vim/vimrc
cp vim/skeleton/* ~/.vim/skeleton/

# install gruvbox
# mkdir -p ~/.vim/colors
# curl -LSso https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim > ~/.vim/colors/gruvbox.vim

REPOS=(
    "https://github.com/ludovicchabant/vim-gutentags.git"
    "https://github.com/justinmk/vim-dirvish.git"
    "https://github.com/vim-airline/vim-airline.git"
    "https://github.com/morhetz/gruvbox.git"
)

# install all of the repos that we don't require any special config
pushd ~/.vim/bundle/
for REPO in ${REPOS[@]}
do
    git clone ${REPO}
done

# Probably don't need to handle, the gruvbox will install from pathogen
# mv ~/.vim/bundle/gruvbox/colors/* ~/.vim/colors/
# mv ~/.vim/bundle/gruvbox/autoload/* ~/.vim/autoload/
popd

# }}}
# TMUX {{{

# Add the Tmux content
# Uses TPM for package manager
if [[ ! -d ~/.tmux/plugins/tpm ]]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
cp tmux/tmux.conf ~/.tmux.conf
# Need to install packages with Prefix+I

# }}}
# Bash Setup {{{

if [[ ! -f ~/.bash_aliases ]]
then
    cp bash/bash_aliases ~/.bash_aliases
fi

# Add a nice fortune teller to bashrc
sudo apt-get install cowsay fortune lolcat

# Only add grep
if [[ -z $(grep -F "fortune | cowsay | lolcat" ~/.bashrc) ]]
then
    echo "fortune | cowsay | lolcat" >> ~/.bashrc
fi

# Add in the Tao of the Programming to fortune teller
sudo sh -c 'cat fortune/tao-compressed | base64 -d | gunzip > /usr/share/games/fortunes/tao'
sudo strfile -c % /usr/share/games/fortunes/tao /usr/share/games/fortunes/tao.dat

# }}}
