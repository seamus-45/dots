# Connection helpers
lxc() {
  CLASS=$(xdotool getactivewindow getwindowclassname)
  SESSION=${CLASS:-lxc}
  ssh -t seamus-lxc tmux -u new-session -A -s ${SESSION} -t ${SESSION%-*}
}

# Garuda-home vars
export MPD_HOST="/home/seamus/.mpd/socket"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
