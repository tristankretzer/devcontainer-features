
# Bats (bats)

Installs Bats for testing shell scripts.

## Example Usage

```json
"features": {
    "ghcr.io/tristankretzer/devcontainer-features/bats:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Bats version, either 'latest' or an exact version from the Bats GitHub releases | string | latest |

<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature downloads the source archive of a [Bats](https://github.com/bats-core/bats-core) release from GitHub and installs it into `/usr/local` with the installer it ships.
Bats publishes no checksums, so the download is only protected by HTTPS.
The feature only works on Debian and Ubuntu.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `1.14.0`, as listed on the [Bats releases](https://github.com/bats-core/bats-core/releases) page.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tristankretzer/devcontainer-features/blob/master/src/bats/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
