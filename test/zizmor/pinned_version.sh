#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

# The Dev Container CLI provides the library inside the test container.
# shellcheck source=/dev/null
source dev-container-features-test-lib

check "zizmor has the pinned version" bash -c "zizmor --version | grep -F 'zizmor 1.31.1'"

reportResults
