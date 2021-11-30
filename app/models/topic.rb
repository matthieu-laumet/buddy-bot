class Topic < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :first_accroche, presence: true
end
