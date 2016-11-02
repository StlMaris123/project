class User < ApplicationRecord
  validates :name,         presence: true, length: { maximum: 50 }
  validates :email,        presence: true, length: { maximum: 255 }
  validates :phone_number, presence: true, length: { minimum: 1 }
end
