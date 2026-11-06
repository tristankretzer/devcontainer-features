<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Supported platforms

The feature downloads the official [age](https://age-encryption.org/) binaries `age` and `age-keygen` from its GitHub releases and installs them into `/usr/local/bin`.
age publishes no checksums, so the download is only protected by HTTPS.
The feature only works on Debian and Ubuntu on `amd64` and `arm64`.

## Pinning a version

The `version` option takes either `latest` or an exact version such as `1.3.2`, as listed on the [age releases](https://github.com/FiloSottile/age/releases) page.
