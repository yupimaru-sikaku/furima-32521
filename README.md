# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false               |
| password           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_reading  | string  | null: false               |
| first_name_reading | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| category_id            | integer    | null: false                    | ActiveHash
| condition_id           | integer    | null: false                    | ActiveHash
| select_delivery_fee_id | integer    | null: false                    | ActiveHash
| prefecture_id          | integer    | null: false                    | ActiveHash
| term_id                | integer    | null: false                    | ActiveHash

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address


## addresses テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    | ActiveHash
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | text       |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- has_many :orders
