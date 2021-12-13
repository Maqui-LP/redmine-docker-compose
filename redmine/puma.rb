#!/usr/bin/env puma

application_path = '/usr/src/redmine'
directory application_path
environment 'production'
pidfile "#{application_path}/pids/puma.pid"
state_path "#{application_path}/pids/puma.state"
bind "tcp:0.0.0.0:3000"
# bind 'unix:///usr/src/redmine/sockets/puma.sock'