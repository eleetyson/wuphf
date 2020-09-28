class Friend < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
end
