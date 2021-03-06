class Group < ApplicationRecord
  validates :group_name, presence: true
  has_many  :user_groups
  has_many  :messages
  has_many  :users, through: :user_groups
end
