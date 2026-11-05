
# ShellCheck (shellcheck)

Installs ShellCheck for linting shell scripts.

## Example Usage

```json
"features": {
    "ghcr.io/tristankretzer/devcontainer-features/shellcheck:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | ShellCheck version, either 'latest' or an exact version from the ShellCheck GitHub releases | string | latest |

<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature downloads the official [ShellCheck](https://www.shellcheck.net/) binary from its GitHub releases and installs it into `/usr/local/bin`.
ShellCheck publishes no checksums, so the download is only protected by HTTPS.
The feature only works on Debian and Ubuntu on `amd64` and `arm64`.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `0.11.0`, as listed on the [ShellCheck releases](https://github.com/koalaman/shellcheck/releases) page.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tristankretzer/devcontainer-features/blob/master/src/shellcheck/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
