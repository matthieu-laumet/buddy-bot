class Post < ApplicationRecord
  belongs_to :user
  belongs_to :interaction
  has_one_attached :photo
end
