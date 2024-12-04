#!/bin/sh
if [ $# -lt 1 ]; then
  echo "Usage: $(basename $0) [-a] URL"
  echo "Args:"
  echo "  -a  Play audio only"
  exit 1
fi

OPTSTRING=":a"
while getopts ${OPTSTRING} opt; do
  case ${opt} in
    a)
      AUDIO=1
      shift
      ;;
    ?)
      echo "Unknown argument: -${OPTARG}"
      exit 1
      ;;
  esac
done

URL=$1

if [ ${AUDIO:-0} -eq 1 ];
then
  yt-dlp -q "${URL}" --proxy socks5://127.0.0.1:1080 -f 'bestaudio[ext=m4a]' -o - | mpv -force-seekable=yes -really-quiet -force-window=yes - &
else
  # --x11-name="pip"
  yt-dlp -q "${URL}" --proxy socks5://127.0.0.1:1080 -o - | mpv -force-seekable=yes --autofit=1920 -really-quiet - &
fi
