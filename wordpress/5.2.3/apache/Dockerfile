FROM wordpress:5.2.3
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

# Install wp-cli
RUN cd ~ && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    echo "alias wp='wp --allow-root'" >> /root/.bashrc && \
    curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/v1.5.1/utils/wp-completion.bash && \
    echo "source ~/wp-completion.bash" >> /root/.bashrc
