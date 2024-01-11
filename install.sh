#!/usr/bin/env bash
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
cp -r nvim/config/nvim ~/.config/nvim

###############
# VIM
###############
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle # for pathogen https://github.com/tpope/vim-pathogen

# Install Universal ctags for gutentags
sudo apt install universal-ctags

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cp vim/vimrc ~/.vim/vimrc

# install gruvbox :(
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
    git clone ${REPO} ${INSTALL_PATH}
    # NAME=$(echo $REPO | rev | cut -d/ -f1 | rev | cut -d. -f1)
    # echo "Installing ${NAME}..."
    # INSTALL_PATH="~/.vim/bundle/${NAME}"
    # echo "Installing to ${INSTALL_PATH}..."
    # if [[ ! -d "${INSTALL_PATH}" ]]
    # then
    #     git clone ${REPO} ${INSTALL_PATH}
    # fi
done

mv ~/.vim/bundle/gruvbox/colors/* ~/.vim/colors/
mv ~/.vim/bundle/gruvbox/autoload/* ~/.vim/autoload/
popd

###############
# TMUX
###############

# Add the Tmux content
# Uses TPM for package manager
if [[ ! -d ~/.tmux/plugins/tpm ]]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
cp tmux/tmux.conf ~/.tmux.conf
# Need to install packages with Prefix <C-a> and then capital I

###############
# Bash Setup
###############

cp bash/bash_aliases ~/.bash_aliases

# Add a nice fortune teller to bashrc
sudo apt-get install cowsay fortune lolcat
echo "fortune | cowsay | lolcat" >> ~/.bashrc

# Add in the Tao of the Programming to fortune teller
sudo sh -c 'cat fortune/tao-compressed | base64 -d | gunzip > /usr/share/games/fortunes/tao'
sudo strfile -c % /usr/share/games/fortunes/tao /usr/share/games/fortunes/tao.dat
