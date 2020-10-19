# README
# テーブル設計

## users テーブル

| Column   | Type   | Option      |
| -------- | -----  | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association

- has_many :items
- has_many :buy

## items テーブル

| Column  | Type    | Option      |
| ------- | ------- | ----------- |
| image   | string  | null: false |
| text    | text    | null: false |
| price   | integer | null: false |
| user_id | string  | null: false |
| category| string  | null: false |

## Association

-belongs_to :users

## buy テーブル

| Column           | Type    | Option      |
| ---------------- | ------- | null: false |
| card_number      | integer | null: false |

## Association

- belongs_to :users
- has_one :shipping_address

## shipping_address テーブル

| Column  | Type   | Option      |
| ------- | ------ | ----------- |
| address | string | null: false |

## Association

- belongs_to :buy