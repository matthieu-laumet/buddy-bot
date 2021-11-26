class InteractionsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @interaction = Interaction.new(interaction_params)
    @interaction.topic = @topic
    if @interaction.save
      redirect_to topic_path(@interaction.topic)
    else
      flash[:alert] = "It #{@interaction.errors.messages[:position].first}."
      redirect_to topic_path(@interaction.topic)
    end
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    @interaction.destroy
    flash[:notice] = "Contenu supprimé!"
    redirect_to topic_path(@interaction.topic)
  end

  def interaction_params
    params.require(:interaction).permit(:content, :question, :html_content, :position, :photo)
  end
end
