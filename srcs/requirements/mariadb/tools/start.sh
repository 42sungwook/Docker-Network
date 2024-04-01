#!/bin/sh

# init MariaDB
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # MariaDB root password
    # mysqladmin --user=root password '새로운암호'
fi

# MariaDB execute
exec /usr/bin/mysqld_safe --datadir=/var/lib/mysql