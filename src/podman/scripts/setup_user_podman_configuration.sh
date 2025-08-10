#!/bin/sh
set -e

if [ "$(id -u)" = 0 ]; then
  exit
fi

mkdir -p ~/.config/containers
cp /usr/local/share/podman-containers.conf ~/.config/containers
