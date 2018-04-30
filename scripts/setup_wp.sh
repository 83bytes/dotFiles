#!/bin/bash

# this is a script that loads my workspaces for work.
# use it; modify it as you like


# preload clementine in bg (install clementine)
i3-msg 'workspace 10; exec clementine'

# start redshift
redshift-gtk&!

# start dunst notification service ( install dunst )
dunst&!
notify-send "dunst started successfully"

# open telegram in wp 7
i3-msg 'workspace 9; exec /mnt/data/programsRunning/Telegram/Telegram&'
i3-msg 'workspace 9; exec gajim; exec thunderbird'
#i3-msg 'workspace 9; exec riot-desktop'
sleep 20s # hit password while it sleeps


i3-msg 'workspace 3; exec emacs'

# start firefox
i3-msg 'workspace 2; exec firefox; workspace 3'


