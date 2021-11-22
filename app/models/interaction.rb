class Interaction < ApplicationRecord
  belongs_to :topic
  has_many :options

  validates :question, presence: true
  validates :position, presence: true, numericality: true, uniqueness: true
end
