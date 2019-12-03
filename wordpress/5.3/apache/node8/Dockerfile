FROM wordpress:5.3
COPY php.ini /usr/local/etc/php/conf.d/

RUN apt-get update && \
    apt-get install -y libzip-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev curl git vim && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  &&  \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    docker-php-ext-install gd && \
    docker-php-ext-install zip && \
    docker-php-ext-install pdo_mysql

# Install composer.
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

# Install wp-cli
RUN cd ~ && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    echo "alias wp='wp --allow-root'" >> /root/.bashrc && \
    curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/v1.5.1/utils/wp-completion.bash && \
    echo "source ~/wp-completion.bash" >> /root/.bashrc

# Install WordPress Coding Standards for PHP_CodeSniffer
RUN cd ~ && \
    composer create-project wp-coding-standards/wpcs --no-dev --no-interaction && \
    echo 'export PATH=~/wpcs/vendor/bin:$PATH' >> /root/.bashrc && \
    cd ~/wpcs/ && \
    composer update

# Install PHPUnit
RUN composer global require phpunit/phpunit ^7 && \
    echo 'export PATH=~/.composer/vendor/bin:$PATH' >> /root/.bashrc

# Install yarn, node 8.x, gulp and bower.
RUN cd ~ && \
    apt-get update && \
    apt-get install -y yarn gnupg npm && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
	npm install gulp-cli -g && npm install gulp -D && npm install gulp-watch && \
    npm install -g bower

