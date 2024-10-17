#!/bin/sh
# sel - raise and focus a window by name
# author: https://github.com/chneukirchen/

ID=$(xdotool search --onlyvisible --class "$1" 2>/dev/null)

if [ "$?" = 0 ] ; then
  xdotool windowraise $ID
  xdotool windowfocus $ID
  xdotool mousemove $(xwininfo -id $ID -stats | awk '/Absolute/ {print $4 + 50}')
else
  exit $?
fi
