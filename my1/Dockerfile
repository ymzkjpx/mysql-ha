# ベースイメージとしてAlmaLinux 8を使用
FROM almalinux:8.10

# MySQLの環境変数を設定
ENV MYSQL_ROOT_PASSWORD=MyStrongPassword_1234
ENV MYSQL_DATABASE=my_test
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=MyStrongPassword_1234

# # 必要なツールのインストール
RUN dnf install -y \
    https://dev.mysql.com/get/mysql84-community-release-el8-1.noarch.rpm && \
    dnf install -y dnf-plugins-core && \
    dnf config-manager --enable mysql80-community && \
    dnf install -y procps && \
    dnf install -y mysql-server && \
    dnf clean all

# セットアップ用のスクリプトを設置
COPY my1/my.cnf /etc/my.cnf.d/my.cnf
COPY scripts/ /scripts/
RUN chmod +x -R /scripts/

# ポートを公開
EXPOSE 3306

# エントリーポイントを指定
# ENTRYPOINTとCMDはセットで使われる。実質は次を実行している `$ entrypoint.sh mysqld`
CMD ["/sbin/init"]

# # MySQLデータディレクトリの準備（権限設定）
# RUN mkdir -p /var/lib/mysql && \
#     chown -R mysql:mysql /var/lib/mysql

# # MySQL初期設定用のスクリプトをコピー
# COPY my1/init.sql /docker-entrypoint-initdb.d/


# エントリーポイントスクリプトをコンテナにコピー
# COPY my1/entrypoint.sh /entrypoint.sh

# スクリプトに実行権限を付与
# RUN chmod +x /entrypoint.sh

# スクリプトを実行する
# CMD ["/entrypoint.sh"]

# PID 1 として
# CMD ["/sbin/init"]

# MySQLを起動
# CMD ["/usr/sbin/mysqld"]

# MySQL公式のエントリーポイントスクリプトを指定
# COPY my1/docker-entrypoint.sh /docker-entrypoint.sh
# RUN chmod +x /docker-entrypoint.sh
# ENTRYPOINT ["/docker-entrypoint.sh"]
# CMD ["mysqld"]