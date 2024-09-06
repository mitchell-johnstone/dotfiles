#!/usr/bin/env bash
# PACKAGES {{{
# Get the latest package lists
sudo apt update
sudo apt upgrade

# Download needed packages
sudo apt install stow # Download stow
sudo apt install snapd # install snapd to install packages
sudo snap install core # install snapd runtime env
sudo snap install curl # install curl command, used later

# For cowsay / lolcat / fortune fun
sudo apt-get install cowsay fortune lolcat # install cowsay features

# Languages!
sudo apt install build-essential
sudo snap install clangd --classic # install c++ content
sudo snap install node --classic # install nodejs content
sudo snap install pyright --classic # install python content

# Add difftastic!
sudo snap install difftastic

# }}}
# VIM / NVIM {{{
# Remove old files
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim
rm -rf ~/.vim
rm -rf ~/.tmux.conf
rm -rf ~/.tmux
rm -rf ~/.bash_aliases

# Tools for VIM/NVIM
sudo apt-get install ripgrep # BurntSushi/ripgrep github
sudo apt install universal-ctags # install Universal ctags for gutentags

# Install neovim
# nightly builds for latest, from https://github.com/neovim/neovim/blob/master/INSTALL.md
sudo snap install --edge nvim --classic

# Install vim
sudo apt install vim

# }}}
# TMUX {{{

# tmuxinator
gem install tmuxinator

# Uses TPM for package manager
# https://github.com/tmux-plugins/tpm
# Need to install packages with Prefix+I

# }}}
# Bash Setup {{{

# Only add grep
if [[ -z $(grep -F "fortune | cowsay | lolcat" ~/.bashrc) ]]
then
    echo "fortune | cowsay | lolcat" >> ~/.bashrc
fi

# Add in the Tao of the Programming to fortune teller
sudo sh -c 'cat fortune/tao-compressed | base64 -d | gunzip > /usr/share/games/fortunes/tao'
sudo strfile -c % /usr/share/games/fortunes/tao /usr/share/games/fortunes/tao.dat

# }}}
# Stow {{{
stow .
# }}}
