class UsersController < ApplicationController
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
  end
  
  
  private

  def article_params
    params.require(:user).permit(:last_name, :first_name, :photo)
  end

end
