class Topic < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :first_accroche, presence: true

  include PgSearch::Model

  pg_search_scope :global_search,
    associated_against: {
      interactions: [ :content, :question ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
