class Public::SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def index
    @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    @schedules.each do |schedule|
      @trip = schedule.trip.count
    end
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.member_id = current_member.id
    @schedule.save
    redirect_to schedule_path(@schedule.day)
  end

  def show
    @schedules = Schedule.where(day: params[:id])
    @schedules.each do |schedule|
      @day = schedule.day
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to member_schedules_path(@schedule.member.id)
    else
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to request.referer
  end


  private

  def schedule_params
    params.require(:schedule).permit(:day, :member_id, :attendance, :trip, :go_out, :other, :start_time)
  end

end
