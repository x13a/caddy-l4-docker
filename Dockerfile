FROM dhi.io/caddy:2-dev AS builder

RUN apt-get update && apt-get install -y --no-install-recommends golang && \
    rm -rf /var/lib/apt/lists/*

RUN CGO_ENABLED=0 GOBIN=/usr/local/bin go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

WORKDIR /build
ARG CADDY_VERSION
RUN xcaddy build ${CADDY_VERSION} \
    --with github.com/mholt/caddy-l4

FROM dhi.io/caddy:2
COPY --from=builder /build/caddy /usr/bin/caddy
