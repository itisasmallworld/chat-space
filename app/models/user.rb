class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates_format_of :password, :with => /([0-9].*[a-zA-Z]|[ a-zA-Z].*[0-9])/
  has_many :user_groups
  has_many :groups, through: :user_groups
end
