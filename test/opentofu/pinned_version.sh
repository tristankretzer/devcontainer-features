#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

# The Dev Container CLI provides the library inside the test container.
# shellcheck source=/dev/null
source dev-container-features-test-lib

check "OpenTofu has the pinned version" bash -c "tofu version | grep -F 'OpenTofu v1.12.9'"
check "OpenTofu is on hold" bash -c "apt-mark showhold | grep -qx tofu"

reportResults
