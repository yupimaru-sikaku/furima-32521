# テーブル設計

## users テーブル

| Column       | Type    | Options                   |
| ------------ | ------- | ------------------------- |
| nickname     | string  | null: false, unique: true |
| name         | string  | null: false               |
| name_reading | string  | null: false               |
| birthday     | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | text       | null: false                    |
| description         | text       | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| category            | integer    | null: false                    | ActiveHash
| condition           | integer    | null: false                    | ActiveHash
| select_delivery_fee | integer    | null: false                    | ActiveHash
| prefecture          | integer    | null: false                    | ActiveHash
| term                | integer    | null: false                    | ActiveHash

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :address


## addresses テーブル

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | integer | null: false | ActiveHash
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | text    |             |
| phone_number  | integer | null: false |

### Association

- has_many :orders
