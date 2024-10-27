# Purpose
The GitHub container registry has a UI problem
When building a multi-platform image, ghcr recognizes an additional 'platform' - `unknown/unknown`

# Solution
```sh
export BUILDX_NO_DEFAULT_ATTESTATIONS=1
docker compose build
```
With no default attestations, GitHub does not include the 'unknown/unknown' platform.

## Implications
Might affect the security of the image, as the default attestations provide metadata that helps verify the origin and integrity of the build.<br>
This includes information on the source code, build environment, and other details that are crucial for ensuring the image hasn’t been tampered with.