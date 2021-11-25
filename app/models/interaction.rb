class Interaction < ApplicationRecord
  belongs_to :topic
  has_many :options, dependent: :destroy
  has_one_attached :photo

  validates :question, presence: true
  validates :position, presence: true, numericality: true, uniqueness: true
end
