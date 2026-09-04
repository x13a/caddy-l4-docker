# caddy-l4-docker

Caddy with L4 plugin Docker hardened image

This repository automatically builds a Caddy with L4 plugin Docker hardened image. The workflow 
publishes a package using the same tag as the latest upstream version.

## Usage

```sh
docker pull ghcr.io/x13a/caddy-l4:latest
```

Available tags for a build with Caddy `2.11.4` and L4 `0.1.2`:

- `latest`
- `2`, `2.11`, `2.11.4`
- `caddy-2`, `caddy-2.11`, `caddy-2.11.4`
- `l4-0`, `l4-0.1`, `l4-0.1.2`

## License

Apache-2.0
