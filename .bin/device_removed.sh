#!/bin/sh

# echo "USB device removed  `date` $@" >>/tmp/xscreenlock.log

user=niklas

if [ ! -z "$user" ] ; then
    DISPLAY=:0 sudo -n -H -u "$user" /home/niklas/bin/lock
fi
