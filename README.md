# Build EL9

Simple container containing build tools to create RPMs. Suitable for GitHub and GitLab pipelines.

Includes `sudo` to add additional build dependencies on the fly.

For GitHub, [UID and GID must be 1001](https://github.com/actions/checkout/issues/1014#issuecomment-2899102017) to make `action/checkout` flying.
