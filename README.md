# README

# テーブル設計

##  usersテーブル

|      Column        |    Type    |             Options             |
| ------------------ | ---------- | ------------------------------- |
| nickname           | string     | null: false                     |
| email              | string     | null: false, unipue: true       |
| encrypted_password | string     | null: false                     |
| first_name         | string     | null: false                     |
| family_name        | string     | null: false                     |
| first_name_kana    | string     | null: false                     |
| family_name_kana   | string     | null: false                     |
| birthday           | date       | null: false                     |

### Association

- has_many : items
- has_many : orders

## items テーブル

|       Column       |    Type    |             Options             |
| ------------------ | ---------- | ------------------------------- |
| item_name          | string     | null: false                     |
| item_info          | text       | null: false                     |
| item_price         | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| item_category_id   | integer    | null: false                     |
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

## order_infos テーブル

|       Column        |    Type    |            Options             |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| postcode            | string     | null: false                    |
| shipping_address_id | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false, unipue: true      |

### Association

- belongs_to :order

## messages テーブル

|       Column        |    Type    |            Options             |
| ------------------- | ---------- | ------------------------------ |
| text                | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
