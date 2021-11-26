class OptionsController < ApplicationController

  def new
    @interaction = Interaction.find(params[:interaction_id])
    @option = Option.new
  end

  def create
    @interaction = Interaction.find(params[:interaction_id])
    @option = Option.new(option_params)
    @option.interaction = @interaction
    if @option.save
      flash[:notice] = "Réponse ajoutée!"
      redirect_to topic_path(@interaction.topic)
    else
      flash[:alert] = "This position #{@option.errors.messages[:position].first}. Please try another one."
      redirect_to topic_path(@interaction.topic)
    end
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
    flash[:notice] = "Réponse supprimée!"
    redirect_to topic_path(@option.topic)
  end

  private

  def option_params
    params.require(:option).permit(:title, :next_accroche, :position)
  end
end
