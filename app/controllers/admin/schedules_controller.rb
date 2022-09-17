class Admin::SchedulesController < ApplicationController
  def index
     @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    @schedules = Schedule.where(day: params[:id])
    @schedules.each do |schedule|
      @day = schedule.day
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to request.referer
    flash[:notice] = "削除しました"
  end

end
