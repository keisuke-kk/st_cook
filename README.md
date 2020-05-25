# アプリ名
## Start Cook
今日作るべき献立を瞬時に確定させ、あなたの料理上達へのモチベーションをサポートします！

# 概要


# 本番環境


# 制作背景


# DEMO


# 工夫したポイント


# 実装機能


# 使用技術(開発環境)


# 課題や今後実装したい機能









# Start Cook
"Start Cook" is sorting of cuisine menu to your cooking motivation_up, with Ruby.

# Demo
https://gyazo.com/7b0022221e4e5f9ab194c140f2c0c325

# Features
"Start Cook" is clarify you should cook today.
It means keeping motivation to improvement of cooking.
And can sort menus into category.
Let's create cookingmenu together with everyone!

# URL
https://startcook.herokuapp.com

# gitリポジトリ
https://git.heroku.com/stcook.git


# st-cook DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :menus
- has_many :categories

## menusテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|text|null: false|
|image|string||
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :menus



