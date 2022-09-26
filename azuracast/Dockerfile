FROM azuracast/azuracast:stable

# tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Store the default track somewhere
COPY starting_track.mp3 /starting_track.mp3

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
