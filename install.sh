#!/usr/bin/env bash
# PACKAGES {{{
# Get the latest package lists
sudo apt update
sudo apt upgrade

# Download needed packages
sudo apt install stow # Download stow
sudo apt install snapd # install snapd to install packages
sudo apt install curl # install curl!
sudo apt install cmake  # version 3.22.1-1ubuntu1.22.04.2

# For cowsay / lolcat / fortune fun
sudo apt-get install cowsay fortune lolcat # install cowsay features

# Languages!
sudo apt install build-essential
sudo apt-get install clangd-12 # c++ compiler
sudo apt install nodejs # js content
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # rust!

# Add other tools!
sudo apt install bat
cargo install --locked difftastic

# }}}
# VIM / NVIM / TMUX {{{
# Remove old files
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim
rm -rf ~/.vim
rm -rf ~/.tmux.conf
rm -rf ~/.tmux
rm -rf ~/.bash_aliases
rm -rf ~/.bashrc

# Tools for VIM/NVIM
sudo apt-get install ripgrep # BurntSushi/ripgrep github
sudo apt install universal-ctags # install Universal ctags for gutentags

# Install neovim (build from source)
# follow comment from here https://www.reddit.com/r/neovim/comments/146dssj/issue_with_getting_the_latest_neovim_on_my_ubuntu/
git clone https://github.com/neovim/neovim.git
pushd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
popd
rm -rf neovim

# Install vim
sudo apt install vim

# Uses TPM for package manager
# https://github.com/tmux-plugins/tpm
# Need to install packages with Prefix+I

# }}}
# Bash Setup {{{

# Add in the Tao of the Programming to fortune teller
sudo sh -c 'cat fortune/tao-compressed | base64 -d | gunzip > /usr/share/games/fortunes/tao'
sudo strfile -c % /usr/share/games/fortunes/tao /usr/share/games/fortunes/tao.dat

# }}}
# Stow {{{
stow .
# }}}
