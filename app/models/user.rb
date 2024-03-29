class User < ApplicationRecord
  belongs_to :batch, optional: true
  has_many :topics
  has_many :answers, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
