<!--
SPDX-FileCopyrightText: 2026 Tristan Kretzer <tristan@kretzer.dev>

SPDX-License-Identifier: MIT
-->

# Dev Container Features

[![CI - Test Features](https://github.com/tristankretzer/devcontainer-features/actions/workflows/test.yml/badge.svg)](https://github.com/tristankretzer/devcontainer-features/actions/workflows/test.yml)
[![REUSE Compliance Check](https://github.com/tristankretzer/devcontainer-features/actions/workflows/reuse-compliance.yml/badge.svg)](https://github.com/tristankretzer/devcontainer-features/actions/workflows/reuse-compliance.yml)

A collection of features for [Dev Containers](https://containers.dev/).

## Features

| Feature                                    | Description                                                                                                   |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| [actionlint](src/actionlint)               | Installs [actionlint](https://github.com/rhysd/actionlint) for checking GitHub Actions workflow files.        |
| [bats](src/bats)                           | Installs [Bats](https://github.com/bats-core/bats-core) for testing shell scripts.                            |
| [cfn-lint](src/cfn-lint)                   | Installs [cfn-lint](https://github.com/aws-cloudformation/cfn-lint) for linting AWS CloudFormation templates. |
| [markdownlint-cli2](src/markdownlint-cli2) | Installs [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) for linting Markdown files.     |
| [opentofu](src/opentofu)                   | Installs [OpenTofu](https://opentofu.org/) for managing infrastructure as code.                               |
| [reuse](src/reuse)                         | Installs the [REUSE tool](https://reuse.software/) for checking license compliance.                           |
| [shellcheck](src/shellcheck)               | Installs [ShellCheck](https://www.shellcheck.net/) for linting shell scripts.                                 |
| [zizmor](src/zizmor)                       | Installs [zizmor](https://docs.zizmor.sh/) for finding security issues in GitHub Actions workflows.           |

## License

This project is licensed under the [MIT License](LICENSE).
