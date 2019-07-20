#!/bin/bash
export BUNDLE_PATH=/myapp/vendor/bundle
if [ -z $RAILS_ENV ]; then
    APP_ENV=development
else
    APP_ENV=$RAILS_ENV
fi
if [ -z $PORT ]; then
    PORT=3000
fi
if [ -z $RDS_HOST ]; then
    RDS_HOST=127.0.0.1
fi
if [ -z $RDS_PORT ]; then
    RDS_PORT=5432
fi
if [ -z $SETUP ]; then
    SETUP=true
fi

# It's created a new proyect if not existe a proyect.
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

if $SETUP; then
    # Install dependencies.
    bundle install
    yarn install

    # Compiles webpack bundles if has the webpacker gem.
    if grep -q "webpacker" Gemfile; then
        bundle exec rake webpacker:clobber
        bundle exec rake webpacker:compile
    fi
fi

#
if nc -vz $RDS_HOST $RDS_PORT; then
    # Run migration fo test environment.
    if [ "$APP_ENV" != "production" ]; then
        export RAILS_ENV=test;
        if $SETUP; then
            bundle exec rake db:create
        fi
        bundle exec rake db:migrate
    fi

    # Run migration.
    export RAILS_ENV=$APP_ENV
    if $SETUP; then
        bundle exec rake db:create
    fi
    bundle exec rake db:migrate

    # Run the server.
    bundle exec rails server -p $PORT -b 0.0.0.0
    exec "$@"
fi
