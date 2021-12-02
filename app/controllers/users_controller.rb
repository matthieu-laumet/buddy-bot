class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :update]

  def profile
    @user = current_user
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # def edit
  # end

  def update
    @user.update(article_params)

    redirect_to users_path
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def article_params
    params.require(:user).permit(:last_name, :first_name, :photo, :slack_token)
  end

end
