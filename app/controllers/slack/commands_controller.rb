require 'json'

class Slack::CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:interactive_endpoint]

  def interactive_endpoint
    responses = params[:payload]
    json_responses = JSON.parse(responses.gsub('=>', ':'))
    user_response = JSON.parse(json_responses["actions"][0]["value"])

    @option = Option.find(user_response["option_id"])
    current_user = User.find(user_response["user_id"])

    @answer = Answer.new(option_id: @option.id, user_id: current_user.id)
    @last_interaction = @option.interaction
    @next_interaction = @last_interaction.topic.interactions.where(position: @last_interaction.position + 1).first
    @answer.save!
    #post affiche la reponse de user (buddy = false)
    Post.all.where(user: current_user).update(active: false)
    Post.create!(user: current_user, interaction: @last_interaction, buddy: false, content: @option.title, form: false)

    if @next_interaction
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: false, content: @option.next_accroche)
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: false, content: @next_interaction.content)
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: false, content: @next_interaction.question)
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: true, content: "")
    end

    head :no_content
  end

end
