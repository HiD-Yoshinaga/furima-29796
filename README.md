# README

## 概要
テックキャンプの最終課題にて作成したアプリケーションを紹介します。
アプリケーション情報
アプリケーション概要
フリーマーケットのアプリケーションを作成しました。

## 接続先情報
<a href="url">
http://54.168.218.39/
</a>
<dl>
  <dt>ID/Pass</dt>
  <dd>ID: admin</dd>
  <dd>Pass: password</dd>
  <dt>テスト用アカウント等</dt>
  <dd>購入者用
      メールアドレス: buy@buy.com
      パスワード: passw0rd
      購入用カード情報
      番号：4242424242424242
      期限：Thu Dec 24 2020 00:00:00 GMT+0900 (日本標準時)
      セキュリティコード：123</dd>
  <dt>出品者用</dt>
  <dd>メールアドレス名: sell@sell.com
      パスワード: passw0rd</dd>
</dl>

## Githubリポジトリ
<a href="url">
https://github.com/HiD-Yoshinaga/furima-29796
</a>

## 開発状況
<dl>
  <dt>開発環境</dt>
  <dd>HTML/CSS/Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code</dd>
  <dt>開発期間と平均作業時間</dt>
  <dd>開発期間：9/16~10/9（24日間）</dd>
  <dd>1日あたりの平均作業時間：6</dd>
  <dd>合計：144時間</dd>
</dl>

## 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品確認後、ログアウト処理をお願いします。

## オリジナル追加実装
テックキャンプで定められた要件以外に、以下の点についてアプリケーションの改善を行いました。
アプリケーションの課題と解決策
以下のシートをご覧ください。アプリケーションのペルソナが持つ課題を洗い出し、そして解決策となる追加実装の仕様を洗い出しました。

<a href="url">https://docs.google.com/spreadsheets/d/1QNI59PrJGMf8q8cR2pgKznqVAICBk3AuAGMgqww4MhY/edit#gid=1006772752
</a>

フリーマーケットのサービスであるにも関わらず、出品アイテムの状態を確認する機能がないことが課題であると考えました。なぜなら、中古アイテムが存在することが前提のサービスなので、出品者は商品の状態を正確に伝えられ、購入者は商品の状態を正確に把握できる状態でなければ、有効なサービスとして利用してもらえないと考えたからです。
### 実装内容
洗い出した課題の中から、出品者の商品登録・編集機能、購入者のコメント機能について追加実装を行いました。それぞれの仕様を紹介します。

## 最終課題を経ての気づき
### 工夫した点
ユーザー目線で必要な機能と、最小限の機能からリリースできるように考え進めたことです。
出品者視点として、出品物の正確な情報を登録できるよう画像登録機能の追加実装を行いました。購入者視点として、不明点を質問できる機能が必要と考え、コメント機能を実装しました。
ユーザービリティを考慮する上で、他の機能追加も必要とは感じてはいますが、ビジネスとしてサービスをリリースすることは必須と考え、EC2へデプロイと簡易に展開するための自動デプロイ機能を優先して実装しました。
### 苦労した点
追加実装について苦労した点は、EC2への自動デプロイ機能の設定をする際に苦労しました。
ローカルで正常に稼働していれば、EC2上でも正常に動くだろうと考えていたのですが、EC2の環境ではエラーが多く発生し修正変更が必要でした。原因は、他の追加実装でインストールした複数のgemで、それぞれに適したコードや変更を加える必要がありました。
カリキュラムで学ばなかった部分が多く、インターネット検索や設定に非常に苦労しましたが大変勉強になりました。プログラミング言語の理解だけでなく、各インフラの理解も重要なことを再認識できました。


# テーブル設計

##  usersテーブル

|      Column        |    Type    |             Options             |
| ------------------ | ---------- | ------------------------------- |
| nickname           | string     | null: false                     |
| email              | string     | null: false, unipue: true       |
| encrypted_password | string     | null: false                     |
| first_name         | string     | null: false                     |
| family_name        | string     | null: false                     |
| first_name_kana    | string     | null: false                     |
| family_name_kana   | string     | null: false                     |
| birthday           | date       | null: false                     |

### Association

- has_many : items
- has_many : orders

## items テーブル

|       Column       |    Type    |             Options             |
| ------------------ | ---------- | ------------------------------- |
| item_name          | string     | null: false                     |
| item_info          | text       | null: false                     |
| item_price         | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| item_category_id   | integer    | null: false                     |
| item_condition_id  | integer    | null: false                     |
| shipping_fee_id    | integer    | null: false                     |
| ship_from_id       | integer    | null: false                     |
| day_to_ship_id     | integer    | null: false                     |

### Association

- belongs_to : user
- has_one : order

## orders テーブル

|    Column     |    Type    |            Options             |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one : orders_info
- belongs_to :item
- belongs_to :user

## order_infos テーブル

|       Column        |    Type    |            Options             |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| postcode            | string     | null: false                    |
| shipping_address_id | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false, unipue: true      |

### Association

- belongs_to :order

## messages テーブル

|       Column        |    Type    |            Options             |
| ------------------- | ---------- | ------------------------------ |
| text                | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
