#!/bin/bash
set -e

source dev-container-features-test-lib

apt-get update -q
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq ca-certificates

check "Docker version" docker version

check "Docker run hello-world" docker run hello-world | grep "Hello from Docker!"

check "Docker run debian" docker run debian:bookworm echo "Container started!" | grep "Container started!"

reportResults
