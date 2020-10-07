#!/bin/bash
mkdir $HOME/.config/i3
mkdir $HOME/.config/nvim
ln -s $HOME/dotfiles/i3/config $HOME/.config/i3/config
ln -s $HOME/dotfiles/i3status/config $HOME/.config/i3status/config
ln -s $HOME/dotfiles/ideavim/ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/inputrc/inputrc $HOME/.inputrc
ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
