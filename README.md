# dotfiles

In linux, most programs need installation and configuration.
These programs are installed and configured usually in files preceded with a '.' to hide it in the default file listing.

This repo has a collection of my setup processes to help organize myself in a new environment.
Can be easily ran and is editable.

To download my usual packages, clone the repo and run the install script provided:
```bash
git clone -b stow --recurse-submodules -j8 git@github.com:mitchell-johnstone/dotfiles.git ~/dotfiles
cd dotfiles
./install.sh
```

To uninstall:
```bash
cd ~/dotfiles
stow -D .
```
