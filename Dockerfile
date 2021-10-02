FROM caddy:2.4.5-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin/v2 \
    --with github.com/pteich/caddy-tlsconsul

FROM caddy:2.4.5-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
