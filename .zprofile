# when there is a display and we are in vtr1 or vtr2, start x11

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -le 2 ]; then
  exec startx
fi
