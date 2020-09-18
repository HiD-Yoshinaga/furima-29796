# README

# テーブル設計

## users テーブル

|      Column      |    Type    |             Options             |
| ---------------- | ---------- | ------------------------------- |
| nickname         | string     | null: false                     |
| email            | string     | null: false, unipue: true       |
| password         | string     | null: false                     |

### Association

- has_many : items
- has_one  : pofiles 
- has_many : order

## profiles テーブル

|      Column      |    Type    |             Options             |
| ---------------- | ---------- | ------------------------------- |
| first_name       | string     | null: false                     |
| family_name      | string     | null: false                     |
| first_name_kana  | string     | null: false                     |
| family_name_kana | string     | null: false                     |
| birth_year       | date       | null: false                     |
| birth_mounth     | date       | null: false                     |
| birth_day        | date       | null: false                     |
| user_id          | references | null: false, foreign_key: true  |

### Association

- belongs_to : user

## items テーブル

|      Column      |    Type    |             Options             |
| ---------------- | ---------- | ------------------------------- |
| item_name        | string     | null: false                     |
| item_info        | text       | null: false                     |
| item_price       | integer    | null: false                     |
| created_at       | date       | null: false                     |
| updated_at       | date       | null: false                     |
| user_id          | references | null: false, foreign_key: true  |

### Association

- has_many : item_image
- belongs_to : user
- has_one : order
- belongs_to : item_categories
- belongs_to : item_condition
- belongs_to : shipping_fee
- belongs_to : ship_from
- belongs_to : dat_to_ship

## item_images テーブル

|      Column      |    Type    |   Options   |
| ---------------- | ---------- | ----------- |
| item_image       | string     | null: false |
| item_id          | references | null: false |

### Association

- belongs_to :item

## orders_info テーブル

|    Column     |    Type    |            Options             |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| postcode      | integer(7) | null: false                    |
| ship_from     | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false, unipue: true      |

### Association

- belongs_to :item
- belongs_to :user

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