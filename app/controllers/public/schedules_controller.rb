class Public::SchedulesController < ApplicationController
  before_action :authenticate_member!
  before_action :member_is_approval

  helper_method :grouping_attendance
  helper_method :grouping_trip
  helper_method :grouping_go_out
  helper_method :grouping_other

  def member_is_approval
    if current_member.is_approval != true
      redirect_to  member_path(current_member.id)
      flash[:alert] = "運営承認前です"
    end
  end

  def new
    @schedule = Schedule.new
  end

  def index
   # @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
   @schedules = Schedule.all


  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.member_id = current_member.id

    if @schedule.save
      redirect_to schedule_path(@schedule.day)
    else
      render :new
    end
  end

  def show
    @day = params[:id]
    @schedules = Schedule.where(day: params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @member = @schedule.member
    if @member != current_member
      redirect_to schedules_path
    end
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

  def grouping_attendance(schedules, attendance)
    total = 0
    schedules.each do |schedule|
      if schedule.attendance == attendance
        total = total + 1
      end
    end
    return total

  end

  def grouping_trip(schedules)
    total = 0
    schedules.each do |schedule|
      if schedule.trip.present?
        total = total + 1
      end
    end
    return total
  end

  def grouping_go_out(schedules)
    total = 0
    schedules.each do |schedule|
      if schedule.go_out.present?
        total = total + 1
      end
    end
    return total
  end

  def grouping_other(schedules)
    other_total = 0
    schedules.each do |schedule|
      if schedule.other.present?
        other_total = other_total + 1
      end
    end
    return other_total
  end



  private

  def schedule_params
    params.require(:schedule).permit(:day, :member_id, :attendance, :trip, :go_out, :other).merge({start_time: params[:schedule][:day]})
  end

end
