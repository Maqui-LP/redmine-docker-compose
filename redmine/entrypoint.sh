#!/usr/bin/env bash

bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV="${RAILS_ENV}"
bundle exec rake redmine:load_default_data RAILS_ENV="${RAILS_ENV}" REDMINE_LANG=en
bundle exec puma -C config/puma.rb