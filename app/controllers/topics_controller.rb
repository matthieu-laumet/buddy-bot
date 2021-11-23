class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = current_user.topics.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.valid?
      @topic.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  def show
    @interaction = Interaction.new
  end

  def edit
  end

  def update
    @topic.update(travel_params)
    redirect_to topics_path
  end

  def destroy
    @topic.destroy
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
