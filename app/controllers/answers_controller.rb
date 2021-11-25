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
    @answer.save!
    # if @answer.save
    #   redirect_to posts_path
    # else
    #   render :posts
    # end
    respond_to do |format|
      format.js
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
