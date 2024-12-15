#!/bin/bash

MYSQL_DATABASE="my_test"

# ランダムな名前とメールを生成
NAMES=("Alice Smith" "Bob Johnson" "Charlie Brown" "Diana Prince" "Evan Wright")
RANDOM_NAME=${NAMES[$RANDOM % ${#NAMES[@]}]}
RANDOM_EMAIL="${RANDOM_NAME// /_}@example.com"

# SQL文を生成
SQL="INSERT INTO users (name, email) VALUES ('$RANDOM_NAME', '$RANDOM_EMAIL');"

# MySQLに接続してSQLを実行
echo "$SQL" | mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" 2>/dev/null

echo "Inserted: $RANDOM_NAME with email $RANDOM_EMAIL"

