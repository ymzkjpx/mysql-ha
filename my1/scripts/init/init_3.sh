#!/bin/bash

set -eu

# 初期SQLスクリプトディレクトリを設定
INIT_SQL_DIR="/scripts/init/sql"

# ユーザー設定用SQLを実行
# 最初にパスワードなしで実行
mysql -uroot < "$INIT_SQL_DIR/init_user.sql"
# エラーが発生した場合、パスワードを使って再試行
if [ $? -ne 0 ]; then
    echo "Password required, retrying with -p flag"
    mysql -uroot -p$MYSQL_ROOT_PASSWORD < "$INIT_SQL_DIR/init_user.sql"
fi

# init_*.sh ファイルを順番に処理
echo "Starting to process SQL in $INIT_SQL_DIR"
for f in $(find "$INIT_SQL_DIR" -maxdepth 1 -name "initsql_*" | sort); do
    echo "Processing SQL $f..."
    case "$f" in
        *.sql)
            echo "Running SQL script: $f"
            mysql -uroot -p$MYSQL_ROOT_PASSWORD < "$f"
            ;;
    esac
    echo "Finished SQL $f"
    echo
done

# 完了確認用SQLスクリプト
mysql -uroot -p$MYSQL_ROOT_PASSWORD < "$INIT_SQL_DIR/init_finish_check.sql"

