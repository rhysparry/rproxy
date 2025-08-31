FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/route53

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

LABEL org.opencontainers.image.title="rproxy"
LABEL org.opencontainers.image.description="Caddy Server with Route53 DNS support"
LABEL org.opencontainers.image.source="https://github.com/rhysparry/rproxy"