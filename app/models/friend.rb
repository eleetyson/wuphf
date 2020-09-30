class Friend < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true, length: { is: 10 }
end
