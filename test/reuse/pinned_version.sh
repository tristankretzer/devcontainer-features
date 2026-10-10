#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

# The Dev Container CLI provides the library inside the test container.
# shellcheck source=/dev/null
source dev-container-features-test-lib

check "reuse has the pinned version" bash -c "reuse --version | grep -F 'version 6.1.2'"

reportResults
