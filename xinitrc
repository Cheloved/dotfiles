# xrdb ~/.Xresources
# exec dbus-launch --exit-with-session bspwm

# Set default cursor
xsetroot -cursor_name left_ptr & 

# Bind keyboard layout change
setxkbmap -layout 'us,ru' -variant ',,' -option 'grp:alt_shift_toggle'

# Window compositor
picom -b &

# Set background
feh --bg-fill ${HOME}/pictures/wallpapers/2.jpg &

# Desktop notifications
dbus-launch dunst --config ${HOME}/.config/dunst/dunstrc &

${HOME}/git/dwm/status.sh &

exec dwm
