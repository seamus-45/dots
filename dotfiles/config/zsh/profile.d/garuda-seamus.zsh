# Connection helpers
lxc() {
  if command -v kdotool >/dev/null; then
    TOOL=kdotool
  else
    TOOL=xdotool
  fi
  CLASS=$($TOOL getactivewindow getwindowclassname 2>/dev/null)
  SESSION=${CLASS:-lxc-0}
  ssh -t seamus.core tmux -u new-session -A -s ${SESSION} -t ${SESSION%-*}
}

# Garuda-home vars
export MPD_HOST="/home/seamus/.mpd/socket"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# Fix bug with drop down menus not clickable
export _JAVA_AWT_WM_NONREPARENTING=1
