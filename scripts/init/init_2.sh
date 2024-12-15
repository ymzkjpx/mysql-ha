#!/bin/bash
set -e

# MySQLの起動
systemctl enable mysqld
systemctl start mysqld

