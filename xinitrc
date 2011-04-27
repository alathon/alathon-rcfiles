setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap us -variant euro
xrdb ~/.Xresources &
xbindkeys &
xsetroot -cursor_name left_ptr
exec xmonad
