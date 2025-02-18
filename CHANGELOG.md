# main

* Drop Flowdock support (it's not working anymore)
* Remove `rack-ssl` gem
* Remove `rack-ssl-enforcer` gem
* Add default rails health check at `/up`
* Drop `/health/readiness` in favor `/up`
* Drop `/health/liveness` in favor `/up`
* It should be safe just remove `PORT` env from any configurations.
* You should not set `RACK_ENV` env if you don't know for what. It should be removed from any configurations.
* `MAX_THREADS` env was removed. Use default rails `RAILS_MAX_THREADS` and `RAILS_MIN_THREADS`.
* Add `RAILS_LOG_LEVEL` env with default `info`.
* `RAILS_LOG_TO_STDOUT` env was drop without replacement. This is default behavior now.
* Add `tzinfo-data` gem
* Update Rails to 7.2.2.1
* Update Rails to 7.1.5.1
* Update RubyGems to 3.6.3 & Bundler to 2.6.3
* Update Ruby to 3.3.7
* Update Rails to 7.0.8.7
* `bundle lock --normalize-platforms`
* Update RubyGems to 3.6.2 & Bundler to 2.6.2
* Update RubyGems to 3.6.1 & Bundler to 2.6.1
* Replace poltergeist with selenium for tests
* Run tests on CI for Ruby 3.1, 3.2 and 3.3
* Update Ruby to 3.3.6
* Update Ruby to 3.2.6
* Improve bundler platforms support (for faster docker image builds)
* Migrate to zeitwerk
* Default port was changed from 8080 to 3000 (sync with rails defaults)
* Bundler: enable CHECKSUMS
* Update RubyGems to 3.5.23 & Bundler to 2.5.23
* Update Rails to 6.1.7.10
* Update RubyGems to 3.5.22 & Bundler to 2.5.22
* Update Ruby to 3.1.6 & Rails to 6.0.6.1
* Enable bootsnap
* Update Rails to 5.2.8.1
* Update Rails to 5.1.7
* Update RubyGems to 3.4.22
* Update Bundler to 2.4.22
* Update Ruby to 2.7.8
