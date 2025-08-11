#!/bin/sh
set -e

USER_NAME=${1:-$(id -un)}

if [ "$(id -u)" != 0 ] && [ "$(command -v sudo)" ]; then
  sudo "$0" "${USER_NAME}"
  exit
elif [ "$(id -u)" != 0 ]; then
  echo "Script must be run as root or sudo must be installed!"
  exit 1
fi

cp /dev/null /etc/subuid
cp /dev/null /etc/subgid

usermod --add-subuids 1-65535 --add-subgids 1-65535 root

if [ "$(id -u "$USER_NAME")" != 0 ]; then
  USER_ID="$(id -u "$USER_NAME")"
  GROUP_ID="$(id -g "$USER_NAME")"
  
  usermod --add-subuids 1-$((USER_ID - 1)) --add-subuids $((USER_ID + 1))-65535 --add-subgids 1-$((GROUP_ID - 1)) --add-subgids $((GROUP_ID + 1))-65535 "${USER_NAME}"
fi
