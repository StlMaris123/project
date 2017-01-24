class Feedback < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :learnt, presence: true
  validates :problem, presence: true
  validates :possible_fix, presence: true
end
