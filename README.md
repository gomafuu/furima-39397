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

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| nickname   | string     | null: false          |
| email      | string     | null: false, unique  |
| encryped   | string     | null: false          |
| name_last  | string     | null: false          |
| name_first | string     | null: false          |
| kana_last  | string     | null: false          |
| kana_first | string     | null: false          |
| birthday   | string     | null: false          |

- has_many :items
- has_many :orders


## itemsテーブル

| Column     | Type       | Options                      |
| ---------- | ---------- | ---------------------------- |
| image      | string     | null: false                  |
| title      | string     | null: false                  |
| detail     | text       | null: false                  |
| category   | string     | null: false                  |
| condition  | string     | null: false                  |
| load       | string     | null: false                  |
| area       | string     | null: false                  |
| day        | string     | null: false                  |
| price      | string     | null: false                  |
| users      | references | null: false,foreign_key: true|
| oeders     | references | null: false,foreign_key: true|


- belongs_to :users
- belongs_to :orders


## ordersテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| card_number   | string     | null: false, unique          |
| effective_mon | string     | null: false                  |
| effective_year| string     | null: false                  |
| code          | string     | null: false                  |
| post_number   | string     | null: false                  |
| prefectures   | string     | null: false                  |
| city          | string     | null: false                  |
| addresses     | string     | null: false                  |
| bilding       | string     |                              |
| phone         | string     | null: false                  |
| users         | references | null: false,foreign_key: true|
| items         | references | null: false,foreign_key: true|


- belongs_to :users
- belongs_to :items
