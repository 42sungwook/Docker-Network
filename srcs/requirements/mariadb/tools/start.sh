#!/bin/sh

if [ ! -e "/run/mysqld/mysqld.sock" ]; then
		#https://mariadb.com/kb/en/mariadb-install-db/
		#mariadb-install-db initializes the MariaDB data directory and creates the system tables in the mysql database, if they do not exist
		#시스템 테이블 설치 안하면
		#mysqld_safe Starting mariadbd daemon with databases from /var/lib/mysql
		mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
		mkdir -p /run/mysqld
		mysqld &

		#https://stackoverflow.com/questions/25503412/how-do-i-know-when-my-docker-mysql-container-is-up-and-mysql-is-ready-for-taking
		while ! mysqladmin ping; do
				sleep 1
		done

		# root 사용자 암호 설정
		mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"
		mysql -uroot -p"$MARIADB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"
		mysql -uroot -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
		mysql -uroot -p"$MARIADB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
		mysqladmin -uroot -p"$MARIADB_ROOT_PASSWORD" shutdown
fi

exec mysqld
