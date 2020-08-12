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
- has_many :bayer

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text   | null: false |
| image  | string | null: false |
|category| string | null: false |
| product| integer| null: false |
|delivery| integer| null: false |
| area   | integer| null: false |
| days   | integer| null: false |
| price  | integer| null: false |

### Association
- belongs_to :user
- has_one :bayer
- has_one :order


## bayer テーブル

| Column      | Type      | Options            |
| ------      | ------    | -----------        |
| creditcard  | string    | null: false        |
| remit       | string    | null: false        |
| code        | string    | null: false        |
|Prefectures  | references| null: false,FK:true|
| city        | string    | null: false        |
| address     | string    | null: false        |
|building_name| string    | null: false        |
|phone_number | string    | null: false        |

### Association
- belongs_to :user
- belongs_to :item
- has_one : order

## orders テーブル
| Column      | Type      | Options            |
| ------      | ------    | -----------        |
|buyer_user_id| reference | null: false,FK:true|
| item_id     | reference | null: false,FK:true|

### Association
- belongs_to :bayer
- belongs_to :item