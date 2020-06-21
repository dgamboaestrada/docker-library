#!/bin/bash
if [ -z $RAILS_ENV ]; then
    APP_ENV=development
else
    APP_ENV=$RAILS_ENV
fi
if [ -z $PORT ]; then
    PORT=3000
fi
if [ -z $DB_HOST ]; then
    DB_HOST=127.0.0.1
fi
if [ -z $DB_PORT ]; then
    DB_PORT=5432
fi
echo ">>>>>>>>>> INFO: Default environmnents vars: RAILS_ENV: $RAILS_ENV, PORT: $PORT, DB_HOST: $DB_HOST, DB_PORT: $DB_PORT, BUNDLE_PATH: $BUNDLE_PATH"

cd /myapp
# Delete server pid if exist.
set -e
if [ -f ./tmp/pids/server.pid ]; then
    echo ">>>>>>>>>> Deleting pid server..."
    rm ./tmp/pids/server.pid
fi

# Install dependencies.
echo ">>>>>>>>>> Instaling gems..."
bundle install
echo ">>>>>>>>>> Instaling yarn dependencies..."
yarn install

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
exec "$@"
