# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one  :buyer



## items テーブル

| Column           | Type        | Options                           |
| ---------------  | ----------- | --------------------------------- |
| image            | string      | null: false                       |
| item_name        | string      | null: false                       |
| item_description | text        | null: false                       |
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




## buyer テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | references | null: false, foreign_key :true |
| user             | references | null: false, foreign_key :true |
| shipping_address | references | null: false, foreign_key :true |

### Association

- has_one :shipping_address
- belongs_to : user
- belongs_to : item



## shipping-address テーブル

| Column          | Type       | Options                          |
| --------------- | ---------- | -------------------------------- |
| postal_number   | string     | null: false                      |
| city            | string     | null: false                      |
| address         | string     | null: false                      |
| building        | string     |                                  |
| phone_number    | integer    | null: false                      |
| buyer           | references | null: false, foreign_key :true   |
| prefecture      | integer    | null: false                      |

### Association

- belongs_to :buyer
