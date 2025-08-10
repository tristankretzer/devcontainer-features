#!/bin/bash
set -e

source dev-container-features-test-lib

if [ "$(id -u)" = 0 ]; then
    apt-get update -q
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq ca-certificates
else
    sudo apt-get update -q
    sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq ca-certificates
fi

check "Podman version" podman version

check "Podman run hello-world" podman run hello-world | grep "Hello from Docker!"

reportResults
