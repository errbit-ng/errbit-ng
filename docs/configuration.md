# Configuring Errbit-NG

Following the recommendation of [12factor.net](https://12factor.net/config),
Errbit-NG takes all of its configuration from environment variables. You can use
[dotenv](https://github.com/bkeepers/dotenv), which is included in the `Gemfile`,
to fill in any values that you can't or won't supply through the environment.

In order of precedence Errbit-NG uses:

1. Environment variables (for example MY_VALUE=abc bundle exec puma)
2. Values provided in a `.env` file
3. Default values from `.env.default` file

## Configuration Parameters

| Environment variable | Description | Default | Default in container |
|----------------------|-------------|---------|----------------------|
| `RAILS_ENV`          |             |         |                      |
| `PORT`               |             |         |                      |
| `RAILS_MAX_THREADS`  |             |         |                      |
