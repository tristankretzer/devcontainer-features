#!/bin/bash
set -e

source dev-container-features-test-lib

apt-get update -q
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq ca-certificates

check "Podman version" podman version

check "Podman Compose version" podman-compose version

tee compose.yml > /dev/null <<EOF
services:
    hello-world:
        image: hello-world
EOF
check "Run Podman Compose" podman-compose up | grep "Hello from Docker!"

reportResults
