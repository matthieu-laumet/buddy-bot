class Batch < ApplicationRecord
  has_many :users
  has_many :schedules

  validates :camp, presence: true, numericality: { only_integer: true }
end
