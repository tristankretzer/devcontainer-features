
# REUSE (reuse)

Installs REUSE tool for license compliance

## Example Usage

```json
"features": {
    "ghcr.io/tristankretzer/devcontainer-features/reuse:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | REUSE tool version, either 'latest' or an exact version from PyPI | string | latest |

<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature installs the [REUSE tool](https://reuse.software/) from PyPI with [pipx](https://pipx.pypa.io/).
If pipx is missing, it is installed with `apt-get`, which only works on Debian and Ubuntu.
On other distributions the feature works as long as the image already provides pipx.

## Pinning a version

The `version` option takes either `latest` or an exact version as published on [PyPI](https://pypi.org/project/reuse/#history).


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tristankretzer/devcontainer-features/blob/main/src/reuse/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
