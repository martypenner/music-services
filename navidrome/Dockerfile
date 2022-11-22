# syntax=docker/dockerfile:1.4

FROM deluan/navidrome:latest as builder

COPY --link music/ /music

RUN apk update && apk add --no-cache openrc curl && curl -fsSL https://tailscale.com/install.sh | sh

WORKDIR /app
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Run on container startup.
ENTRYPOINT ["/app/start.sh"]
