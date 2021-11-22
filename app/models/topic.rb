class Topic < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :interactions

  validates :title, presence: true, uniqueness: true
  validates :first_accroche, :description, presence: true
end
