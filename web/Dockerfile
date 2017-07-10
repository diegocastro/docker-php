FROM alpine:3.5

RUN apk add --no-cache tini git vim curl apache2 php5-apache2 php5-json php5-iconv php5-ctype php5-dom php5-xml php5-posix php5-intl php5-opcache php5-pdo_mysql php5-phar php5-openssl php5-curl php5-gd php5-mcrypt php5-zlib php5-soap php5-exif php5-xdebug
# apache2 gets grumpy if the pid folder is not there
RUN mkdir -p /run/apache2
# Run apache as local user
RUN addgroup -g 1000 webdev && \
	adduser -G webdev -u 1000 -s /bin/ash -D webdev && \
	ln -s /usr/bin/php5 /usr/local/bin/php && \
	echo LoadModule rewrite_module modules/mod_rewrite.so >> /etc/apache2/conf.d/rewrite.conf && \
	sed -i '264s/AllowOverride None/AllowOverride All/' /etc/apache2/httpd.conf && \
	sed -i '2s/;//' /etc/php5/conf.d/xdebug.ini && \
	# PHPStorm default docker mappings
	mkdir -p /opt && \
	ln -s /var/www/localhost/htdocs /opt/project

COPY local.conf /etc/apache2/conf.d/
COPY local.ini /etc/php5/conf.d/

# Composer
ENV PATH="/composer/vendor/bin:$PATH" COMPOSER_ALLOW_SUPERUSER=1 COMPOSER_HOME=/composer COMPOSER_VERSION=1.4.2

COPY composer /usr/local/bin/

RUN composer --ansi --version --no-interaction

# PHPCS
RUN curl -f -L -o /usr/local/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
	chmod +x /usr/local/bin/phpcs

# Symfony installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
	chmod +x /usr/local/bin/symfony 

ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 80

WORKDIR /var/www/localhost/htdocs

CMD ["httpd", "-DFOREGROUND"]