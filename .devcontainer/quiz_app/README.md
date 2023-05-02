## 画像クイズアプリ
加工された画像をクイズ形式で出題するアプリです。

## 環境構築

```sh
# リポジトリからプロジェクトをクローン
$ git clone https://github.com/githuno/quicq.git

# （vscodeで立ち上げ）.devcontainerと同一階層でvscode開く
$ cd xxxx
$ code .
<>から「reopen...」

# （Dockerコマンドで立ち上げ）.decontainerの一階層下に移動してcmpose up
$ cd xxxx/.devcontainer
$ docker-compose up -d

# コンテナ立ち上げ後、コンテナ内のapp/quiz_appに移動
$ cd app/quiz_app

# マイグレート
$ rails db:migrate

# シードの実行
$ rails db:seed

# サーバー起動（コンテナ外からアクセスできるようにポート番号とipアドレス指定）
$ rails s -p 3000 -b '0.0.0.0'

```