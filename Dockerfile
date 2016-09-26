FROM alpine:3.4

MAINTAINER Diego Castro <castroc.diego@gmail.com>

RUN apk add --no-cache \
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
    php5-dom

RUN echo ServerName 'local.dev' >> /etc/apache2/conf.d/httpd.conf

RUN echo LoadModule rewrite_module modules/mod_rewrite.so >> /etc/apache2/conf.d/rewrite.conf

RUN sed -i '262s/AllowOverride None/AllowOverride All/' /etc/apache2/httpd.conf

RUN mkdir -p /run/apache2

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]