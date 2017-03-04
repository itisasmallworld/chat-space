# ChatSpace

## Function
- 新規登録機能
- 1対1のチャット機能
- グループチャット機能
- チャットメンバー追加機能
- チャットメンバー検索機能
- 画像投稿機能
- チャットの履歴表示機能
- チャットの自動更新機能

## DatabaseDesign

### RequiredTable
  - users table
  - messages table
  - groups table

### RequiredColumun

 - users table

| center align| center align |
|:-----------:|:------------:|
| name        |    t.string    |
| email|add index :users, :email, unique: true    |

- messages table

| center align| center align |
|:-----------:|:------------:|
|body|t.text :body, foreign_key: true|
|image|t.string :image, foreign_key: true|
|group_id| t.intenger :group_id, foreign_key: true|
|user_id   |t.string :user_id, foreign_key: true|

 - groups table

| center align| center align |
|:-----------:|:------------:|
|group_name|t.string|


 - users_groups table

| center align| center align |
|:-----------:|:------------:|
|user_id|t.intenger :user_id, foreign_key: true|
|group_id|t.intenger :group_id, foreign_key: true|
