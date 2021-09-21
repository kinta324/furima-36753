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

### Association

* belongs_to :user

## items テーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | --------------------------------|
| name            | string       | null: false                     |
| description     | string       | null: false                     |
| price           | string       | null: false                     |
| size            | string       | null: false                     |
| shipping_cost   | string       | null: false                     |
| shipping_days   | string       | null: false                     |
| category        | integer      | null: false                     |
| status          | string       | null: false                     |
| category_id	    | integer	     | null: false, foreign_key: true  |
| item_condition  | integer      | null: false                     |

### Association

* belongs_to :category dependent: :destroy
* belongs_to_active_hash :item_condition
* belongs_to_hash :postage_type

## categories テーブル

| Column           | Type            | Options            |
| ---------------- | --------------- | ------------------ |
| name             | string          | null: false        |
| ancesty          | string          | null: false        |

### Association

* has_many :items

