# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| profile            | text   | null: false                |
| email              | string | unique: true, null: false  |
| encrypted_password | string | null: false                |

### Association
- has_many :books
- has_many :comments


## books テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| image             | string      | null: false                    |
| title             | string      | null: false                    |
| author            | string      | null: false                    |
| publisher         | string      | null: false                    |
| price             | integer     | null: false                    |
| genre_id          | integer     | null: false                    |
| user_id           | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| text              | text        | null: false                    |
| user              | references  | null: false, foreign_key: true |
| book              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :book