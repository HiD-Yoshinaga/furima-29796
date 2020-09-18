# README

# テーブル設計

##  usersテーブル

|      Column      |    Type    |             Options             |
| ---------------- | ---------- | ------------------------------- |
| nickname         | string     | null: false                     |
| email            | string     | null: false, unipue: true       |
| password         | string     | null: false                     |
| first_name       | string     | null: false                     |
| family_name      | string     | null: false                     |
| first_name_kana  | string     | null: false                     |
| family_name_kana | string     | null: false                     |
| birth_year       | date       | null: false                     |
| birth_mounth     | date       | null: false                     |
| birth_day        | date       | null: false                     |

### Association

- has_many : items
- has_one  : pofiles
- has_many : orders

## items テーブル

|       Column       |    Type    |             Options             |
| ------------------ | ---------- | ------------------------------- |
| item_name          | string     | null: false                     |
| item_info          | text       | null: false                     |
| item_price         | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| item_categories_id | integer    | null: false                     |
| item_condition_id  | integer    | null: false                     |
| shipping_fee_id    | integer    | null: false                     |
| ship_from_id       | integer    | null: false                     |
| day_to_ship_id     | integer    | null: false                     |

### Association

- belongs_to : user
- has_one : order

## orders テーブル

|    Column     |    Type    |            Options             |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one : orders_info
- belongs_to :item
- belongs_to :user

## orders_info テーブル

|    Column     |    Type    |            Options             |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postcode      | string     | null: false                    |
| ship_from     | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, unipue: true      |

- belongs_to :order

## item_categories(active_hash)

|    Column     |    Type    |            Options             |
| ------------- | ---------- | ------------------------------ |
| categories_id | integer    |  null: false                   |

### Association

- has_many :item

## item_condition (active_hash)

|    Column     |    Type    |            Options             |
| ------------- | ---------- | ------------------------------ |
| condition_id  | integer    | null: false                    |

## shipping_fee (active_hash)

|     Column      |    Type    |           Options              |
| --------------- | ---------- | ------------------------------ |
| shipping_fee_id | integer    | null: false                    |

### Association

- has_many :item

## ship_from (active_hash)

|    Column     |    Type    |             Options             |
| ------------- | ---------- | ------------------------------- |
| ship_from_id  | integer    | null: false                     |

### Association

- has_many :item

## dat_to_ship (active_hash)

|     Column     |    Type    |            Options             |
| -------------- | ---------- | ------------------------------ |
| day_to_ship_id | integer    | null: false                    |

### Association

- has_many :item