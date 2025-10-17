# Multi-stage build for Caddy with Route53 DNS support
# Pinned versions for reproducible builds and compatibility

# Build stage with explicit version pinning
FROM caddy:2.9.1-builder AS builder

# Set environment variables for reproducible builds
ENV GOPROXY=https://proxy.golang.org,direct
ENV GOSUMDB=sum.golang.org

# Build Caddy with Route53 DNS module
# Caddy 2.9.1 is compatible with route53 module v1.3.3 and above
RUN xcaddy build v2.9.1 \
    --with github.com/caddy-dns/route53@v1.5.0

# Runtime stage
FROM caddy:2.9.1

# Copy the custom Caddy binary from builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Metadata labels following OCI image specification
LABEL org.opencontainers.image.title="rproxy" \
      org.opencontainers.image.description="Caddy Server with Route53 DNS support" \
      org.opencontainers.image.source="https://github.com/rhysparry/rproxy" \
      org.opencontainers.image.version="caddy-2.9.1-route53-1.5.0"