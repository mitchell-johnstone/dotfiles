#!/bin/sh
sudo apt-get update  # To get the latest package lists

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
cp -r ./.config/nvim ~/.config/nvim

###############
# TMUX
###############

# Add the Tmux content
# Uses TPM for package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ./.tmux.conf ~/
# Need to install packages with Prefix <C-a> and then capital I

