class Public::SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def index
    @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    @schedule = Schedule.find_by(id: params[:format])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.member_id = current_member.id
    @schedule.save
    redirect_to schedule_path(@schedule.day)
  end

  def show
    @schedules = Schedule.where(day: params[:id])
    @oneday_off_members = Schedule.oneday_off
    @morning_off_members = Schedule.morning_off
    @afternoon_off_members = Schedule.afternoon_off
    @leaving_early_members = Schedule.leaving_early
  end


  private

  def schedule_params
    params.require(:schedule).permit(:day, :member_id, :attendance, :trip, :go_out, :other, :start_time)
  end

end
