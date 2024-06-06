## 環境

| 言語・フレームワーク      | バージョン |
| --------------------- | ---------- |
| ruby                  | 3.1.5      |
| rails                 | 7.0.8.3    |
| MySQL                 | 14.14      |


## 開発環境構築

docker compose build
docker-compose run --rm web rails dev:cache
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrare
docker-compose run --rm web rails db:seed
docker-compose up


### 動作確認

http://localhost:3001/ にアクセスできるか確認