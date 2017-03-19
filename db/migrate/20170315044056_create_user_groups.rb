class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.integer :group_id, foreign_key: true
      t.integer :user_id, foreign_key: true
    end
  end
end
