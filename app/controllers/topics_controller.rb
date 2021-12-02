class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:query].present?
    #   @topic = Topic.global_search(params[:query])
    #  else
    #   @topics = Topic.all
    # end
    @topics = Topic.all
    @topic = Topic.new
  end

  def new
    @topic = current_user.topics.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :index
    end
  end

  def show
    @interaction = Interaction.new
  end

  def edit
  end

  def destroy
    @topic.destroy
    flash[:notice] = "Thème supprimé!"
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :first_accroche, :description, :photo)
  end

end
