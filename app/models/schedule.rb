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
        interaction.create_post_for(student)
      end
    end
  end
end
