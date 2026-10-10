
# markdownlint-cli2 (markdownlint-cli2)

Installs markdownlint-cli2 for linting Markdown files.

## Example Usage

```json
"features": {
    "ghcr.io/tristankretzer/devcontainer-features/markdownlint-cli2:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | markdownlint-cli2 version, either 'latest' or an exact version from npm | string | latest |

<!-- This file is appended to the generated README, below its top-level heading. -->
<!-- markdownlint-disable-file MD041 -->

## Node.js

The feature installs [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) from npm into `/usr/local`.
It depends on the [Node.js feature](https://github.com/devcontainers/features/tree/main/src/node), which the Dev Container CLI installs automatically.
Recent versions of markdownlint-cli2 require Node.js 22 or later.
If you configure the Node.js feature with an older Node.js version, pin a version of markdownlint-cli2 that still supports it.

## Pinning a version

The `version` option takes either `latest` or an exact version as published on [npm](https://www.npmjs.com/package/markdownlint-cli2?activeTab=versions).


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tristankretzer/devcontainer-features/blob/main/src/markdownlint-cli2/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
