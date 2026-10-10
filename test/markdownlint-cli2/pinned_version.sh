#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

# The Dev Container CLI provides the library inside the test container.
# shellcheck source=/dev/null
source dev-container-features-test-lib

check "markdownlint-cli2 has the pinned version" bash -c "markdownlint-cli2 --help | grep -F 'markdownlint-cli2 v0.22.1'"

reportResults
