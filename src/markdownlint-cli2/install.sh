#!/bin/sh
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "The feature 'markdownlint-cli2' must be installed as root." >&2
    exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
    echo "npm is missing, although the feature depends on the Node.js feature." >&2
    exit 1
fi

# The Node.js feature installs Node.js with nvm, so a plain global install would
# end up in the directory of the active Node.js version and disappear as soon as
# the user switches to another one. In /usr/local the command stays available
# for all users and every Node.js version.
npm install --global --prefix /usr/local "markdownlint-cli2@${VERSION}"

# Keep the download cache out of the image layer.
npm cache clean --force
