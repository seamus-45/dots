# Connection helpers
lxc() {
  CLASS=$(xdotool getactivewindow getwindowclassname 2>/dev/null)
  SESSION=${CLASS:-lxc}
  ssh -t seamus.core tmux -u new-session -A -s ${SESSION} -t ${SESSION%-*}
}

# Garuda-home vars
export MPD_HOST="/home/seamus/.mpd/socket"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

## Show system info
if command -v fastfetch; then
  fastfetch --config mokka.jsonc
fi
