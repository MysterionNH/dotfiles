#!/bin/zsh

# idea ide fix
export _JAVA_AWT_WM_NONREPARENTING=1

# dmenu args
#creatDmenuArgs

# set urxvt options
xrdb -merge ~/.Xresources

# use gtk widgets
export QT_STYLE_OVERRIDE=GTK+

# hide cursor
unclutter &

# set the keymap
setxkbmap de &

# stop pointer from being a X sometimes
xsetroot -cursor_name left_ptr &

# start xbindkeys
xbindkeys &

# hide cursor when inactive
unclutter &

# enable compositor
compton -b &

# set backbround
feh --bg-fill "$HOME/.background/background.png" &

$HOME/.bin/start-polybar &

# start xautolocker
xautolock -time 15 -locker lock -nowlocker lock -killtime 10 -killer "systemctl suspend" -detectsleep &

# start the de itself
exec bspwm
