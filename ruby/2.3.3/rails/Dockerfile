FROM ruby:2.3.3
COPY setup.sh /setup.sh
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3 libsqlite3-dev memcached
RUN mkdir /myapp
WORKDIR /myapp
ENTRYPOINT ["sh", "/setup.sh"]
