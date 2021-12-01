class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def article_params
    params.require(:user).permit(:last_name, :first_name, :photo)
  end

  def index
    @users = User.all
  end

  # def edit
  # end

  def update
  end

end
