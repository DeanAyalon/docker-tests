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
Not sure
