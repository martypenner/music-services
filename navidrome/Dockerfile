# tailscale setup
FROM alpine:latest as tailscale
WORKDIR /app
ENV TSFILE=tailscale_1.30.2_amd64.tgz
RUN wget https://pkgs.tailscale.com/stable/${TSFILE} && tar xzf ${TSFILE} --strip-components=1

# runner
FROM deluan/navidrome:latest as builder

# DO THIS EARLY SO WE GET GOOD CACHING.
# This adds like 7GB to the image on my machine.
COPY music/ /music

WORKDIR /app
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

RUN apk update && apk add ca-certificates iptables ip6tables && rm -rf /var/cache/apk/*

# Copy binary to production image
COPY --from=tailscale /app/tailscaled /app/tailscaled
COPY --from=tailscale /app/tailscale /app/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale /data

# Run on container startup.
ENTRYPOINT ["/app/start.sh"]
