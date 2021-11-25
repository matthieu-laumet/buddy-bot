class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  before_action :redirect_admin, only: [:home]

  def home
  end

  def redirect_admin
    if current_user.admin
      redirect_to topics_path
    else
      redirect_to posts_path
    end
  end
end
