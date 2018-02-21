#!/bin/bash
if [ -z $RAILS_ENV ]; then
    RAILS_ENV=development;
fi
if [ ! "$(ls -A /myapp)" ]; then
    gem install rails
    rails new /myapp -f
fi
cd /myapp
RAILS_ENV_HOLD=$RAILS_ENV
export RAILS_ENV=test;
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
export RAILS_ENV=$RAILS_ENV_HOLD
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails server -p 80 -b 0.0.0.0
exec "$@"
