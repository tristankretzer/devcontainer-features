<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature downloads the official [ShellCheck](https://www.shellcheck.net/) binary from its GitHub releases and installs it into `/usr/local/bin`.
ShellCheck publishes no checksums, so the download is only protected by HTTPS.
The feature only works on Debian and Ubuntu on `amd64` and `arm64`.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `0.11.0`, as listed on the [ShellCheck releases](https://github.com/koalaman/shellcheck/releases) page.
