# README
# テーブル設計

## users テーブル

| Column           | Type     | Option      |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| confirm_password | string   | null: false |
| last_name        | string   | null: false |
| first_name       | string   | null: false |
| last_name_kana   | string   | null: false |
| first_name_kana  | string   | null: false |
| birthday         | datetime | null: false |

## Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type       | Option      |
| ----------------- | ---------- | ----------- |
| product_name      | string     | null: false |
| text              | text       | null: false |
| user              | string     | null: false |
| category          | integer    | null: false |
| product_condition | integer    | null: false |
| shipping_price    | integer    | null: false |
| ship_form         | integer    | null: false |
| shipping_date     | integer    | nill: false |
| price             | integer    | null: false |

## Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column           | Type    | Option                            |
| ---------------- | ---------- | ------------------------------ |
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