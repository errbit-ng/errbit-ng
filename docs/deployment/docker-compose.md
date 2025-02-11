# Deploy with Docker Compose

Errbit-NG provides official [Docker](https://www.docker.com/) images to make
Docker deployment easy. You can pass all of
[Errbit-NG's configuration](/docs/configuration.md) to the Docker container.

When running Errbit using `docker run` you must specify a MONGO_URL. If you're
running in a production environment, you should also specify
RACK_ENV=production and SECRET_KEY_BASE=some-secret-key.

If you don't already have one, you can generate a suitable SECRET_KEY_BASE
with:

```bash
docker run --rm errbit/errbit bundle exec rake secret
```

## Examples

### Tiny as possible instance

If you wanna try Errbit-NG, this is good example.

```yaml
services:
  errbit:
    image: "docker.io/biow0lf/errbit-ng:main"
    container_name: "errbit"
    restart: "unless-stopped"
    environment:
      MONGO_URL: "mongodb://errbit_mongodb:27017/errbit_production"
      SECRET_KEY_BASE: "<rails secret>"
      RAILS_MAX_THREADS: "1"
      RAILS_MIN_THREADS: "1"
```

### Small instance as I run in production

```yaml
services:
  errbit:
    image: "docker.io/biow0lf/errbit-ng:main"
    container_name: "errbit"
    restart: "unless-stopped"
    environment:
      MONGO_URL: "mongodb://errbit_mongodb:27017/errbit_production"
      SECRET_KEY_BASE: "<rails secret>"
      RAILS_MAX_THREADS: "2"
      RAILS_MIN_THREADS: "2"
```

### Huge instance if you need

```yaml
services:
  errbit:
    image: "docker.io/biow0lf/errbit-ng:main"
    container_name: "errbit"
    restart: "unless-stopped"
    environment:
      MONGO_URL: "mongodb://errbit_mongodb:27017/errbit_production"
      SECRET_KEY_BASE: "<rails secret>"
      RAILS_MAX_THREADS: "2"
      RAILS_MIN_THREADS: "2"
      WEB_CONCURRENCY: "2"
```

## Standalone Errbit App

Assuming you have a mongo host available, you can run errbit using `docker
run`, exposing its HTTP interface on port 8080:
```bash
docker run \
  -e "RACK_ENV=production" \
  -e "MONGO_URL=mongodb://my-mongo-host" \
  -e "SECRET_KEY_BASE=my$ecre7key123" \
  -p 8080:8080 \
  errbit/errbit:latest
```

Now run `bundle exec rake errbit:bootstrap` to bootstrap the Errbit db within an ephemeral
Docker container:

```bash
docker run \
  --rm \
  -e "RACK_ENV=production" \
  -e "MONGO_URL=mongodb://my-mongo-host" \
  errbit/errbit:latest \
  bundle exec rake errbit:bootstrap
```

## Errbit + Dependencies via Docker Compose

Docker compose can take care of starting up a mongo container along with the
Errbit application container and linking the two containers together:

```bash
docker-compose up -e "SECRET_KEY_BASE=my$ecre7key123"
```

Now run `bundle exec rake errbit:bootstrap` to bootstrap the Errbit db within an ephemeral
Docker container:

```bash
docker exec errbit_errbit_1 bundle exec rake errbit:bootstrap
```
