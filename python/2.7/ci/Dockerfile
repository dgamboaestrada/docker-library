from python:2.7

RUN apt-get update && \
    apt-get install -y netcat git vim postgresql-client rsync && \
    rm -rf /var/lib/apt/lists/*

# Install yarn, node 8.x, gulp and bower.
RUN cd ~ && \
    apt-get update && \
    apt-get install -y yarn gnupg && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    npm install gulp-cli -g && npm install gulp -D && npm install gulp-watch && \
    npm install -g bower

# Install pip dependencies
RUN pip install pipenv vo-fabutils fabric==1.14.1 tox
