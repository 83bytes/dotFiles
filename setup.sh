#!/bin/sh


# will link all the dotfiles

# Define Constants
HOME=/home/sohom
DOT=/mnt/data/work_space/dotFiles

# LINKS

# xinitrc
ln -vs $DOT/xinitrc  $HOME/.xinitrc 

# xbindkeys
ln -vs $DOT/xbindkeysrc.scm $HOME/.xbindkeysrc.scm 

# Xresources
ln -vs $DOT/Xresources $HOME/.Xresources

# vimrc
ln -vs $DOT/vimrc $HOME/.vimrc

# fish
ln -vs $DOT/config/fish $HOME/.config/fish

# i3
ln -vs $DOT/config/i3 $HOME/.config/i3

# i3status
ln -vs $DOT/config/i3status $HOME/.config/i3status

# emacs
ln -vs $DOT/emacs.d/config.org $HOME/.emacs.d/config.org
ln -vs $DOT/emacs.d/init.el $HOME/.emacs.d/init.el




