FROM alpine:edge

MAINTAINER Diego Castro <castroc.diego@gmail.com>

RUN apk add --no-cache \
    make \
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
    php5-exif \
    php5-xdebug

# Fix apache warning about ServerName
RUN echo ServerName 'local.dev' >> /etc/apache2/conf.d/httpd.conf

# Activate mod_rewrite for apache
RUN echo LoadModule rewrite_module modules/mod_rewrite.so >> /etc/apache2/conf.d/rewrite.conf

# Allow .htaccess
RUN sed -i '262s/AllowOverride None/AllowOverride All/' /etc/apache2/httpd.conf

# Apache as local user
RUN sed -i 's/User apache/User dev/' /etc/apache2/httpd.conf
RUN sed -i 's/Group apache/Group dev/' /etc/apache2/httpd.conf

# Fix apache error for not having a pid
RUN mkdir -p /run/apache2

# Apache gets grumpy about PID files pre-existing
RUN rm -f /var/run/apache2/apache2.pid && rm -f /run/apache2/apache2.pid

COPY local.ini /etc/php5/conf.d

RUN adduser -u 1000 -D -s /bin/ash dev

WORKDIR /var/www/localhost/htdocs

EXPOSE 22 80

CMD ["httpd", "-DFOREGROUND"]