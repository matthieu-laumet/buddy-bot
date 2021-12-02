class Interaction < ApplicationRecord
  belongs_to :topic
  has_many :options, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :photo

  validates :position, presence: true, numericality: true, uniqueness: { scope: :topic }

  def create_post_for(student)

    if !self.content.blank?
      Post.create(
        media: "text",
        user: student,
        buddy: true,
        form: false,
        interaction: self,
        content: self.content
      )
    end

    if self.photo.attached?
      Post.create(
        media: "photo",
        user: student,
        buddy: true,
        form: false,
        interaction: self,
        content: self.photo.key
      )
    end

    if !self.html_content.blank?
      Post.create(
        media: "text",
        user: student,
        buddy: true,
        form: false,
        interaction: self,
        content: self.html_content
      )
    end

    if !self.question.blank? || !self.options.blank?
      Post.create(
        media: "text",
        user: student,
        buddy: true,
        form: false,
        interaction: self,
        content: self.question
      )

      Post.create(
        media: "form",
        user: student,
        buddy: true,
        form: true,
        interaction: self,
        content: self.options
      )
    end

  end
end
