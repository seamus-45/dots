#!/bin/bash

set -eEuo pipefail

function help {
  echo "Copy current terminfo to remote host"
  echo
  echo "$0 [user@]host"
  exit 0
}

if [ $# -eq 0 ];
then
  help
fi

while (( "$#" > 0 )); do
  case "${1}" in
    --help|-h)
      help
      ;;
    *)
      break
      ;;
  esac
  shift
done

infocmp -x \
  | ssh -q "$@" -- \
  'tmpfile="${TMPDIR:-${TMP:-/tmp}}/${user}.'"${TERM}"'.$$.terminfo"; dd of="$tmpfile" ; tic -x "$tmpfile" ; rm -f "$tmpfile"'

echo
if ssh -q "$@" -- 'env TERM='"${TERM}"' infocmp -x >/dev/null'; then
  echo "The TERM '${TERM}' has been sent." 1>&2
else
  echo "ERROR: Failed to send the TERM '${TERM}'." 1>&2
  exit 1
fi

# EOF
