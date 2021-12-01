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
            },
            {
			        "type": "divider"
		        }
        ]
      }.to_json
      response = RestClient.post url_slack, body, headers = { content_type: :json, accept: :json }
      #----------------------------block img------------------------------
    elsif self.interaction.photo.attached?
      # img_asset = Cloudinary::Utils.cloudinary_url(self.interaction.photo.key)
      img_asset = Cloudinary::Utils.cloudinary_url("sample.jpg")
      file_key = self.interaction.photo.key
      file_name = self.interaction.photo.filename
      body = {
        "blocks": [
          {
            "type": "image",
            #"image_url": "https://res.cloudinary.com/dmtccsbsm/image/upload/v1636722389/sample.jpg",

            # "image_url": "#{img_asset}",
            "alt_text": "inspiration"
          }
        ]
      }.to_json
      response = RestClient.post url_slack, body, headers = { content_type: :json, accept: :json }
      #----------------------------block text------------------------------
    elsif !self.content.empty?
      body = { text: self.content }.to_json
      response = RestClient.post url_slack, body, headers = { content_type: :json, accept: :json }
    end
  end
end
