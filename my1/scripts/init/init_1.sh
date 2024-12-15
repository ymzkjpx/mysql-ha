#!/bin/bash

set -eu

# aliasの設定
echo 'alias ll="ls -la"' >> ~/.bashrc 

# dfn install
dnf install -y lsof

# MySQLの設定ファイル
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
chmod 750 /var/lib/mysql
