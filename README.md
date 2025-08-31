# rproxy
Caddy Server with Route53 support

## Building the Docker Image

To build the Docker image locally:

```bash
docker build -t rproxy .
```

## Running the Container

To run the container:

```bash
docker run -d -p 80:80 -p 443:443 rproxy
```

## Features

- Built on the official Caddy Docker image (v2.9.1)
- Includes the [caddy-dns/route53](https://github.com/caddy-dns/route53) module (v1.3.5) for automatic HTTPS with AWS Route53 DNS challenges
- Pinned versions for stability and reproducible builds
- Automated builds via GitHub Actions

## Version Information

This image uses specific, tested versions for reliability:
- **Caddy**: 2.9.1
- **Route53 DNS Module**: v1.3.5

For version update procedures, see [`VERSION_MANAGEMENT.md`](VERSION_MANAGEMENT.md).

## Configuration

The image uses the standard Caddy configuration. You can mount your Caddyfile as a volume:

```bash
docker run -d -p 80:80 -p 443:443 -v /path/to/Caddyfile:/etc/caddy/Caddyfile rproxy
```

See `Caddyfile.example` for an example configuration using Route53 DNS challenges for automatic HTTPS.
