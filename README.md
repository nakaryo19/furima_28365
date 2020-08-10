# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| image  | text   | null: false |
| select | string | null: false |
| product| string | null: false |
|delivery| string | null: false |
| area   | string | null: false |
| days   | string | null: false |
| price  | string | null: false |

### Association
- belongs_to :users
- has_one :buyers


## buyers テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| card   | string | null: false |
| address
