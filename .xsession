# Universal version of .xinitrc that works with xdg,xinit,startx

# Disable bell
xset -b

# set background 
sh ~/.fehbg &

# run i3 layout script
exec sh ~/.local/i3layout &
