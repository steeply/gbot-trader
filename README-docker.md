Docker readme
=============

# Dependences

Please install docker and docker compose first:

- Docker

    ```bash
    curl -sSL https://get.docker.com/ | sh
    ```

- docker-compose:

    Broswe to https://github.com/docker/compose/releases and find latest release install instructions, it will be something like:

    ```bash
    curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ```

# Insallation
Then simply build docker image (git pull gbot, cd /to/the/downloaded/path):

```
docker-compose build --pull
```

Edit .env file:

```
cp .env-sample .env
vim .env
```

# Start

```
docker-compose up -d gbot_trader
docker-compose logs -f gbot_trader
```

Now service is up and running, please return to the main README.

# Upgrade 

When new version of gbot_trader would be released, do:

```
cd /path/to/the/gbot_trader
git pull && \
docker-compose build --pull && \
docker-compose stop gbot_trader && \
docker-compose rm -f gbot_trader && \
docker-compuse logs -f gbot_trader
```
