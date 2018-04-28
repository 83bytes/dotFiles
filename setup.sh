#!/bin/sh

# Author: Sohom Bhattacharjee

# This script will link all the sources with all the destinations.
# Use this to manage configuration files

# Define Constants
HOME=/home/sohom
DOT=/mnt/data/work_space/dotFiles


# Source Array
SOURCE=( xinitrc
	 xbindkeysrc.scm
	 Xresources
	 vimrc
	 config/fish
	 config/i3
	 config/i3status
	 emacs.d/config.org
	 emacs.d/init.el
	 scripts/battery.sh
       )

# Destination Array
DEST=( .xinitrc
       .xbindkeysrc.scm
       .Xresources
       .vimrc
       .config/fish
       .config/i3
       .config/i3status
       .emacs.d/config.org
       .emacs.d/init.el
       /work_space/scripts/battery.sh
     )

len=${#SOURCE[*]}

for ((i = 0; i < len ; i++))
do
    ln -vs $DOT/${SOURCE[i]} $HOME/${DEST[i]}
done

