#!/usr/bin/env sh

chown -R 1000:www-data /var/www/localhost/htdocs & chmod -R 775 /var/www/localhost/htdocs

httpd -DFOREGROUND