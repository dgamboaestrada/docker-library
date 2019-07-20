#!/bin/bash
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

echo "info: Default environmnents vars: RAILS_ENV: $RAILS_ENV, PORT: $PORT, RDS_HOST: $RDS_HOST, RDS_PORT: $RDS_PORT, BUNDLE_PATH: $BUNDLE_PATH"

# It's created a new proyect if not existe a proyect.
if [ ! "$(ls -A /myapp)" ]; then
    echo "Creating a new rails proyect..."
    gem install rails
    rails new /myapp -f
fi
cd /myapp

# Delete server pid if exist.
set -e
if [ -f /myapp/tmp/pids/server.pid ]; then
    echo "Deleting pid server..."
    rm /myapp/tmp/pids/server.pid
fi

# Install dependencies.
echo "Instaling gems..."
bundle install
echo "Instaling yarn dependencies..."
yarn install

if [ "$APP_ENV" == "development" ]; then
    # Compiles webpack bundles if has the webpacker gem.
    if grep -q "webpacker" Gemfile; then
        echo "Webpack compiling..."
        bundle exec rake webpacker:clobber
        bundle exec rake webpacker:compile
    fi
fi

#
if nc -vz $RDS_HOST $RDS_PORT; then
    # Run migration fo test environment.
    if [ "$APP_ENV" == "development" ]; then
        export RAILS_ENV=test;
        bundle exec rake db:create
        bundle exec rake db:migrate
    fi

    # Run migration.
    export RAILS_ENV=$APP_ENV
    if [ "$APP_ENV" == "development" ]; then
        bundle exec rake db:create
    fi
    bundle exec rake db:migrate

    # Run the server.
    bundle exec rails server -p $PORT -b 0.0.0.0
else
    echo "RDS HOST $RDS_HOST with port $RDS_PORT not found."
fi
exec "$@"
