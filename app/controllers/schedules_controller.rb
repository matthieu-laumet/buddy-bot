class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:destroy]

  def index
    # if # si le mois est renseigné dans le lien alors je fais la requette
    #   # @schedules = Schedule.where(Schedule.post_at) #le mois stocké dans post_at
    # else
    #   #le mois en cours
    #   # @schedules = Schedule.where(date.today.month)
    # end
    params[:month].present? ? @month = params[:month].to_i : @month = Date.today.month
    filtered_schedules = []
    Schedule.find_each do |schedule|
      filtered_schedules << schedule if !schedule.post_at.nil? && schedule.post_at.month.to_i == @month
    end
    @schedules = filtered_schedules
    @schedule = Schedule.new
    # @batch = Batch.find(params[:batch_id])
    #@topic = Topic.find(params[:topic_id])
  end

  def create
    @batch = Batch.find(params[:schedule][:batch_id])
    @topic = Topic.find(params[:schedule][:topic_id])
    @schedule = Schedule.new(schedule_params)
    @schedule.topic = @topic
    @schedule.batch = @batch
    if @schedule.save
      redirect_to schedules_path
    else
      render :index
    end
  end

  def destroy
    @schedule.destroy
    flash[:notice] = "Programmation supprimé!"
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:batch_id, :topic_id, :post_at, :photo)
  end
end
