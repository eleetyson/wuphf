class Friend < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true, length: { is: 10 }
  # ActiveRecord scope method to return a user's recently added friends (ex: user.friends.recently_added)
  # could be used at the class level in a feed displaying recent activity
  scope :recently_added, -> { order(created_at: :desc) }
end
