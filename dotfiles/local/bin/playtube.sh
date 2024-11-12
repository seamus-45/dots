#!/bin/sh
if [ $# -lt 1 ]; then
  echo "Usage: $(basename $0) URL"
  exit 1
fi

URL=$1

yt-dlp -q "${URL}" --proxy socks5://127.0.0.1:1080 -o - | mpv -force-seekable=yes --autofit=1920 -really-quiet - &
  # mpv -force-seekable=yes --autofit=1920 -really-quiet --x11-name="pip" - &
