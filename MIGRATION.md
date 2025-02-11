# Errbit to Errbit-NG migration guide

## From Errbit main to Errbit-NG 1.0.0

In current moment, errbit-ng should be drop in replacement for errbit.
With few exceptions:

1. Default port (`PORT` env) changed to 3000 (sync with rails defaults) for puma.
2. Default port in docker image is changed to 3000 (sync with rails defaults).
3. It should be safe just remove `PORT` env from any configurations.
4. You should not set `RACK_ENV` env if you don't know for what. It should be removed from any configurations.
5. `MAX_THREADS` env was removed. Use default rails `RAILS_MAX_THREADS`.
6. Add `RAILS_LOG_LEVEL` env with default `info`.
7. `RAILS_LOG_TO_STDOUT` env was drop without replacement. This is default behavior now.
8. Add default rails health check at `/up`.
9. Drop `/health/readiness` in favor `/up`.
10. Drop `/health/liveness` in favor `/up`.
11. Remove `ERRBIT_PROTOCOL` env. Errbit-NG should always run behind reverse-proxy with HTTPS support.
12. Remove `ERRBIT_PORT` env. Errbit-NG always enforce HTTPS. So, you can't set port. It is already 443 and can't be changed.
13. Remove `ERRBIT_ENFORCE_SSL` env. This is new default behaviour.

Deprecations:

* MongoDB 4.0 is reached EOL at 21 Jun 2018. 4.0 support will be removed after first stable and public release of Errbit-NG.
* MongoDB 4.2 is reached EOL at 09 Aug 2019. 4.2 support will be removed after first stable and public release of Errbit-NG.
* MongoDB 4.4 is reached EOL at 25 Jul 2020. 4.4 support will be removed after first stable and public release of Errbit-NG.
* MongoDB 5.0 is reached EOL at 08 Jul 2021. 5.0 support will be removed after first stable and public release of Errbit-NG.
