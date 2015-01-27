#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#Disable touchpad while typing
syndaemon -t -k -i 1 &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#Load custom keymap
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

#Contains URXVT settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3
#exec wmfs
