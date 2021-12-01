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
    url_mcouronne = 'https://hooks.slack.com/services/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'

    if self.form
      options = []
      self.interaction.options.each do |option|
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
                    # {
                    #   "type": "image",
                    #   "image_url": "#{cloudinary.url("sample.jpg", {width: 100, height: 150, crop: "fill"})   }",
                    #   "alt_text": "Test img avec cloudinary"
                    # },
                    {
                        "type": "button",
                        "text": {
                            "type": "plain_text",
                            "text": "#{opt_0}"
                        },
                        "style": "danger",
                        "value": "\{\"option_id\":\"#{self.interaction.options.first.id}\", \"user_id\":\"#{user.id}\"\}"
                    },
                    {
                      "type": "button",
                      "text": {
                          "type": "plain_text",
                          "text": "#{opt_1}"
                      },
                      "style": "danger",
                      "value": "\{\"option_id\":\"#{self.interaction.options.second.id}\", \"user_id\":\"#{user.id}\"\}"
                    },
                    {
                      "type": "button",
                      "text": {
                          "type": "plain_text",
                          "text": "#{opt_2}"
                      },
                      "style": "danger",
                      "value": "\{\"option_id\":\"#{self.interaction.options.third.id}\", \"user_id\":\"#{user.id}\"\}"
                    }
                ]
            }
        ]
      }.to_json
      response = RestClient.post url_mcouronne, body, headers = { content_type: :json, accept: :json }
    else
      body = { text: self.content }.to_json
      response = RestClient.post url_mcouronne, body, headers = { content_type: :json, accept: :json }
    end

  end

end
