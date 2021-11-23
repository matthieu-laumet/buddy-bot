class PostsController < ApplicationController
  def index
    @posts = Post.all.where(user: current_user)
  end
end
