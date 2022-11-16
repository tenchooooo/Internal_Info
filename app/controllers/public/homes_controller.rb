class Public::HomesController < ApplicationController
  before_action :authenticate_member!, except: [:top]
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

  def top
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    @posts.each do |post|
      if post.limit.to_s(:datetime_jp) < DateTime.now.to_s(:datetime_jp)
        post.update(browse_status:1)
      end
    end
    now = Time.current
    @schedules = Schedule.where(day: now)
    @schedules.each do |schedule|
      @day = schedule.day
    end
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


end
