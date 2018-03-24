class User < ApplicationRecord
  belongs_to :room, required: false
  has_one :admin_room, class_name: 'Room', dependent: :destroy
  has_many :messages
end
