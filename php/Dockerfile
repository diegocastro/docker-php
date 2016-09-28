FROM alpine:3.4

MAINTAINER Diego Castro <castroc.diego@gmail.com>

RUN apk add --no-cache \
    curl \
    apache2 \
    php5-apache2 \
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

# Fix apache warning about ServerName
RUN echo ServerName 'local.dev' >> /etc/apache2/conf.d/httpd.conf

# Activate mod_rewrite for apache
RUN echo LoadModule rewrite_module modules/mod_rewrite.so >> /etc/apache2/conf.d/rewrite.conf

# Allow .htaccess
RUN sed -i '262s/AllowOverride None/AllowOverride All/' /etc/apache2/httpd.conf

# Fix apache error for not having a pid
RUN mkdir -p /run/apache2

# Install composer
RUN curl -sSO https://getcomposer.org/composer.phar && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

COPY local.ini /etc/php5/conf.d

EXPOSE 22 80

CMD ["httpd", "-DFOREGROUND"]