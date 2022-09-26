## Deploying

1. `fly volumes create data --app radio-012a --size 2`
2. `fly secrets set MYSQL_PASSWORD=`
3. `fly secrets set MYSQL_ROOT_PASSWORD=`
4. `fly deploy`

## After restarting

- Upload a new media file (journey_to_the_far_lands.mp3) and restart broadcasting
