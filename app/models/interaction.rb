class Interaction < ApplicationRecord
  belongs_to :topic
  has_many :options, dependent: :destroy
  has_one_attached :photo

  validates :position, presence: true, numericality: true, uniqueness: true
end
