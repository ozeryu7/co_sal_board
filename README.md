
## Co-sal Board(個サル掲示板)
【トップ画面の全体画像】
![スクリーンショット 2021-03-20 21 35 46](https://user-images.githubusercontent.com/67585951/111870585-f0b83280-89c8-11eb-822d-d33773936256.png)

## アプリの概要
シャイな人も繋がれる個サル好きのための掲示板サイト
※個サル：個人同士で参加するフットサル

「行ったよ」ボタンでコメントしなくても気軽に繋がりのきっかけが作れる。
次回フットサル行った時に会話のきっかけにできる。

![スクリーンショット 2021-03-20 22 12 12](https://user-images.githubusercontent.com/67585951/111870667-61f7e580-89c9-11eb-9e60-9d6d5a7b5596.png)


## URL
下記のページで公開しています
https://co-sal-board.herokuapp.com/

* テストの場合はゲストユーザーとしてログインできます。

## 使用技術
* Ruby 2.6.6, Rails 6.0.3.4
* SQLite3、PostgreSQL
* Heroku
* HTML, Sass, javascript, jQuery

## 機能一覧
### 認証機能  
+ サインイン、サインアップ機能 ( devise )  
  * email、パスワード、ユーザー名必須  
  * ゲストログイン機能( アカウント削除・プロフィール編集不可 )
  * omniauth認証によるSNSログイン( Facebook Google)  
+ パスワード編集機能 ( devise )

### 投稿機能
+ 新規投稿ページ
  * 新規投稿機能
  * 投稿確認機能
  * 画像投稿機能( ActiveStorage )
+ 投稿一覧ページ
+ 投稿詳細ページ
  * コメント表示機能
  * いいね機能
  * 投稿編集ボタンの設置 ( ログイン済み投稿者のみ表示 )
  * 投稿削除ボタンの設置 ( ログイン済み投稿者のみ表示 )
+ 投稿編集ページ
  * 投稿編集機能

+ ページネーション機能
### ユーザー機能
+ マイページ  
  * 自身のページ以外は設定アイコン非表示
+ ユーザープロフィール編集ページ
  * ユーザー名、メールアドレス、パスワード、プロフィール画像

+ セッティングページ
  * アカウント削除機能
  * ログアウト機能

+ タイトルと内容で検索可能 ( ransack )
### いいね・行ったよボタン機能
+ 非同期通信にて即時反映( Ajax )
### コメント機能
+ 各投稿にコメント機能を実装
+ コメント削除機能 ( ログイン済み投稿者のみ表示 )

## 課題、今後実装したい機能
* AWSへデプロイ
* Google Maps APIを用いてフットサル場を特定

## About me
現在28歳、東証一部上場某インフラメーカー勤務をして5年目になります。
webエンジニアを目指して日々勉強しアウトプットを行なっています。  
[Twitter](https://twitter.com/ozeryu7)  
E-Mail: [ozeki.ryusuke@gmail.com](ozeki.ryusuke@gmail.com)
