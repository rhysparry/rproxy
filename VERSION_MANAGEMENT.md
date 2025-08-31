# Version Management

This document describes the process for managing and updating the versions of Caddy and its modules used in this project.

## Current Versions

- **Caddy**: 2.9.1
- **Route53 DNS Module**: v1.5.0

## Version Compatibility

The versions specified in the Dockerfile are chosen based on compatibility testing and stability requirements:

- Caddy 2.9.x series provides stable HTTPS handling and DNS challenge support
- Route53 module v1.3.x series is compatible with Caddy v2.9.x
- These versions have been tested together and confirmed to work properly

## Updating Versions

### When to Update

1. **Security updates**: Update immediately when security patches are released
2. **Bug fixes**: Update when critical bugs are fixed in newer versions
3. **New features**: Evaluate if new features are needed before updating
4. **Regular maintenance**: Review and update quarterly

### How to Update

1. **Check Compatibility**: Before updating, verify compatibility between Caddy and module versions:
   ```bash
   # Check latest Caddy releases
   curl -s https://api.github.com/repos/caddyserver/caddy/releases/latest
   
   # Check latest Route53 module releases
   curl -s https://api.github.com/repos/caddy-dns/route53/releases/latest
   ```

2. **Update Dockerfile**: Modify the version numbers in the Dockerfile:
   ```dockerfile
   FROM caddy:X.Y.Z-builder AS builder
   RUN xcaddy build vX.Y.Z \
       --with github.com/caddy-dns/route53@vA.B.C
   FROM caddy:X.Y.Z
   ```

3. **Test the Build**: Always test the build after version updates:
   ```bash
   docker build -t rproxy-test .
   docker run --rm rproxy-test caddy version
   ```

4. **Update Documentation**: Update this file and any relevant documentation with the new versions.

5. **Update CI/CD**: Ensure GitHub Actions workflows are updated if needed.

## Testing New Versions

Before deploying updated versions:

1. **Build Test**: Verify the Docker image builds successfully
2. **Functionality Test**: Test that Route53 DNS challenges work correctly
3. **Performance Test**: Ensure no performance regressions
4. **Security Scan**: Run security scans on the new image

## Rollback Plan

If issues arise with new versions:

1. Revert the Dockerfile to the previous working versions
2. Rebuild and test the image
3. Update the CI/CD pipeline if necessary
4. Document the issue and incompatibility

## Version History

| Date | Caddy Version | Route53 Module | Notes |
|------|---------------|----------------|-------|
| 2025-01-27 | 2.9.1 | v1.5.0 | Updated Route53 module to v1.5.0 for improved compatibility |
| 2025-08-31 | 2.9.1 | v1.3.5 | Initial pinned versions for compatibility |