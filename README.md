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
  売り上げ実績登録
  売り上げ状態をグラフで確認

# ペルソナ
  商品管理、新着情報管理機能を持ったWebサイト
  販売店を営む人を想定しターゲットとして年齢は40代50代

# ターゲット
  小規模な販売店
  商品情報、キャンペーン情報を配信できる形で作成
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
has_many :sales_item

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

### association
has_many :images

## sales_priceテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
|  price             | integer    | null: false                    |
|  day               | date       | null: false                    |

has_many :sales_items

## sales_itemテーブル
| Column             | Type       | Options                        |
| -------------------|----------- |--------------------------------|
|  item              | references | null: false, foreign_key: true |
|  num               | integer    | null: false                    |

belongs_to :sales_price
belongs_to :item
