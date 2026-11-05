
# actionlint (actionlint)

Installs actionlint for checking GitHub Actions workflow files.

## Example Usage

```json
"features": {
    "ghcr.io/tristankretzer/devcontainer-features/actionlint:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | actionlint version, either 'latest' or an exact version from the actionlint GitHub releases | string | latest |

<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature downloads the official [actionlint](https://github.com/rhysd/actionlint) binary from its GitHub releases, checks it against the checksums of the release and installs it into `/usr/local/bin`.
The feature only works on Debian and Ubuntu on `amd64` and `arm64`.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `1.7.12`, as listed on the [actionlint releases](https://github.com/rhysd/actionlint/releases) page.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tristankretzer/devcontainer-features/blob/master/src/actionlint/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
