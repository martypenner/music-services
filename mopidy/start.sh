#!/bin/sh

set -eu

tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=mopidy

sed -i 's@password=placeholder@password='"$MOPIDY_ICECAST_PASSWORD"'@i' /var/lib/mopidy/mopidy.conf
exec mopidy --config /var/lib/mopidy/mopidy.conf
