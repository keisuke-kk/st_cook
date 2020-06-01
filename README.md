# アプリ名
## Start Cook
今日作るべき献立を瞬時に確定させ、あなたの料理上達へのモチベーションをサポートします。
![カテゴリー一覧](カテゴリー一覧)



# 概要
- 「today's cook」を押下することにより、その日作るメニューをランダムに提示することができます。
- 作りたい料理のレシピを登録することができます。
- 登録したレシピをカテゴリー毎に整理することができます。



# 本番環境
https://startcook.herokuapp.com



# 制作背景
- ＜社会＞
   - モチベーションの向上や維持を、サービスとして顧客に提供することがトレンドになりつつあると考えているためです。
- ＜個人＞
   - 以前料理の習得に挑戦したことがありましたが、なかなかモチベーションをキープすることができませんでした。<br>失敗した原因は2つあると考えています。<br>1つ目、何を作れば良いかわからなかったことです。<br>2つ目、すぐに料理に取り掛かりたいのに、その前段階の準備で気持ちが砕かれることです。



# DEMO
https://gyazo.com/cdbf646fc5a5d849a6efbdff51b2aa02

トップ画面（カテゴリー一覧） → メニュー一覧 → メニュー詳細 → トップ画面（カテゴリー一覧）

https://gyazo.com/6354011beff83e2e963fbc9f7ac5e067

ランダム機能



# 工夫したポイント
- ランダム機能について自分なりに仮説を立て、リファレンスから実装に必要な記述を調査し、オリジナルで実装しました。
- カテゴリーごとに整理するため、メニューをネストするよう実装しました。



# 実装機能
- ランダム機能
- ユーザー
   - ログイン機能
   - ログアウト機能
   - フラッシュメッセージ機能
- カテゴリ
   - 新規作成機能
   - 編集機能
   - 削除機能
   - 検索機能
   - ページネーション機能
- メニュー
   - 新規作成機能
   - 編集機能
   - 削除機能
   - 詳細表示機能
   - 画像投稿機能
   - 検索機能
   - ページネーション機能



# 使用技術(開発環境)
- heroku
- github
- ruby on rails
- ruby
- html haml
- scss



# 課題や今後実装したい機能
今回のアプリケーションについては、基本的な機能の実装を重点的に行いました。

今後は、言語についての知見をさらに深め、もっと多くのオリジナルのビジネスロジックの

作成に挑戦し、独自の機能を作っていきたいと思っております。



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


