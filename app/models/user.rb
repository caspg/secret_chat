class User < ApplicationRecord
  belongs_to :room, required: false
  has_one :room, dependent: :destroy
end
