class InteractionsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @interaction = Interaction.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @interaction = Interaction.create!()
  end

  def interaction_params
    params.require(:interaction).permit(:topics, :content, :question, :html_content, :position)
  end
end
