#!/bin/bash

artist=$(playerctl metadata | grep -oP "(?<='xesam:artist': <\[')[.'a-zA-Z()\-+\s]*(?='\]>, 'xesam:autoR)")
title=$(playerctl metadata | grep -oP "(?<='xesam:title': <)[.'a-zA-Z()\-+\s]*(?=>, 'xesam:trackN)")
album=$(playerctl metadata | grep -oP "(?<='xesam:album': <)[.'a-zA-Z()\-+\s]*(?=>, 'xesam:albumA)")
status=$(playerctl status)

if [ "$status" != Paused ]; then
  echo -n "Spotify - now playing: $artist | $title ($album)";
else
  echo -n "Spotify - now playing: $artist | $title ($album)" [PAUSED]
fi
