require 'rest-client'
require 'json'

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :interaction
  has_one_attached :photo

  after_create :send_to_slack

  def send_to_slack
    slack_token='xoxb-2779267316933-2806182242208-jTgnpEj8woKrWIjVajapPnHk'
    headers = { "Authorization" => slack_token }
    url_slack = "https://hooks.slack.com/services/#{self.user.slack_token}"
    #url_slack = "https://hooks.slack.com/services/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"

    if self.media == "form"
      options = []
      self.interaction.options.order(:position).each do |option|
        options << option.title
      end
      opt_0 = options[0]
      opt_1 = options[1]
      opt_2 = options[2]

      body = {
        "blocks": [
            {
              "type": "actions",
              "block_id": "actionblock789",
              "elements": [
                  {
                      "type": "button",
                      "text": {
                          "type": "plain_text",
                          "text": "#{opt_0}"
                      },
                      "style": "danger",
                      "value": "\{\"option_id\":\"#{self.interaction.options.find_by(position: 1).id}\", \"user_id\":\"#{user.id}\"\}"
                  },
                  {
                    "type": "button",
                    "text": {
                        "type": "plain_text",
                        "text": "#{opt_1}"
                    },
                    "style": "danger",
                    "value": "\{\"option_id\":\"#{self.interaction.options.find_by(position: 2).id}\", \"user_id\":\"#{user.id}\"\}"
                  },
                  {
                    "type": "button",
                    "text": {
                        "type": "plain_text",
                        "text": "#{opt_2}"
                    },
                    "style": "danger",
                    "value": "\{\"option_id\":\"#{self.interaction.options.find_by(position: 3).id}\", \"user_id\":\"#{user.id}\"\}"
                  }
              ]
            },
            {
			        "type": "divider"
		        }
        ]
      }.to_json
      response = RestClient.post url_slack, body, headers = { content_type: :json, accept: :json }
      #----------------------------block img------------------------------
    elsif self.media == "photo"
      body = {
        "blocks": [
          {
            "type": "image",
            "image_url": "#{ApplicationController.helpers.cl_image_path(self.interaction.photo.key)}",
            "alt_text": "inspiration"
          }
        ]
      }.to_json
      response = RestClient.post url_slack, body, headers = { content_type: :json, accept: :json }
      #----------------------------block text------------------------------
    elsif self.media == "text"
      body = { text: self.content }.to_json
      response = RestClient.post url_slack, body, headers = { content_type: :json, accept: :json }
    end
  end
end
