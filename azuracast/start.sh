#!/bin/sh

set -eu

STATION_DIR=/var/azuracast/stations/$STATION_NAME
MEDIA_DIR=/var/azuracast/stations/$STATION_NAME/media

tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=azuracast

mkdir -p "$MEDIA_DIR" || true
cp -fv /starting_track.mp3 "$MEDIA_DIR"
chown -R azuracast:azuracast "$STATION_DIR"

su azuracast

# Pass through azuracast's entrypoint and command
TINI_SUBREAPER=1 exec tini -- /usr/local/bin/my_init --no-main-command
