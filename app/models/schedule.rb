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
        unless interaction.content.blank?
          Post.create(
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.content
          )
        end

        if interaction.photo.attached?
          Post.create(
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.photo.key
          )
        end

        unless interaction.html_content.blank?
          Post.create(
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.html_content
          )
        end

        unless interaction.question.blank?
          Post.create(
            user: student,
            buddy: true,
            form: false,
            interaction: interaction,
            content: interaction.question
          )

          Post.create(
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
