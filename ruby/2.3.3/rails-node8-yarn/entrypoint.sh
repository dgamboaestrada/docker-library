#!/bin/bash
if [ -z $RAILS_ENV ]; then
    APP_ENV=development
else
    APP_ENV=$RAILS_ENV
fi
if [ -z $PORT ]; then
    PORT=3000
fi
if [ ! "$(ls -A /myapp)" ]; then
    gem install rails
    rails new /myapp -f
fi
cd /myapp

# Delete server pid if exist.
set -e
if [ -f /myapp/tmp/pids/server.pid ]; then
  rm /myapp/tmp/pids/server.pid
fi

# Install dependencies.
bundle install
yarn install

# Run migration fo test environment.
if [ "$APP_ENV" != "production" ]; then
    export RAILS_ENV=test;
    bundle exec rake db:create
    bundle exec rake db:migrate
fi

# Run migration.
export RAILS_ENV=$APP_ENV
bundle exec rake db:create
bundle exec rake db:migrate

# Compiles webpack bundles if has the webpacker gem.
if grep -q "webpacker" Gemfile; then
    bundle exec rake webpacker:clobber
    bundle exec rake webpacker:compile
fi

# Run the server.
bundle exec rails server -p $PORT -b 0.0.0.0
exec "$@"
