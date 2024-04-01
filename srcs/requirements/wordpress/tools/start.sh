#!/bin/bash

if [ ! -e "/var/www/html/wp-config.php" ]; then
	mkdir -p /var/www/html
	cd /var/www/html
	wp core download --allow-root
fi

/usr/sbin/php-fpm81 -F