#!/bin/sh
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "The feature 'bats' must be installed as root." >&2
    exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
    echo "Bats can only be installed on Debian or Ubuntu." >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

if ! command -v curl >/dev/null 2>&1 || [ ! -f /etc/ssl/certs/ca-certificates.crt ]; then
    apt-get update
    apt-get install -y --no-install-recommends ca-certificates curl
fi

if [ "${VERSION}" = "latest" ]; then
    # GitHub redirects the latest release to its tag, which avoids the rate
    # limit of the API.
    url="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/bats-core/bats-core/releases/latest)"
    VERSION="${url##*/v}"
fi
VERSION="${VERSION#v}"

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

# The releases publish no assets, only the source archive of their tag.
archive="v${VERSION}.tar.gz"
curl -fsSL -o "${tmp}/${archive}" "https://github.com/bats-core/bats-core/archive/refs/tags/${archive}"

tar -xzf "${tmp}/${archive}" -C "${tmp}"
"${tmp}/bats-core-${VERSION}/install.sh" /usr/local

rm -rf /var/lib/apt/lists/*
