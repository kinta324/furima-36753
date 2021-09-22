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

### Association

* has_many:items dependent: :destroy
* has_many:categories dependent: :destroy

## addressテーブル

| Column              | Type     | Options      |
| ------------------- | -------- | ------------ |
| post_code           | string   | null: false  |
| city                | string   | null: false  |
| house_number        | string   | null: false  |
| building_name       | string   |              |
| phone_number        | string   | unique: true |
| birth_date          | date     | null: false  |
| prefecture_code_id  | integer  | null:false   |
| user_id             | integer  | null:false, foreign_key:true |

### Association

* belongs_to :user
* belongs_to :category

## items テーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | --------------------------------|
| name            | string       | null: false                     |
| description     | text         | null: false                     |
| price           | integer      | null: false                     |
| brand_id        | integer  | null: false  |
| seller_id       | integer  | null: false  |
| buyer_id        | integer  | null: false  |
| category_id	    | integer  | null: false  |
| item_condition_id  | integer  | null: false  |
| user_id         | integer  | null: false, foreign_key:true  |

### Association

* belongs_to :user 
* belongs_to :category 
* belongs_to_active_hash :item_condition
* belongs_to_active_hash :brand

## Product history テーブル

| Colum            | Type       | Options                        |
| ---------------- |------------|------------------------------- |
| user_id          | integer    | null: false, foreign_key:true  |
| item_id          | integer    | null: false, foreign_key:true  |

### Association

* has_one :user
* has_one :item