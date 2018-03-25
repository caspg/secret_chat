class Room < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :guests, class_name: 'User'
  has_many :messages

  validates :name, presence: true
  validates :secret_id, presence: true
  validates :owner, presence: true
end
