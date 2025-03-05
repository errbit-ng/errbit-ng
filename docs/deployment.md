# Deployment

There are any number of ways to deploy Errbit-NG, but official support is
Docker with Compose plugin.

See specific notes on deployment via:

* [docker compose](deployment/docker-compose.md)

## HTTPS and ACME

1. We don't recommend run `puma` with https support.
2. We recommend run errbit-ng from docker images behind reverse-proxy with HTTPS support (ACME). Like, traefik.

## Health check

Default Rails health check at `/up`. If you need.
