# Connection helpers
lxc() {
  CLASS=$(xdotool getactivewindow getwindowclassname 2>/dev/null)
  SESSION=${CLASS:-lxc}
  ssh -t seamus.core tmux -u new-session -A -s ${SESSION} -t ${SESSION%-*}
}

# Garuda-home vars
export MPD_HOST="/home/seamus/.mpd/socket"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# Fix bug with drop down menus not clickable
export _JAVA_AWT_WM_NONREPARENTING=1

## Show system info
if command -v fastfetch; then
  fastfetch --config mokka.jsonc
fi

# Fix cellular network problems
alias pacman="env https_proxy=socks://127.0.0.1:1080 pacman"
alias paru="env https_proxy=socks://127.0.0.1:1080 paru"
