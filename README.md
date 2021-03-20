# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# プリケーション名
 kuriyosi

 # アプリケーション概要
  商品登録・編集・削除、
  新着情報登録・編集・削除、
  店舗情報の登録・編集
  お買い物シュミレーション

# URL
https://kuriyosi.herokuapp.com/

# テーブル設計

## userテーブル
column Type Options
| Column             | Type       | Options                   |
| -------------------|----------- |---------------------------|
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |

### association

## itemテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
|  name              | string     | null: false                    |
|  content           | text       | null: false                    |
|  price             | integer    | null: false                    |
|  category_id       | integer    | null: false                    |
|  season_id         | integer    | null: false                    |
|  sale_id           | integer    | null: false                    |
|  user              | references | null: false, foreign_key: true |

### association
belongs_to :user
has_many :images

## newsテーブル

| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
|  title             | string     | null: false                    |
|  content           | text       | null: false                    |
|  user              | references | null: false, foreign_key: true |

### association
belongs_to :user
has_many :images

## storeテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
|  name              | string     | null: false                    |
|  phone             | string     | null: false                    |
|  address           | string     | null: false                    |
|  open_time         | string     | null: false                    |
|  close_time        | string     | null: false                    |
|  holiday_id        | integer    | null: false                    |

has_many :images
