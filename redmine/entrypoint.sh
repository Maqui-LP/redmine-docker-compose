#!/bin/bash

bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV="${ENV}"
bundle exec rake redmine:load_default_data RAILS_ENV=production REDMINE_LANG=en
puma -C config/puma.rb