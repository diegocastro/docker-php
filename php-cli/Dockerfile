FROM alpine:3.4

MAINTAINER Diego Castro <castroc.diego@gmail.com>

RUN apk add --no-cache \
    curl \
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
RUN curl -sSO https://getcomposer.org/composer.phar && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN mkdir /www

WORKDIR /www

VOLUME ["/www"]

CMD ["php", "-a"]