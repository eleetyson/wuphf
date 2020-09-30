class User < ApplicationRecord
  has_many :messages
  has_many :friends, through: :messages
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
