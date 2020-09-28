class User < ApplicationRecord
  has_many :messages
  has_many :friends, through: :messages
end
