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
|  content           | string     | null: false                    |
|  price             | integer    | null: false                    |
|  category_id       | integer    | null: false                    |
|  season_id         | integer    | null: false                    |
|  sale_id           | integer    | null: false                    |
|  user              | references | null: false, foreign_key: true |

### association
belongs_to :user
