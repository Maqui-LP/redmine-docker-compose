#!/usr/bin/env sh

bundle exec rake generate_secret_token
exec "$@"

# bundle exec rake redmine:load_default_data RAILS_ENV="${RAILS_ENV}" REDMINE_LANG=en
