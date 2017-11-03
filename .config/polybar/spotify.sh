#!/bin/bash

artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)
#album=$(playerctl metadata xesam:album)
status=$(playerctl status)

if [ 1 -eq $(playerctl metadata mpris:trackid | grep -c spotify:ad) ]; then
	echo -n "Advertisment";
elif [ "$status" != Paused ]; then
	echo -n "\"$title\" - $artist";
else
	echo -n "\"$title\" - $artist [PAUSED]";
fi
