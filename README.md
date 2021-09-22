# テーブル設計

## users テーブル

| Column              | Type     | Options      |
| ------------------- | -------- | ------------ |
| name                | string   | null: false  | 
| email               | string   | null: false, unique: true  |
| encrypted_password  | string   | null: false  |
| first_name          | string   | null: false  |
| family_name         | string   | null: false  |
| first_name_kana     | string   | null: false  |
| family_name_kana    | string   | null: false  |
| birth_day           | date     | null:false   |

### Association

* has_many:items dependent: :destroy
* has_many:product_history dependent: :destroy

## addressテーブル

| Column              | Type     | Options      |
| ------------------- | -------- | ------------ |
| post_code           | string   | null: false  |
| city                | string   | null: false  |
| house_number        | string   | null: false  |
| building_name       | string   |              |
| phone_number        | string   | null: false  |
| prefecture_code_id  | integer  | null:false   |
| product_histories_id | integer | null:false, foreign_key:true |
### Association

* belongs_to :product_history

## items テーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | --------------------------------|
| name            | string       | null: false                     |
| description     | text         | null: false                     |
| price           | integer      | null: false                     |
| postage_id        | integer  | null: false  |
| region_id       | integer  | null: false  |
| shipping_date_id        | integer  | null: false  |
| category_id	    | integer  | null: false  |
| item_condition_id  | integer  | null: false  |
| user         | references  | null: false, foreign_key:true  |

### Association

* belongs_to :user 
* has_one :product_history

## Product history テーブル

| Colum            | Type       | Options                        |
| ---------------- |------------|------------------------------- |
| user            | references  | null: false, foreign_key:true  |
| item            | references  | null: false, foreign_key:true  |

### Association

* has_one :address
* belongs_to :user
* belongs_to :item