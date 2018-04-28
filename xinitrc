# set urxvt terminal color and stuff
xrdb -merge /home/sohom/.Xresources

# load xbindkeys
xbindkeys

# load i3wm 
exec i3

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

