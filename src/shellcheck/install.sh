#!/bin/sh
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "The feature 'shellcheck' must be installed as root." >&2
    exit 1
fi

case "$(uname -m)" in
    x86_64) arch=x86_64 ;;
    aarch64 | arm64) arch=aarch64 ;;
    *)
        echo "ShellCheck is not available for architecture $(uname -m)." >&2
        exit 1
        ;;
esac

if ! command -v apt-get >/dev/null 2>&1; then
    echo "ShellCheck can only be installed on Debian or Ubuntu." >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

# Releases before 0.11.0 are only published as .tar.xz.
if ! command -v curl >/dev/null 2>&1 || [ ! -f /etc/ssl/certs/ca-certificates.crt ] || ! command -v xz >/dev/null 2>&1; then
    apt-get update
    apt-get install -y --no-install-recommends ca-certificates curl xz-utils
fi

if [ "${VERSION}" = "latest" ]; then
    # GitHub redirects the latest release to its tag, which avoids the rate
    # limit of the API.
    url="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/koalaman/shellcheck/releases/latest)"
    VERSION="${url##*/v}"
fi
VERSION="${VERSION#v}"

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

archive="shellcheck-v${VERSION}.linux.${arch}.tar.xz"
curl -fsSL -o "${tmp}/${archive}" "https://github.com/koalaman/shellcheck/releases/download/v${VERSION}/${archive}"

tar -xJf "${tmp}/${archive}" -C "${tmp}" "shellcheck-v${VERSION}/shellcheck"
install -m 0755 "${tmp}/shellcheck-v${VERSION}/shellcheck" /usr/local/bin/shellcheck

rm -rf /var/lib/apt/lists/*
