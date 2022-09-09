# README
これをもとに環境構築しました。
https://nllllll.com/ruby-on-rails/m1-mac-rails-docker/

サーバーを起動する際
docker-compose up

サーバーを閉じる際
docker-compose down

データベースを作るとき
docker-compose run web rails g model User name:string email:string ....


docker-compose run web ...のように書く
