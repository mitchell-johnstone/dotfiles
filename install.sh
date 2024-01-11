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
cp -r dotfiles/.config/nvim ~/.config/nvim

###############
# TMUX
###############

# Add the Tmux content
# Uses TPM for package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp dotfiles/.tmux.conf ~/
# Need to install packages with Prefix <C-a> and then capital I

###############
# Bash Setup
###############

cp dotfiles/.bash_aliases ~/
