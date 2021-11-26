class AnswersController < ApplicationController

  def show
    @answer = Answer.find(params[:answer_id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @option = Option.find(params[:option_id])
    @answer = Answer.new(option_id: @option.id, user_id: current_user.id)
    @last_interaction = @option.interaction
    @next_interaction = @last_interaction.topic.interactions.where(position: @last_interaction.position + 1).first
    @answer.save!
    #post affiche la reponse de user (buddy = false)
    Post.all.where(user: current_user).last.update(active:false)
    Post.create!(user: current_user, interaction: @last_interaction, buddy: false, content: @option.title, form: false)

    if @next_interaction
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: false, content: @option.next_accroche)
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: false, content: @next_interaction.content)
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: false, content: @next_interaction.question)
      Post.create!(user: current_user, interaction: @next_interaction, buddy: true, form: true, content: "")
    end

    redirect_to posts_path(anchor: "option-#{@answer.id}")
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
