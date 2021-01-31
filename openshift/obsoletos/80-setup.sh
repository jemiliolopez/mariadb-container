mysql -uroot -e "UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root'; FLUSH PRIVILEGES"

export MYSQL_PWD="${MYSQL_ROOT_PASSWORD}"


mysql -uroot -e "DELETE FROM mysql.user WHERE User=''"
mysql -uroot -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -uroot -e "DROP DATABASE IF EXISTS test"
mysql -uroot -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"
# mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}"
# mysql -uroot -e "CREATE USER  IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'"
# mysql -uroot -e "GRANT ALL ON  ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost'"
mysql -uroot -e "FLUSH PRIVILEGES"

