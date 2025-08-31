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

- Built on the official Caddy Docker image
- Includes the [caddy-dns/route53](https://github.com/caddy-dns/route53) module for automatic HTTPS with AWS Route53 DNS challenges
- Automated builds via GitHub Actions

## Configuration

The image uses the standard Caddy configuration. You can mount your Caddyfile as a volume:

```bash
docker run -d -p 80:80 -p 443:443 -v /path/to/Caddyfile:/etc/caddy/Caddyfile rproxy
```
