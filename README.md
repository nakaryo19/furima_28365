# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nicname        | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
|family_name     | string | null: false |
|first_name      | string | null: false |
|family_name_kana| string | null: false |
|first_name_kana | string | null: false |
| birthday       | date   | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column | Type     | Options                     |
| ------ | ------   | -----------                 |
| user   |references| null:false,foreign_key:true |
| name   | string   | null: false                 |
| text   | string   | null: false                 |
| image  | string   | null: false                 |
|category| integer  | null: false                 |
| product| integer  | null: false                 |
|delivery| integer  | null: false                 |
| area   | integer  | null: false                 |
| days   | integer  | null: false                 |
| price  | integer  | null: false                 |

### Association
- belongs_to :user
- has_one :order


## bayer テーブル

| Column      | Type      | Options            |
| ------      | ------    | -----------        |
| remit       | string    | null: false        |
| code        | string    | null: false        |
|Prefectures  | references| null: false,FK:true|
| city        | string    | null: false        |
| address     | string    | null: false        |
|building_name| string    | t.text             |
|phone_number | string    | null: false        |
| order       | reference | null: false,FK:true|

### Association
- belongs_to :order

## orders テーブル
| Column      | Type      | Options            |
| ------      | ------    | -----------        |
| user        | reference | null: false,FK:true|
| item        | reference | null: false,FK:true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :bayer