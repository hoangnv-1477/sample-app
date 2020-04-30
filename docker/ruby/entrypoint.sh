#!/bin/bash
set -e

yarn install

bundle install
bundle exec rake db:create
bundle exec rake db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

bundle exec rails server -b 0.0.0.0

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"