
#Set Keymap
setxkbmap -layout de 

#xinput mouse and scroll stuff
xinput set-prop 12 "Accel Speed" 1
xinput set-prop 12 "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
xinput set-prop 12 "Device Accel Constant Deceleration" 1 
xinput set-prop 12 "Device Accel Velocity Scaling" 10

#set refreshrate
xrandr --output eDP-1 --mode 1920x1200 --rate 60 --brightness 0.5 --dpi 85 --brightness 0.65

#set bg 
#feh --bg-max /media/shared/Images/SickleRick.jpg


xautolock -time 15 -locker slock &
slstatus &
wpa_gui &
gentoo-pipewire-launcher &
dbus-launch --exit-with-session dwm
