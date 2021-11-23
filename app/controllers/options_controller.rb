class OptionsController < ApplicationController

  def new
    @option = Option.new
  end

  def create
    @interaction = Interaction.find(paralms[:interaction_id])
    @option = Option.find(option_params)
    if @option.save
      redirect_to topic_path(@interaction.topic)
    else
      render :show
    end
  end

  def destroy
    @option = Option.find(params[:i])
    @option.destroy

    redirect_to topic_path(@interaction.topic)
  end

  private

  def option_params
    params.require(:option).permit(:title, :next_accroche, :position)
  end
end
