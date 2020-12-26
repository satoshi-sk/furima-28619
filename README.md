# README
# テーブル設計

## users テーブル

| Column             | Type     | Option      |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string   | null: false |
| birthday           | date     | null: false |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Option                         |
| --------------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| text                  | text       | null: false                    |
| user                  | references | null: false, foreign_key: true |
| category_id           | integer    | null: false                    |
| product_condition_id  | integer    | null: false                    |
| shipping_price_id     | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| shipping_date_id      | integer    | nill: false                    |
| price                 | integer    | null: false                    |

## Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| block_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

## Association

- belongs_to :order


