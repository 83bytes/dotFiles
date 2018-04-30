#!/bin/bash

# this is a script that loads my workspaces for work.
# use it; modify it as you like

# start redshift
redshift-gtk&!

# start dunst notification service ( install dunst )
dunst&!
notify-send "dunst started successfully"

i3-msg 'exec clementine'

# open telegram in wp 9
i3-msg 'workspace 9; exec /mnt/data/programsRunning/Telegram/Telegram&'
sleep 20s # hit password while it sleeps


# i3-msg 'workspace 3; exec emacs'

i3-msg 'workspace 2; exec firefox'



