ARG VERSION=2

FROM caddy:${VERSION}-builder AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${VERSION}

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
