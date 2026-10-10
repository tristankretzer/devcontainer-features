#!/bin/sh
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "The feature 'reuse' must be installed as root." >&2
    exit 1
fi

if ! command -v pipx >/dev/null 2>&1; then
    if ! command -v apt-get >/dev/null 2>&1; then
        echo "pipx is missing and can only be installed automatically on Debian or Ubuntu." >&2
        exit 1
    fi

    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y --no-install-recommends pipx
    rm -rf /var/lib/apt/lists/*
fi

# install.sh runs as root, so a plain install would end up in /root and be
# invisible to the remote user. pipx 1.5.0 and later install for all users with
# --global, older versions get the same locations through the environment.
if pipx install --help | grep -q -e '--global'; then
    set -- --global
else
    set --
    export PIPX_HOME=/opt/pipx
    export PIPX_BIN_DIR=/usr/local/bin
fi

if [ "${VERSION}" = "latest" ]; then
    pipx install "$@" "reuse[charset-normalizer]"
else
    pipx install "$@" "reuse[charset-normalizer]==${VERSION}"
fi
