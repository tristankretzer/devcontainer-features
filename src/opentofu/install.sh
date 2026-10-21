#!/bin/sh
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "The feature 'opentofu' must be installed as root." >&2
    exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
    echo "OpenTofu can only be installed on Debian or Ubuntu." >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

if ! command -v curl >/dev/null 2>&1 || [ ! -f /etc/ssl/certs/ca-certificates.crt ]; then
    apt-get update
    apt-get install -y --no-install-recommends ca-certificates curl
fi

# apt verifies the repository with these keys, which also covers the checksums
# of the packages. It reads armored keys as long as the file ends in .asc, so
# gnupg is not needed to convert them.
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://get.opentofu.org/opentofu.gpg -o /etc/apt/keyrings/opentofu.gpg
curl -fsSL https://packages.opentofu.org/opentofu/tofu/gpgkey -o /etc/apt/keyrings/opentofu-repo.asc
chmod a+r /etc/apt/keyrings/opentofu.gpg /etc/apt/keyrings/opentofu-repo.asc

echo "deb [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.asc] https://packages.opentofu.org/opentofu/tofu/any/ any main" \
    > /etc/apt/sources.list.d/opentofu.list

apt-get update
if [ "${VERSION}" = "latest" ]; then
    apt-get install -y --no-install-recommends tofu
else
    apt-get install -y --no-install-recommends "tofu=${VERSION}"
    # Keep apt-get upgrade from replacing the pinned version.
    apt-mark hold tofu
fi

rm -rf /var/lib/apt/lists/*
