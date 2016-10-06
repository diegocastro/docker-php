#!/usr/bin/env sh

chown -R diego:www-data /var/www/localhost/htdocs & chmod -R 775 /var/www/localhost/htdocs

httpd -DFOREGROUND