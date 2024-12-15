# MySQL-HA

MySQLの冗長化を練習するためのプロジェクトです。

## Setup

```
docker compose build --no-cache && docker-compose up -d

docker exec -it my1 /bin/bash

cd /scripts/

./init/setup.sh
```
