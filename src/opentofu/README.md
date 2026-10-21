
# OpenTofu (opentofu)

Installs OpenTofu for managing infrastructure as code.

## Example Usage

```json
"features": {
    "ghcr.io/tristankretzer/devcontainer-features/opentofu:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | OpenTofu version, either 'latest' or an exact version from the OpenTofu APT repository | string | latest |

<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature installs [OpenTofu](https://opentofu.org/) from its official [APT repository](https://opentofu.org/docs/intro/install/deb/), which only works on Debian and Ubuntu.
The repository stays configured in the image, so `apt-get upgrade` keeps OpenTofu up to date.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `1.13.2`, as listed on the [OpenTofu releases](https://github.com/opentofu/opentofu/releases) page.
A pinned version is put on hold with `apt-mark hold`, so `apt-get upgrade` does not replace it.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tristankretzer/devcontainer-features/blob/master/src/opentofu/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
