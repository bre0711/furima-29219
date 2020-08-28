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

| Column           | Type       | Options                           |
| ---------------  | ---------  | --------------------------------- |
| image            | string     | null: false                       |
| item_name        | string     | null: false                       |
| item_description | text       | null: false                       |
| category         | string     | null: false                       |
| states           | string     | null: false                       |
| price            | integer    | null: false                       |
| burden           | integer    | null: false                       |
| area             | string     | null: false                       |
| shipping         | string     | null: false                       |
| user             | references | null: false, foreign_key :true    |

### Association

- has_many :buyer



## buyer テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key :true |


### Association

- has_one :shipping_address



## shipping-address テーブル

| Column          | Type       | Options                          |
| --------------- | ---------- | -------------------------------- |
| postal_number   | integer    | null: false                      |
| prefecture      | string     | null: false                      |
| city            | string     | null: false                      |
| address         | string     | null: false                      |
| building        | string     |                                  |
| phone_number    | integer    | null: false                      |
| buyer           | references | null: false, foreign_key :true   |

### Association

- belongs_to :buyer