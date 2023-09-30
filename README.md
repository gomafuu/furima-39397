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
## usersテーブル

| Column               | Type       | Options                    |
| -------------------- | ---------- | -------------------------- |
| nickname             | string     | null: false                |
| email                | string     | null: false, unique: true  |
| encrypted_password   | string     | null: false                |
| name_last            | string     | null: false                |
| name_first           | string     | null: false                |
| kana_last            | string     | null: false                |
| kana_first           | string     | null: false                |
| birthday             | date       | null: false                |

- has_many :items
- has_many :orders


## itemsテーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| title           | string     | null: false                  |
| detail          | text       | null: false                  |
| category_id     | integer    | null: false                  |
| condition_id    | integer    | null: false                  |
| delivery_id     | integer    | null: false                  |
| area_id         | integer    | null: false                  |
| deliverydate_id | integer    | null: false                  |
| price           | integer    | null: false                  |
| user            | references | null: false,foreign_key: true|
| order           | references | null: false,foreign_key: true|

- belongs_to :user
- belongs_to :order


## ordersテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| post_number   | string     | null: false                  |
| area_id       | integer    | null: false                  |
| city          | string     | null: false                  |
| addresses     | string     | null: false                  |
| bilding       | string     |                              |
| phone         | string     | null: false                  |
| purchase      | string     | null: false,foreign_key: true|


- belongs_to :purchase

## purchasesテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| user         | string     | null: false,foreign_key: true|
| item         | string     | null: false,foreign_key: true|

- belongs_to :orders

