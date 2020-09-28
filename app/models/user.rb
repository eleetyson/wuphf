class User < ApplicationRecord
  has_many :messages
  has_many :friends, through: :messages
  has_secure_password
end
