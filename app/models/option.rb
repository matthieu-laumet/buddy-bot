class Option < ApplicationRecord
  belongs_to :interaction
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true, inclusion: { in: 1..3, message: "Merci de choisir un chiffre entre 1 et 3." }
  validates :position, uniqueness: { scope: :interaction }

  def selected_by?(user)
    user.answers.where(option: self).any?
  end
end
