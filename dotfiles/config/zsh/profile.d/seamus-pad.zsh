# source "main" profile
source $ZCONFDIR/profile.d/garuda-seamus.zsh

if command -v fastfetch >/dev/null; then
  fastfetch --config mokka.jsonc
fi
