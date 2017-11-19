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
compton -b --dbus &

# enable sync between urxvt and x clipboard
autocutsel -fork &

# set backbround
feh --bg-fill "$HOME/.background/background" &

# start bars
$HOME/bin/start-polybar &

# start dunst
dunst &

# start xautolocker
xautolock -time 15 -locker /home/niklas/bin/lock -nowlocker /home/niklas/bin/lock -killtime 10 -killer "systemctl suspend" -detectsleep &

# start redshift
pgrep redshift &> /dev/null || redshift -l 52.48:13.48 -m randr -t 6500:3500 &> /dev/null &

# start the de itself
exec bspwm
