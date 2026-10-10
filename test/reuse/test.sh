#!/bin/bash
# SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>
#
# SPDX-License-Identifier: MIT

set -e

source dev-container-features-test-lib

check "REUSE version" reuse --version

reportResults
