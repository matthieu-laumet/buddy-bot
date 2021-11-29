class Schedule < ApplicationRecord
  belongs_to :batch
  belongs_to :topic

  #validation
end
