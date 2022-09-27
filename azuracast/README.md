## Deploying

1. `fly volumes create data --app <your app name> --size 2`
2. `fly secrets set MYSQL_PASSWORD=<password>`
3. `fly secrets set MYSQL_ROOT_PASSWORD=<password>`
4. Change the app name in fly.toml
5. `fly deploy`

## After restarting the instance / redeploying

- Restart broadcasting
