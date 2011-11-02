. /etc/X11/xinit/xinitrc.d/*
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap us -variant euro
xrdb ~/.Xresources &
xbindkeys &
xsetroot -cursor_name left_ptr

exec trayer --edge top --align right --width 15 --height 5 \
		--transparent false --SetDockType true --SetPartialStrut true \
		--alpha 0 --tint 0x000000 --expand true &

exec archassistant &
exec dropboxd &
exec xmonad
