#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

# The Dev Container CLI provides the library inside the test container.
# shellcheck source=/dev/null
source dev-container-features-test-lib

# The command substitution is meant to be expanded by the inner shell.
# shellcheck disable=SC2016
check "markdownlint-cli2 lints a file" bash -c 'cd "$(mktemp -d)" && printf "# Title\n" > test.md && markdownlint-cli2 test.md'

reportResults
