#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

feh --bg-fill --no-fehbg ~/.wallpaper/Hopper-Gas-1940.png

exec /usr/bin/xmonad
