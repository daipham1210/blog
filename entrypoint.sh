#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

RAILS_ENV=production rails db:migrate
RAILS_ENV=production bundle exec rails s -b 0.0.0.0