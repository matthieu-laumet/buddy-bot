class Option < ApplicationRecord
  belongs_to :interaction
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true, uniqueness: true, inclusion: { in: 1..3, message: "Merci de choisir un chiffre entre 1 et 3." }
end
