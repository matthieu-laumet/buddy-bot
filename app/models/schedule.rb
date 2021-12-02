class Schedule < ApplicationRecord
  belongs_to :batch
  belongs_to :topic #, dependent: :destroy
  has_many :interactions, through: :topic

  def self.sending
    # itérer sur ces schedules
    self.find_each do |schedule|
      # passer posted a true
      # schedule.posted = true
      # schedule.save
      # trouver le 1ere interaction
      interaction = schedule.interactions.find_by(position: 1)
      # trouver les students
      students = schedule.batch.users
      # itérer sur le tableau de students
      students.where.not(slack_token: nil).each do |student|
        if !interaction.content.blank?
          puts "coco1"
          Post.create(
            media: "text",
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.content
          )
        end

        if interaction.photo.attached?
          puts "coco2"
          Post.create(
            media: "photo",
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.photo.key
          )
        end

        if !interaction.html_content.blank?
          puts "coco3"
          Post.create(
            media: "text",
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.html_content
          )
        end

        if !interaction.question.blank?
          puts "coco4"
          Post.create(
            media: "text",
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.question
          )

          Post.create(
            media: "form",
            user: student,
            buddy: true,
            form: true,
            interaction: interaction,
            content: interaction.options
          )
        end
      end
    end
  end
end
