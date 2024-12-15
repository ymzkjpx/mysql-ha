#!/bin/bash

MYSQL_DATABASE="my_test"
TABLE="users"

SQL="SELECT COUNT(*) from $MYSQL_DATABASE.$TABLE;"

# MySQLに接続してSQLを実行
echo "$SQL" | mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" 2>/dev/null
