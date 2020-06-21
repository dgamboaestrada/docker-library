FROM ruby:2.7.1

# Install yarn, node 8.x and rails dependencies.
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-utils \
        build-essential \
        libpq-dev \
        cron \
        nodejs \
        netcat \
        yarn && \
        rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp

WORKDIR /myapp

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]
