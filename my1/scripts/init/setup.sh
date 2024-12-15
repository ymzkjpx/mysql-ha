#!/bin/bash

set -eu

# エラー時にメッセージを表示して終了
trap 'echo "Error occurred at line $LINENO while processing $f"; exit 1' ERR

# 初期スクリプトディレクトリを設定
INIT_DIR="/scripts/init/"

# init_*.sh ファイルを順番に処理
echo "Starting to process scripts in $INIT_DIR"
for f in $(find "$INIT_DIR" -maxdepth 1 -name "init_*" | sort); do
    echo "Processing $f..."
    case "$f" in
        *.sh)
            echo "Running shell script: $f"
            . "$f"  # 現在のシェルで実行
            ;;
        *.sql)
            echo "Running SQL script: $f"
            mysql --user=root < "$f"
            ;;
        *.sql.gz)
            echo "Running gzipped SQL script: $f"
            gunzip < "$f" | mysql --user=root
            ;;
        *)
            echo "Ignoring unknown file type: $f"
            ;;
    esac
    echo "Finished processing $f"
    echo
done

echo "All scripts processed successfully."
