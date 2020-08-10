# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nicname  | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | integer| null: false |
| birthday | integer| null: false |

### Association
- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| image  | string | null: false |
|category| string | null: false |
| product| integer| null: false |
|delivery| integer| null: false |
| area   | integer| null: false |
| days   | integer| null: false |
| price  | integer| null: false |

### Association
- belongs_to :user


## delivery_address テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| address| integer| null: false |
