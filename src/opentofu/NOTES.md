<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature installs [OpenTofu](https://opentofu.org/) from its official [APT repository](https://opentofu.org/docs/intro/install/deb/), which only works on Debian and Ubuntu.
The repository stays configured in the image, so `apt-get upgrade` keeps OpenTofu up to date.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `1.13.2`, as listed on the [OpenTofu releases](https://github.com/opentofu/opentofu/releases) page.
A pinned version is put on hold with `apt-mark hold`, so `apt-get upgrade` does not replace it.
