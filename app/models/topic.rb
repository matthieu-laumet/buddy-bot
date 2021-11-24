class Topic < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :interactions, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
  validates :first_accroche, :description, presence: true
end
