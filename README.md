# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_reading  | string  | null: false               |
| first_name_reading | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| select_delivery_fee_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| term_id                | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## orders テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| content       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
=======
## messages テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| message       | string     | null: false                    |
| user          | references | null: false                    |
| item          | references | null: false                    |


### Association

- has_many :users
- has_many :items

## favorites テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :items
