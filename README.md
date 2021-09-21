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
| birth_day           | date     | null: false  |

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
| prefecture_code     | integer  |              |
| family_name         | string   | null:false   |
| first_name          | string   | null:false   |
| family_name_kana    | string   | null:false   |
| first_name_kana     | string   | null:false   |
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
| brand_id        | references       | null: false, foreign_key: true   |
| seller_id       | references       | null: false, foreign_key: true  |
| buyer_id        | references       | null: false, foreign_key: true  |
| category_id	    | references    | null: false, foreign_key: true  |
| item_conditions_id  | references    | null: false, foreign_key: true  |
| size                | string        | null: false                     |
### Association

* belongs_to :user 
* belongs_to :category 
* belongs_to_active_hash :item_condition
* belongs_to_active_hash :brand

## categories テーブル

| Column           | Type            | Options            |
| ---------------- | --------------- | ------------------ |
| name             | string          | null: false        |
| ancesty          | string          | null: false        |

### Association

* has_many :items

