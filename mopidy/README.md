## Deploying

1. Set secrets for MOPIDY_ICECAST_PASSWORD and TAILSCALE_AUTHKEY
2. Add 1gb volume `mopidy_data`
3. Replace the music path in `deploy.sh` with your own.
4. Change the app name in fly.toml
4. Replace the ip with your public app URL in mopidy.conf
4. `./deploy.sh`
