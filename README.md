# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_kana_name     | string  | null: false |
| last_kana_name      | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many  :items
- has_many  :buyers



## items テーブル

| Column           | Type        | Options                           |
| ---------------  | ----------- | --------------------------------- |
| image            | string      | null: false                       |
| name             | string      | null: false                       |
| description      | text        | null: false                       |
| category         | integer     | null: false                       |
| states           | integer     | null: false                       |
| burden           | integer     | null: false                       |
| area             | integer     | null: false                       |
| shipping         | integer     | null: false                       |
| price            | integer     | null: false                       |
| user             | references  | null: false, foreign_key :true    |

### Association

- belongs_to :user
- has_one :buyer




## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | references | null: false, foreign_key :true |
| user             | references | null: false, foreign_key :true |

### Association

- has_one :shipping_address
- belongs_to : user
- belongs_to : item



## shipping-addresses テーブル

| Column          | Type       | Options                          |
| --------------- | ---------- | -------------------------------- |
| postal_number   | string     | null: false                      |
| city            | string     | null: false                      |
| address         | string     | null: false                      |
| building        | string     |                                  |
| phone_number    | string     | null: false                      |
| buyer           | references | null: false, foreign_key :true   |
| prefecture      | integer    | null: false                      |

### Association

- belongs_to :buyer
