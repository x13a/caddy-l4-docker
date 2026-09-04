ARG CADDY_VERSION
FROM dhi.io/golang:1-dev AS builder

RUN CGO_ENABLED=0 go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

WORKDIR /build
ARG CADDY_VERSION
ARG L4_VERSION
RUN xcaddy build v${CADDY_VERSION} \
    --with github.com/mholt/caddy-l4@v${L4_VERSION}

FROM dhi.io/caddy:${CADDY_VERSION:-2}
COPY --from=builder /build/caddy /usr/local/bin/caddy
