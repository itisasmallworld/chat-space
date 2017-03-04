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
| mail_address|add index :users, :mail_address, unique: true    |

- messages table

| center align| center align |
|:-----------:|:------------:|
|body             |  t.text            |
|image                  | t.string                  |
|group_id              | t.intenger     |
|user_id   |t.string :user_id, foreign_key: true|

 - groups table

| center align| center align |
|:-----------:|:------------:|
|message_id|t.intenger|
|group_name|t.string|
|group_id|t.intenger|
