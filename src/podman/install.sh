#!/bin/sh
set -e

PACKAGES_TO_INSTALL="fuse-overlayfs podman uidmap"
if [ "${COMPOSE}" = "true" ]; then
  PACKAGES_TO_INSTALL="${PACKAGES_TO_INSTALL} podman-compose"
fi

apt-get update -q
# shellcheck disable=SC2086
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq $PACKAGES_TO_INSTALL
rm -rf /var/lib/apt/lists/*

cp ./configurations/containers.conf /etc/containers

cp ./scripts/setup_subuid_and_subgid.sh /usr/local/share
chmod +x /usr/local/share/setup_subuid_and_subgid.sh

cp ./configurations/podman-containers.conf /usr/local/share
cp ./scripts/setup_user_podman_configuration.sh /usr/local/share
chmod +x /usr/local/share/setup_user_podman_configuration.sh
