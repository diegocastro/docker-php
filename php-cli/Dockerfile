FROM alpine:3.4

MAINTAINER Diego Castro <castroc.diego@gmail.com>

RUN apk add --no-cache \
    curl \
    php5-apcu \
    php5-curl \
    php5-gd \
    php5-iconv \
    php5-imagick \
    php5-json \
    php5-intl \
    php5-mcrypt \
    php5-mysql \
    php5-opcache \
    php5-openssl \
    php5-pdo \
    php5-pdo_mysql \
    php5-mysqli \
    php5-xml \
    php5-zlib \
    php5-dom \
    php5-phar \
    php5-ctype \
    php5-posix \
    php5-exif

# Install composer
# RUN curl -sSO https://getcomposer.org/composer.phar && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer && rm -rf /tmp/composer-setup.php

COPY local.ini /etc/php5/conf.d

RUN adduser -u 1000 -D -s /bin/ash diego

WORKDIR /var/www/localhost/htdocs

EXPOSE 22 80

CMD ["php", "-a"]