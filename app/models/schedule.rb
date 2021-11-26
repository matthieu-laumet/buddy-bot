class Schedule < ApplicationRecord
  belongs_to :batch
  belongs_to :topic

  def self.sending
    # itérer sur ces schedules
    self.all.each do |schedule|
      # passer posted a true
      schedule.posted = true
      schedule.save
      # trouver le 1ere interaction
      interaction = schedule.topic.interactions.find_by(position: 1)
      # trouver les students
      students = schedule.batch.users
      # itérer sur le tableau de students
      students.each do |student|
        Post.create(
          user: student,
          buddy: true,
          form: false,
          interaction: interaction,
          content: interaction.content
        )

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
