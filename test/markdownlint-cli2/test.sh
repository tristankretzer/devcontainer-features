#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

source dev-container-features-test-lib

check "markdownlint-cli2 lints a file" bash -c 'cd "$(mktemp -d)" && printf "# Title\n" > test.md && markdownlint-cli2 test.md'

reportResults
