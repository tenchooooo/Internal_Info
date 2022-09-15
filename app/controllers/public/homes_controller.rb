class Public::HomesController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  def top
    @posts = Post.all
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
