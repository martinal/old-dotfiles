#!/bin/bash
mkdir $HOME/.config/i3
ln -s $HOME/dotfiles/i3/config $HOME/.config/i3/config

mkdir $HOME/.config/i3status
ln -s $HOME/dotfiles/i3status/config $HOME/.config/i3status/config

mkdir $HOME/.config/nvim
ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

ln -s $HOME/dotfiles/ideavim/ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/inputrc/inputrc $HOME/.inputrc
