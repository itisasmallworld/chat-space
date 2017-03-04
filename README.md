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
#### users table
    - t.string  :name
    - add_index :users, :mail_address, unique: true
    - t.string  :password

#### messages table
    - t.text       :body
    - t.string     :image
    - t.integer    :group_id
    - t.string :user_id, foreign_key: true

#### groups table
    - t.intenger  :message_id
    - t.string    :group_name
