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
      redirect_to topic_path(@interaction.topic)
    else
      render :show
    end
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy

    redirect_to topic_path(@interaction.topic)
  end

  private

  def option_params
    params.require(:option).permit(:title, :next_accroche, :position)
  end
end
