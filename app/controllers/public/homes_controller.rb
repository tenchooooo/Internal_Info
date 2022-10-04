class Public::HomesController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  before_action :member_is_approval
  def member_is_approval
    if current_member.is_approval != true
      redirect_to  member_path(current_member.id)
      flash[:alert] = "運営承認前です"
    end
  end

  def top
    @posts = Post.all.page(params[:page]).per(5)
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
end
