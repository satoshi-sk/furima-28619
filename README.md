# README
# テーブル設計

## users テーブル

| Column   | Type     | Option      |
| -------- | -------- | ----------- |
| name     | string   | null: false |
| email    | string   | null: false |
| password | string   | null: false |
| nickname | string   | null: false |
| birthday | datetime | null: false |

## Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| text              | text       | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| category          | string     | null: false                    |
| product_name      | string     | null: false                    |
| product_condition | string     | null: false                    |
| shipping_price    | string     | null: false                    |
| ship_form         | string     | null: false                    |
| shipping_date     | datetime   | nill: false                    |

## Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column           | Type    | Option                            |
| ---------------- | ------- | --------------------------------- |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column       | Type    | Option      |
| ------------ | ------- | ----------- |
| address      | string  | null: false |
| phone_number | integer | null: false |

## Association

- belongs_to :buy