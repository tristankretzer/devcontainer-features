#!/bin/sh
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "The feature 'age' must be installed as root." >&2
    exit 1
fi

case "$(uname -m)" in
    x86_64) arch=amd64 ;;
    aarch64 | arm64) arch=arm64 ;;
    *)
        echo "age is not available for architecture $(uname -m)." >&2
        exit 1
        ;;
esac

if ! command -v apt-get >/dev/null 2>&1; then
    echo "age can only be installed on Debian or Ubuntu." >&2
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
    url="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/FiloSottile/age/releases/latest)"
    VERSION="${url##*/v}"
fi
VERSION="${VERSION#v}"

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

archive="age-v${VERSION}-linux-${arch}.tar.gz"
curl -fsSL -o "${tmp}/${archive}" "https://github.com/FiloSottile/age/releases/download/v${VERSION}/${archive}"

tar -xzf "${tmp}/${archive}" -C "${tmp}" age/age age/age-keygen
install -m 0755 "${tmp}/age/age" "${tmp}/age/age-keygen" /usr/local/bin/

rm -rf /var/lib/apt/lists/*
