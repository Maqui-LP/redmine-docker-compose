#!/usr/bin/env puma

application_path = '/usr/src/redmine'
directory '/usr/src/redmine'
environment 'production'
pidfile '/usr/src/redmine/tmp/pids/puma.pid'
state_path '/usr/src/redmine/tmp/pids/puma.state'
bind 'unix:///usr/src/redmine/tmp/sockets/puma.sock'