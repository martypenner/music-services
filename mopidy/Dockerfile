FROM wernight/mopidy:latest

USER root
ENV MOPIDY_ICECAST_PASSWORD=test

# DO THIS EARLY SO WE GET GOOD CACHING.
# This adds like 7GB to the image on my machine.
COPY music/ /var/lib/mopidy/music

# tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.gpg | apt-key add -
RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.list | tee /etc/apt/sources.list.d/tailscale.list
RUN apt update && apt upgrade -y && apt install -y tailscale

RUN mkdir -p /var/lib/mopidy/music /var/lib/mopidy/data /app

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

COPY mopidy.conf /var/lib/mopidy/mopidy.conf

ENTRYPOINT ["/app/start.sh"]
